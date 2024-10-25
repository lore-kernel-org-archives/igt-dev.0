Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C58D149CD
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 17:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDE710EB66;
	Fri, 25 Oct 2024 17:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EC7ixgFc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021B310EB66
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729878995; x=1761414995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xGrA1iFPd8GJPxraTGH5NtG3EvKbo6M2uXO7SKurLIU=;
 b=EC7ixgFcCO8sy3UTKw1K1JJlNI4H7lt8tFV+tV1S6q6j/e1JvQgB/5FG
 RWBz5edQysSNehs/4ENhJSbltXdo9Jt8hbmcRiCYh/kQtDs41lQsTzDA8
 CeW2BLOhD5sCkzgfChakUPVoBskN19QYfWWVSrm+5VIBxmSSo5vOwPsoQ
 hQqtCsG1Rj8jboWQJaUN5nEXP0FMacHA5lB3YA8CD1VKOmuj9WTDuMJzM
 MFFMhUeeYqKrJuOOfCTEd1UqIoQgwuEf5QXkOCHweyktne+oqK3VVRfiH
 wV421e+RYDOjGqBSW27vEH4dphgbsfzrZsXRRytIP4zOKEqTQAiAHQ6/r Q==;
X-CSE-ConnectionGUID: CWVWXKlpSv+7qEn5pcRw2A==
X-CSE-MsgGUID: 4lu5CwAhS3q7Yjgwi+vmUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="17190435"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="17190435"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:56:35 -0700
X-CSE-ConnectionGUID: rbYcpJSeTV+49aC4a84iZg==
X-CSE-MsgGUID: K/t33NPaQ2S3isfMYGWrsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="80634126"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 10:56:33 -0700
Date: Fri, 25 Oct 2024 19:56:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] /lib/xe/xe_eudebug: Add trigger removal
 method
Message-ID: <20241025175631.skug6x4jeua7jcoh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
References: <20241024120851.328536-1-jan.sokolowski@intel.com>
 <5172f06ba0cc45587cf724035740bf961cd3949f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5172f06ba0cc45587cf724035740bf961cd3949f.camel@intel.com>
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

Hi Grzegorzek,,
On 2024-10-25 at 09:55:09 +0000, Grzegorzek, Dominik wrote:
> On Thu, 2024-10-24 at 12:08 +0000, Jan Sokolowski wrote:
> > Add method xe_eudebug_debugger_remove_trigger to remove
> > trigger from list of triggers.
> > 
> > Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> > Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Not sure why you add this rb beforehand, but anyway you can keep it for both. v2 looks good to me.
> 
> Regards,
> Dominik

Before merge please remove '/' from beginning of both patches,
now it has in subject:

/lib/xe/xe_eudebug: Add trigger removal method

but it should be:

lib/xe/xe_eudebug: Add trigger removal method

Regards,
Kamil

> > Signed-off-by: Dominik Grzegorzk <dominik.grzegorzek@intel.com>
> > ---
> >  lib/xe/xe_eudebug.c | 30 ++++++++++++++++++++++++++++++
> >  lib/xe/xe_eudebug.h |  2 ++
> >  2 files changed, 32 insertions(+)
> > 
> > diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> > index 36763a184..74aa26024 100644
> > --- a/lib/xe/xe_eudebug.c
> > +++ b/lib/xe/xe_eudebug.c
> > @@ -1226,6 +1226,36 @@ void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d,
> >  	igt_debug("added trigger %p\n", t);
> >  }
> >  
> > +/**
> > + * xe_eudebug_debugger_remove_trigger:
> > + * @d: pointer to the debugger
> > + * @type: the type of the event which activates the trigger.
> > + * @fn: function to be removed when event of @type was read by the debugger.
> > + *
> > + * Removes function @fn from the list of triggers activated when event of
> > + * @type has been read by worker.
> > + */
> > +void xe_eudebug_debugger_remove_trigger(struct xe_eudebug_debugger *d,
> > +					int type, xe_eudebug_trigger_fn fn)
> > +{
> > +	struct event_trigger *t;
> > +	bool found = false;
> > +
> > +	igt_list_for_each_entry(t, &d->triggers, link) {
> > +		if (type == t->type && fn == t->fn) {
> > +			igt_list_del(&t->link);
> > +			found = true;
> > +			break;
> > +		}
> > +	}
> > +	if (found) {
> > +		igt_debug("removed trigger %p\n", t);
> > +		free(t);
> > +	} else {
> > +		igt_debug("trigger of type %d was not removed as it's not in the list\n", type);
> > +	}
> > +}
> > +
> >  /**
> >   * xe_eudebug_debugger_start_worker:
> >   * @d: pointer to the debugger
> > diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> > index 6e4666333..9aadbe847 100644
> > --- a/lib/xe/xe_eudebug.h
> > +++ b/lib/xe/xe_eudebug.h
> > @@ -150,6 +150,8 @@ void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d);
> >  void xe_eudebug_debugger_set_data(struct xe_eudebug_debugger *c, void *ptr);
> >  void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
> >  				     xe_eudebug_trigger_fn fn);
> > +void xe_eudebug_debugger_remove_trigger(struct xe_eudebug_debugger *d, int type,
> > +				     xe_eudebug_trigger_fn fn);
> >  void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
> >  void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage);
> >  
> 
