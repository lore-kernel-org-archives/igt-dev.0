Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D9F10E621
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 12:15:54 +0000 (UTC)
Date: Fri, 15 Sep 2023 14:15:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230915121527.wo2eni6f4vlivyle@kamilkon-desk.igk.intel.com>
References: <20230915071155.432521-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915071155.432521-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] docs/cross-building.txt: add
 documentation about cross-builds
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

thank you for documenting this.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

On 2023-09-15 at 09:11:55 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Cross-building IGT is not too trivial, as one needs to prepare
> a sysroot directory containing not only glibc but also other
> libraries. Document how to do it for IGT.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  docs/cross-building.txt | 122 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 docs/cross-building.txt
> 
> diff --git a/docs/cross-building.txt b/docs/cross-building.txt
> new file mode 100644
> index 000000000000..2c0e3caf30e9
> --- /dev/null
> +++ b/docs/cross-building.txt
> @@ -0,0 +1,122 @@
> +Producing an IGT for another architecture
> +=========================================
> +
> +Cross-build toolchain
> +---------------------
> +
> +Producing cross-builds require installing a toolchain with support
> +to the target architecture, or a toolchain built for the target,
> +plus an emulator (like qemu). In the case of IGT, the minimal toolchain
> +is GCC and binutils. For instance, on Fedora, to cross-build with arm64
> +as the target architecture, those packages are needed:
> +
> +	binutils-aarch64-linux-gnu
> +	gcc-aarch64-linux-gnu
> +
> +There are also tarballs with cross-compiler chains that can be used
> +instead, like:
> +
> +	https://toolchains.bootlin.com/
> +
> +System root directory (sysroot)
> +-------------------------------
> +
> +Besides a toolchain, a system root directory containing the libraries
> +used by IGT pre-compiled to the target architecture is required.
> +
> +This can be obtained by either cross-building a distribution using
> +Yocto, buildroot or similar, or by copying the system root from
> +an existing installation for the desired architecture, containing
> +the IGT needed build time and runtime library dependencies.
> +
> +Please notice that cross-build toolchains may require some
> +dependent object files and libraries used by it to also be copied
> +to the system root directory. For instance, in the case of Fedora,
> +the files are located  under /usr/aarch64-linux-gnu/sys-root/
> +(for aarch64 architecture) shall also be stored at the sysroot
> +directory used by Meson, as otherwise the preparation step will fail.
> +
> +Meson preparation
> +-----------------
> +
> +Meson requires an extra configuration file to be used for
> +non-native builds. This is passed via --cross-file parameter to it.
> +
> +Such file contains details about the target OS/architecture, about
> +the host (native) OS/architecture and declares the location of
> +sysroot:
> +
> +- the [host_machine] section defines the system and architecture from
> +  the native OS;
> +  At the example below, the native OS is Linux x86_64 architecture.
> +- the [target_machine] section contains details about the target
> +  OS/architecture.
> +  At the example below, the target is aarch64 (arm 64 bits architecture).
> +- the [constants] section is optional, but it helps to use the sysroot
> +  path directory on multiple keys at the [properties] section;
> +- the [properties] section contains arguments to be used by the
> +  the binaries;
> +- the [binaries] section contains the binaries to be used during the
> +  build. It can either be a native or a target toolchain.
> +  If a target toolchan is used, an exe_wrapper key pointing to an arch
> +  emulalor like qemu-arm is needed.
> +
> +The sysroot directory is where IGT dependent libraries and header
> +files, compiled for a given architecture, are stored. At the example
> +below, the sysroot is /aarch64-sysroot.
> +
> +Preparing for cross compilation is done by calling meson with the
> +cross-compilation config file name, plus a build directory:
> +
> +	meson --cross-file arm64_cross.txt build
> +
> +The actual compilation can then be done using ninja:
> +
> +	ninja -C build
> +
> +Please notice that some parts of the IGT build are disabled during
> +cross-compilation, like testlist file creation and documentation,
> +as such steps depend on running the generated code at the native
> +machine.
> +
> +The IGT root directory has already 3 examples that uses qemu to
> +run a target-OS machine toolchain:
> +
> +	meson-cross-arm64.txt
> +	meson-cross-armhf.txt
> +	meson-cross-mips.txt
> +
> +The example below contains cross-build instructions when using
> +a native cross-build toolchain.
> +
> +Example: arm64_cross.txt with a native cross-builder toolchain
> +--------------------------------------------------------------
> +
> +[constants]
> +sysroot = '/aarch64-sysroot'
> +common_args = ['--sysroot=' + sysroot]
> +
> +[properties]
> +sys_root = sysroot
> +c_args = common_args
> +c_link_args = common_args
> +pkg_config_libdir = [sysroot + '/usr/lib64/pkgconfig', sysroot +'/usr/share/pkgconfig', sysroot +'/usr/local/lib/pkgconfig']
> +
> +[binaries]
> +c = '/usr/bin/aarch64-linux-gnu-gcc'
> +ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
> +ld = '/usr/bin/aarch64-linux-gnu-ld'
> +strip = '/usr/bin/aarch64-linux-gnu-strip'
> +pkgconfig = 'pkg-config'
> +
> +[host_machine]
> +system = 'linux'
> +cpu_family = 'x86_64'
> +cpu = 'x86_64'
> +endian = 'little'
> +
> +[target_machine]
> +system = 'linux'
> +cpu_family = 'aarch64'
> +cpu = 'aarch64'
> +endian = 'little'
> -- 
> 2.41.0
> 

