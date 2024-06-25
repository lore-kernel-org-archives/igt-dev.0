Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A50C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 09:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82AB10E262;
	Tue, 25 Jun 2024 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUMoXubC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C791110E262
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719309513; x=1750845513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k5717jKxi4lDb8kgvkmgrXOrpUuXQfMZtzMxEQM5Tvg=;
 b=CUMoXubCVIAEp6+EzlahsFN7LSiNahsED/2jwpPFcuBn3OaJ2Ybs+m/k
 7yy1LXCuuzT23QlPAgPG42/1IN7Uec9pnds76srbZLQ+Cfq5QuHdU41TJ
 WGG0fW5XULulKU5EQrXRd8NS1pRNmkOphr4FwR3U7kId+xs1zkqxlj+b7
 VWoTt5ZJf8+wvH0vMp97knLa/XZWq/xDchd05Eu2lDhYY6z3tEOGrNod5
 vhkKEG5XkKdeIMxPgU5Fdd32+R69WF1wZq9111hLlxqNJct3iJhdxE+Ha
 +9TZqmvotx7fCp48qvzyZ9HLUnD1ZaQbHQ9wSfO/Dgvx9TUO5VE6qIIWQ g==;
X-CSE-ConnectionGUID: W3SmB1Q+TH2+gJkfZW7n/g==
X-CSE-MsgGUID: Z+rI9yMbQ764gnRNmAYhKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16001912"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16001912"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:58:32 -0700
X-CSE-ConnectionGUID: OpmRBRF2Roishrp9GiO7oA==
X-CSE-MsgGUID: VJcG4MmWQpCW+bkGpJB8lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="74795731"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:58:30 -0700
Date: Tue, 25 Jun 2024 11:58:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: Re: [i-g-t V2 1/3] tests/panfrost: Move Panfrost tests to new dir
Message-ID: <20240625095827.mgjuhf27bck7dh6w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
References: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
 <20240612070335.3758500-2-bhanuprakash.modem@intel.com>
 <20240618083952.ox46lkc34o6ebzap@kamilkon-DESK.igk.intel.com>
 <5666aeb3-8b61-4686-b250-6ea758d9c9da@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5666aeb3-8b61-4686-b250-6ea758d9c9da@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Modem,,
On 2024-06-25 at 10:26:59 +0530, Modem, Bhanuprakash wrote:
> Hi All,
> 
> I'm going to merge this series, please let me know if you have any concerns.
> 
> - Bhanu

Feel free to merge, remember to clarify in description that
this also moves generated binaries.

Regards,
Kamil

> 
> On 18-06-2024 02:09 pm, Kamil Konieczny wrote:
> > Hi Bhanuprakash,
> > On 2024-06-12 at 12:33:33 +0530, Bhanuprakash Modem wrote:
> > > Move all Panfrost specific tests (tests/panfrost_*) to
> > > new dir (tests/panfrost/panfrost_*).
> > 
> > Add also here that binaries will be placed in subdir
> > <build>/tests/panfrost
> > 
> > > 
> > 
> > + Cc: Helen Koike <helen.koike@collabora.com>
> > 
> > Regards,
> > Kamil
> > 
> > > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > > Cc: Alyssa Rosenzweig <alyssa@collabora.com>
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >   meson.build                               |  8 ++++++++
> > >   tests/meson.build                         |  6 ++----
> > >   tests/panfrost/meson.build                | 15 +++++++++++++++
> > >   tests/{ => panfrost}/panfrost_gem_new.c   |  0
> > >   tests/{ => panfrost}/panfrost_get_param.c |  0
> > >   tests/{ => panfrost}/panfrost_prime.c     |  0
> > >   tests/{ => panfrost}/panfrost_submit.c    |  0
> > >   7 files changed, 25 insertions(+), 4 deletions(-)
> > >   create mode 100644 tests/panfrost/meson.build
> > >   rename tests/{ => panfrost}/panfrost_gem_new.c (100%)
> > >   rename tests/{ => panfrost}/panfrost_get_param.c (100%)
> > >   rename tests/{ => panfrost}/panfrost_prime.c (100%)
> > >   rename tests/{ => panfrost}/panfrost_submit.c (100%)
> > > 
> > > diff --git a/meson.build b/meson.build
> > > index ab44aadb1..701a5cc35 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -276,6 +276,7 @@ includedir = get_option('includedir')
> > >   libdir = get_option('libdir')
> > >   libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
> > >   amdgpudir = join_paths(libexecdir, 'amdgpu')
> > > +panfrostdir = join_paths(libexecdir, 'panfrost')
> > >   v3ddir = join_paths(libexecdir, 'v3d')
> > >   vc4dir = join_paths(libexecdir, 'vc4')
> > >   vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
> > > @@ -315,6 +316,12 @@ if get_option('use_rpath')
> > >   	endforeach
> > >   	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
> > > +	panfrost_rpathdir = '$ORIGIN'
> > > +	foreach p : panfrostdir.split('/')
> > > +		panfrost_rpathdir = join_paths(panfrost_rpathdir, '..')
> > > +	endforeach
> > > +	panfrost_rpathdir = join_paths(panfrost_rpathdir, libdir)
> > > +
> > >   	v3d_rpathdir = '$ORIGIN'
> > >   	foreach p : v3ddir.split('/')
> > >   		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
> > > @@ -336,6 +343,7 @@ else
> > >   	bindir_rpathdir = ''
> > >   	libexecdir_rpathdir = ''
> > >   	amdgpudir_rpathdir = ''
> > > +	panfrost_rpathdir = ''
> > >   	v3d_rpathdir = ''
> > >   	vc4_rpathdir = ''
> > >   	vmwgfx_rpathdir = ''
> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index 758ae090c..16896de99 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -65,10 +65,6 @@ test_progs = [
> > >   	'kms_vrr',
> > >   	'kms_writeback',
> > >   	'meta_test',
> > > -	'panfrost_get_param',
> > > -	'panfrost_gem_new',
> > > -	'panfrost_prime',
> > > -	'panfrost_submit',
> > >   	'prime_udl',
> > >   	'prime_vgem',
> > >   	'sriov_basic',
> > > @@ -461,6 +457,8 @@ endif
> > >   subdir('amdgpu')
> > > +subdir('panfrost')
> > > +
> > >   subdir('v3d')
> > >   subdir('vc4')
> > > diff --git a/tests/panfrost/meson.build b/tests/panfrost/meson.build
> > > new file mode 100644
> > > index 000000000..b633d1be9
> > > --- /dev/null
> > > +++ b/tests/panfrost/meson.build
> > > @@ -0,0 +1,15 @@
> > > +panfrost_progs = [
> > > +	'panfrost_get_param',
> > > +	'panfrost_gem_new',
> > > +	'panfrost_prime',
> > > +	'panfrost_submit',
> > > +]
> > > +
> > > +foreach prog : panfrost_progs
> > > +	test_executables += executable(prog, prog + '.c',
> > > +				       dependencies : test_deps,
> > > +				       install_dir : panfrostdir,
> > > +				       install_rpath : panfrost_rpathdir,
> > > +				       install : true)
> > > +	test_list += join_paths('panfrost', prog)
> > > +endforeach
> > > diff --git a/tests/panfrost_gem_new.c b/tests/panfrost/panfrost_gem_new.c
> > > similarity index 100%
> > > rename from tests/panfrost_gem_new.c
> > > rename to tests/panfrost/panfrost_gem_new.c
> > > diff --git a/tests/panfrost_get_param.c b/tests/panfrost/panfrost_get_param.c
> > > similarity index 100%
> > > rename from tests/panfrost_get_param.c
> > > rename to tests/panfrost/panfrost_get_param.c
> > > diff --git a/tests/panfrost_prime.c b/tests/panfrost/panfrost_prime.c
> > > similarity index 100%
> > > rename from tests/panfrost_prime.c
> > > rename to tests/panfrost/panfrost_prime.c
> > > diff --git a/tests/panfrost_submit.c b/tests/panfrost/panfrost_submit.c
> > > similarity index 100%
> > > rename from tests/panfrost_submit.c
> > > rename to tests/panfrost/panfrost_submit.c
> > > -- 
> > > 2.43.2
> > > 
