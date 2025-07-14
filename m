Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140EC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 11:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F3310E17A;
	Mon, 14 Jul 2025 11:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOfeDNlI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6B210E17A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752494177; x=1784030177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1RxNKK/2O/KJyqV7YlO6mMfyJSgM6Wm1gQGVokBInlw=;
 b=SOfeDNlIO6475sx6CfTCu7AlZ7H7NVb3YxvhBWvLgbENfug1zsrEyETl
 6EvhfKqCeKOdoip3kp+DY8NPi4TTBANxkbxtak7PlCbq0bniRYkSOkAM7
 OWyGgj4Y6zaCp4vL6jGEr9tVZ/tuvmgvKU2Ia7r+IE0gYtet1FOmHQbHt
 Es0ePFq+6xUill5DZqoMCTFBNzNYvQc3CAlplzkNnXT2ZfdNF74CZPE2r
 kKdjp2g3vY7DsRbqDz/6/9aged7k6cmo+qyrxee+AWMQVtpu8Nw+Lr4L4
 J6gi9AvCDU6g+XX9iGr3c50k3+frCw/OTQlbFrAInLiR9J/pW3aUot/xJ w==;
X-CSE-ConnectionGUID: zDsxx1fmR0+MViKJHAeNKA==
X-CSE-MsgGUID: 5mRQX3ALSumbefsy8UGgoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="42317213"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="42317213"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 04:56:16 -0700
X-CSE-ConnectionGUID: vmuLpWGdQMCLg2ClFLDjRw==
X-CSE-MsgGUID: KOi6OqcBQamaVctC0IeK8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="157257870"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 04:56:15 -0700
Date: Mon, 14 Jul 2025 13:56:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>
Cc: "B, Jeevan" <jeevan.b@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP
 before selecting default mode
Message-ID: <20250714115612.xouhsgkko26zs5fu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Grzelak, Michal" <michal.grzelak@intel.com>,
 "B, Jeevan" <jeevan.b@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250613054848.3279961-1-jeevan.b@intel.com>
 <SJ0PR11MB507248333ECA5D7E74CE9B118F70A@SJ0PR11MB5072.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ0PR11MB507248333ECA5D7E74CE9B118F70A@SJ0PR11MB5072.namprd11.prod.outlook.com>
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

Hi Grzelak,,
On 2025-06-16 at 18:35:26 +0000, Grzelak, Michal wrote:
> Hi Jeevan,
> 
> >From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
> >Sent: Friday, June 13, 2025 7:49 AM
> >To: igt-dev@lists.freedesktop.org
> >Cc: B, Jeevan <jeevan.b@intel.com>
> >Subject: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP before selecting default mode
> >
> >This change finds a common mode for eDP before falling back to default mode.
> >It avoids unnecessary failures by not selecting an unsupported mode for eDP.
> >
> >Signed-off-by: Jeevan B <jeevan.b@intel.com>
> >---
> > tests/kms_setmode.c | 15 +++++++++++++++
> > 1 file changed, 15 insertions(+)
> >
> >diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index 484c3a95f..6e7e5942a 100644
> >--- a/tests/kms_setmode.c
> >+++ b/tests/kms_setmode.c
> >@@ -252,6 +252,21 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
> > 			goto found;
> > 	}
> > 
> >+	/*
> >+	 * If eDP is present, try its modes to find a compatible one.
> >+	 */
> >+	for (int c = 0; c < crtc->connector_count; c++) {
> >+		drmModeConnector *conn = crtc->cconfs[c].connector;
> >+		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
> >+			for (i = 0; i < conn->count_modes; i++) {
> >+				mode = &conn->modes[i];
> >+				if (crtc_supports_mode(crtc, mode))
> >+					goto found;
> >+			}
> >+		break;

Ugh, sorry for not reading your code close enough, one nit here.
Why 'break' ? Could it have any more eDP connectors?

Regards,
Kamil

> >+		}
> >+	}
> >+
> > 	/*
> > 	 * If none is found then just pick the default mode from all connectors
> > 	 * with the smallest clock, hope the other connectors can support it by
> >--
> >2.25.1
> 
> This patch looks good to me.
> Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
> 
> Best regards,
> Michał
