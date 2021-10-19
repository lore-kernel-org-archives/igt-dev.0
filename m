Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0C16EB54
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 08:40:50 +0000 (UTC)
Date: Tue, 19 Oct 2021 11:39:18 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YW6ENsIG0Ez8pVr6@platvala-desk.ger.corp.intel.com>
References: <20211015203238.133163-1-casey.g.bowman@intel.com>
 <20211015203238.133163-2-casey.g.bowman@intel.com>
 <YW1Yvg8GsFcHzwfu@platvala-desk.ger.corp.intel.com>
 <4d4be3f0-d8f4-7af9-7bea-031a5cf15947@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d4be3f0-d8f4-7af9-7bea-031a5cf15947@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] Alter arm64 cross compile
 pkg-config library selections
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Casey Bowman <casey.g.bowman@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com, ashutosh.dixit@intel.com, wayne.boyer@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 09:43:45AM -0700, Casey Bowman wrote:
> 
> On 10/18/21 4:21 AM, Petri Latvala wrote:
> > On Fri, Oct 15, 2021 at 01:32:37PM -0700, Casey Bowman wrote:
> > > Specifies to use 'aarch64-linux-gnu-pkg-config' as the
> > > pkg-config binary to use, as the normal /usr/bin/pkg-config
> > > binary will be used on a host system. If we use this binary
> > > we will observe that the shared object libraries will be
> > > pulled from the x86_64 libraries instead of the aarch64 ones.
> > PKG_CONFIG_PATH can also be set accordingly, as is done in
> > .gitlab-ci.yml
> > 
> > > We also specify nouveau here as our libdrm driver library
> > > because there is no support for libdrm-intel on arm64 yet.
> > Why the automatic option doesn't work here? There's no reason to
> > limit/enforce everyone to libdrm-nouveau, and only libdrm-nouveau.
> > 
> > 
> You are right, the automatic option did work when the correct
> pkg-config binary was in use. But this failed for me when I
> only set PKG_CONFIG_PATH.
> 
> In the meson-log.txt file, with this patch reverted, I saw:
> 
> Run-time dependency libdrm found: YES 2.4.105
> Pkg-config binary for MachineChoice.HOST is cached.
> Determining dependency 'libdrm_intel' with pkg-config executable
> '/usr/bin/pkg-config'
> env[PKG_CONFIG_PATH]: /usr/lib/aarch64-linux-gnu/pkgconfig/
> Called `/usr/bin/pkg-config --modversion libdrm_intel` -> 0
> 2.4.105
> env[PKG_CONFIG_PATH]: /usr/lib/aarch64-linux-gnu/pkgconfig/
> Called `/usr/bin/pkg-config --cflags libdrm_intel` -> 0
> -I/usr/include/libdrm
> env[PKG_CONFIG_PATH]: /usr/lib/aarch64-linux-gnu/pkgconfig/
> env[PKG_CONFIG_ALLOW_SYSTEM_LIBS]: 1
> Called `/usr/bin/pkg-config --libs libdrm_intel` -> 0
> -L/usr/lib/aarch64-linux-gnu -L/usr/lib/x86_64-linux-gnu -ldrm_intel -ldrm
> env[PKG_CONFIG_PATH]: /usr/lib/aarch64-linux-gnu/pkgconfig/
> Called `/usr/bin/pkg-config --libs libdrm_intel` -> 0
> -L/usr/lib/aarch64-linux-gnu -ldrm_intel -ldrm
> Run-time dependency libdrm_intel found: YES 2.4.105
> 
> I also observed the same issues with valgrind, xmlrpc-c-config,
> and more.
> 
> In my setup, I'm not seeing the arm64 pkg-config binary used
> properly when using PKG_CONFIG_PATH, do you see different
> behavior or have a suggestion for this?
> 


As I replied to Lucas, I now understand that setting the binary is the
more correct thing to do and gitlab-CI working with this setup is
accidental.


-- 
Petri Latvala
