Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD736E0DC
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 16:55:39 +0000 (UTC)
Date: Mon, 18 Oct 2021 09:55:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20211018165537.2visea3swpthj6gi@ldmartin-desk2>
References: <20211015203238.133163-1-casey.g.bowman@intel.com>
 <20211015203238.133163-2-casey.g.bowman@intel.com>
 <YW1Yvg8GsFcHzwfu@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YW1Yvg8GsFcHzwfu@platvala-desk.ger.corp.intel.com>
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: Casey Bowman <casey.g.bowman@intel.com>, igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com, wayne.boyer@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 02:21:34PM +0300, Petri Latvala wrote:
>On Fri, Oct 15, 2021 at 01:32:37PM -0700, Casey Bowman wrote:
>> Specifies to use 'aarch64-linux-gnu-pkg-config' as the
>> pkg-config binary to use, as the normal /usr/bin/pkg-config
>> binary will be used on a host system. If we use this binary
>> we will observe that the shared object libraries will be
>> pulled from the x86_64 libraries instead of the aarch64 ones.
>
>PKG_CONFIG_PATH can also be set accordingly, as is done in
>.gitlab-ci.yml

is this something generally not setup in all distros?  using
arch + -pkg-config matches the documentation at
https://mesonbuild.com/Machine-files.html

Indeed, checking my archlinux installation it seems I don't have a
aarch64-linux-gnu-pkg-config and nothing provides it (even though there
is a aarch64 crosscompiler). It looks like I even mentioned this issue
in the past for another project at https://politreco.com/2019/09/side-load-on-embedded-linux-with-buildroot/

I wonder if we could rather set pkg_config_libdir like mentioned in
https://mesonbuild.com/Cross-compilation.html and be compatible out of
the box with more distros.

>
>>
>> We also specify nouveau here as our libdrm driver library
>> because there is no support for libdrm-intel on arm64 yet.
>
>Why the automatic option doesn't work here? There's no reason to
>limit/enforce everyone to libdrm-nouveau, and only libdrm-nouveau.
>

agreed.

Lucas De Marchi
