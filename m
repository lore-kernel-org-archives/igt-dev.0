Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49693C44520
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 12:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA67D10E18F;
	Mon, 20 Jul 2026 12:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lnxeqwqi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55C2890B2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784550373; x=1816086373;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EFzVmdbtIV+RRkMe8hascsw1qYCIwIMF2N5dWTKZF2I=;
 b=LnxeqwqiRMNo9emwrm/rYOTzdz3HTTnTIUPomAmMW97Z1f1PqKSr7QkT
 r6S8cU/Z2TimMp6AZcr6R5TInN3zxxFbT2aRQ1uxiLalynrHASa72Rg4x
 f2lT1qNHpYiLCjpmHo87RH97TazyJDwKfOojxAmIiLVj5nnVgcXZzUk9I
 XwHX9DIcI+fsWG3Z1DQIx4QCJkvukTJXANIR9g/mM/1iNuz/zqD+K8BYz
 SlWzb6X/IG+u0PXxCqlQHUtGTpZfGg0PXR6tKEojJZcS67bV3XUBGt6VU
 q5jO8O+ParWRP/0LAgFKrb3zVfIs+qRZFlKKLe3uNHlgipKkrOHxMum40 g==;
X-CSE-ConnectionGUID: LvJL253HR8ehfQtji71Ezw==
X-CSE-MsgGUID: Lp3SIHAATYGsF+Gs3m1C5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="87669446"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="87669446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 05:26:12 -0700
X-CSE-ConnectionGUID: cKsgch6jRSqRa1ZHY4KYcg==
X-CSE-MsgGUID: HrGbcDoJS0WOtgwmi06Z9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="257507437"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 05:26:09 -0700
Date: Mon, 20 Jul 2026 14:25:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 1/3] android: Implement lightweight GKeyFile INI string
 parser in glib shim
Message-ID: <20260720122552.gkc3zs3ufhkabbsz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20260715192949.1984280-1-markyacoub@google.com>
 <11a2d7a3-bee7-4533-a29f-d9a7f9b9e154@bootlin.com>
 <20260717101803.lef2fjwyrptuq6ol@kamilkon-DESK.igk.intel.com>
 <b324163f-69d1-4f4b-b4ad-f48df1fc0bfb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b324163f-69d1-4f4b-b4ad-f48df1fc0bfb@bootlin.com>
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

Hi Louis,
On 2026-07-17 at 21:23:17 +0200, Louis Chauvet wrote:
> 
> 
> On 7/17/26 12:18, Kamil Konieczny wrote:
> > Hi Louis,
> > On 2026-07-17 at 10:20:30 +0200, Louis Chauvet wrote:
> > > 
> > > 
> > > On 7/15/26 21:29, Mark Yacoub wrote:
> > > > [Why]
> > > > Android's Bionic C library lacks libglib2, requiring IGT to build against
> > > > an Android-specific mock header (include/android/glib.h). The existing mock
> > > > implementation of GKeyFile and g_key_file_load_from_file is a hardcoded
> > > > no-op returning NULL, which prevents tests relying on configuration files
> > > > (such as .igtrc) from dynamically retrieving values on Android.
> > > 
> > > Hello Mark,
> > > 
> > > I don't think it's a good idea to keep a custom parser inside IGT that isn't
> > > always used, especially when it behaves differently (no character escaping,
> > > first key value is used versus the last, 1/true/yes versus 1/true for
> > > booleans, spaces around =, etc.).
> > > 
> > > I agree that external dependencies can be a pain to manage and are sometimes
> > > unavailable. After a quick look, extracting the full GLib parser doesn't
> > > seem feasible (it's tightly coupled to GLib internals). However, IGT could
> > > easily implement a minimal subset, as you have already done. That way, GLib
> > > would only be required for a few tests.
> > > 
> > > I don't know what maintainers thinks about it?
> > > 
> > 
> > This is a good idea to have as little as possible number of
> > external libs linked. I am afraid removing glib would be hard as
> > there are some other parts used in igt, like udev changes
> > monitoring.
> 
> I did not explore the whole codebase, just android/glib.h. I think that the
> tests requiring udev don't use glib but libudev?
> 
> > What about placing this code in lib with name igt_ini.c?
> > Or igt_config.c?
> 
> There is already igt_rc.h, why not igt_rc.c?
> 

Right, it is a good place. +cc Sebastian Brzezinka <sebastian.brzezinka@intel.com>

Regards,
Kamil

> > +cc Ashutosh, Karthik, Swati and Zbigniew
> > 
> > > > [How]
> > > > Expand the dummy GKeyFile structure to record the file path upon calling
> > > > g_key_file_load_from_file. Implement a minimal internal INI parser function
> > > > (__android_g_key_file_get) inside g_key_file_get_string to traverse the file
> > > > line-by-line, matching requested [group] and key strings, stripping trailing
> > > > newlines, and returning a heap-allocated duplicate string (strdup).
> > > > 
> > > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > 
> > > Anyway, if there is a v2 of this patch, can you run checkpatch and fix the
> > > issues?
> > > 
> > > > ---
> > > >    include/android/glib.h | 120 +++++++++++++++++++++++++++++++++++++----
> > > >    1 file changed, 111 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/include/android/glib.h b/include/android/glib.h
> > > > index 0b6658287..5b8ba86c7 100644
> > > > --- a/include/android/glib.h
> > > > +++ b/include/android/glib.h
> > > > @@ -16,8 +16,7 @@ typedef struct _GError {
> > > >    } GError;
> > > >    typedef struct _GKeyFile {
> > > > -	char *key;
> > > > -	char *value;
> > > > +	char path[512];
> > 
> > Why did you drop key/value from here?
> > 
> > > >    } GKeyFile;
> > > >    typedef struct _GMatchInfo {
> > [cut]
> > 
> > Regards,
> > Kamil
> 
