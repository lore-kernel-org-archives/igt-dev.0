Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7756AC44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 10:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C7510E424;
	Fri, 17 Jul 2026 10:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZJpMXFb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FA210E424
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784283503; x=1815819503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0WcnqPZiq4oGkXTs90zJHVRUvx1GxjxM/VLQFmMlo9w=;
 b=UZJpMXFbYUULZ5hb/l/v+cMIeepbPETpqgRgDm0zHedvQZUN8LxkKtmr
 NRG5yTO4GePK0qvu6tt725lEXRjXCRa4qZwmNoH+2WC7r1/KzdKuTowJH
 gE2GrAZpM7jfuJvLQhyA9V1ZIdvh55/jxVPr7coDHhKxU4JqAZCXzgvul
 IhQdcbEeIpbb5VnxE8a/a6Im6MYGm+hp6CO+ZTTfxjnDz9RxKcak1cK0J
 MSWiuU3/G8KwvM0M0bGxY4xFEY8cfUvhvkacl0+a5D7JM20WssbGD5UiB
 QY23DPRcgSUNe+NUGVVWi/5oMU2JtAB5kNa8v9uk8fcLPe1iSjeXURfEB Q==;
X-CSE-ConnectionGUID: SP2Nl5TESeWmqivX0dZkEg==
X-CSE-MsgGUID: XTDxDi9JSgu3zOuuMXPvGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84075253"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84075253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 03:18:22 -0700
X-CSE-ConnectionGUID: nrfuKypoSramGP75kUMcAw==
X-CSE-MsgGUID: GKr47lw2QUSmwYbWEx2ePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="255596155"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:18:21 -0700
Date: Fri, 17 Jul 2026 12:18:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 1/3] android: Implement lightweight GKeyFile INI string
 parser in glib shim
Message-ID: <20260717101803.lef2fjwyrptuq6ol@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20260715192949.1984280-1-markyacoub@google.com>
 <11a2d7a3-bee7-4533-a29f-d9a7f9b9e154@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11a2d7a3-bee7-4533-a29f-d9a7f9b9e154@bootlin.com>
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
On 2026-07-17 at 10:20:30 +0200, Louis Chauvet wrote:
> 
> 
> On 7/15/26 21:29, Mark Yacoub wrote:
> > [Why]
> > Android's Bionic C library lacks libglib2, requiring IGT to build against
> > an Android-specific mock header (include/android/glib.h). The existing mock
> > implementation of GKeyFile and g_key_file_load_from_file is a hardcoded
> > no-op returning NULL, which prevents tests relying on configuration files
> > (such as .igtrc) from dynamically retrieving values on Android.
> 
> Hello Mark,
> 
> I don't think it's a good idea to keep a custom parser inside IGT that isn't
> always used, especially when it behaves differently (no character escaping,
> first key value is used versus the last, 1/true/yes versus 1/true for
> booleans, spaces around =, etc.).
> 
> I agree that external dependencies can be a pain to manage and are sometimes
> unavailable. After a quick look, extracting the full GLib parser doesn't
> seem feasible (it's tightly coupled to GLib internals). However, IGT could
> easily implement a minimal subset, as you have already done. That way, GLib
> would only be required for a few tests.
> 
> I don't know what maintainers thinks about it?
> 

This is a good idea to have as little as possible number of
external libs linked. I am afraid removing glib would be hard as
there are some other parts used in igt, like udev changes
monitoring.

What about placing this code in lib with name igt_ini.c?
Or igt_config.c?

+cc Ashutosh, Karthik, Swati and Zbigniew

> > [How]
> > Expand the dummy GKeyFile structure to record the file path upon calling
> > g_key_file_load_from_file. Implement a minimal internal INI parser function
> > (__android_g_key_file_get) inside g_key_file_get_string to traverse the file
> > line-by-line, matching requested [group] and key strings, stripping trailing
> > newlines, and returning a heap-allocated duplicate string (strdup).
> > 
> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> 
> Anyway, if there is a v2 of this patch, can you run checkpatch and fix the
> issues?
> 
> > ---
> >   include/android/glib.h | 120 +++++++++++++++++++++++++++++++++++++----
> >   1 file changed, 111 insertions(+), 9 deletions(-)
> > 
> > diff --git a/include/android/glib.h b/include/android/glib.h
> > index 0b6658287..5b8ba86c7 100644
> > --- a/include/android/glib.h
> > +++ b/include/android/glib.h
> > @@ -16,8 +16,7 @@ typedef struct _GError {
> >   } GError;
> >   typedef struct _GKeyFile {
> > -	char *key;
> > -	char *value;
> > +	char path[512];

Why did you drop key/value from here?

> >   } GKeyFile;
> >   typedef struct _GMatchInfo {
[cut]

Regards,
Kamil
