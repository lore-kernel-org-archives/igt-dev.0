Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80ECC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 14:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B2910E22E;
	Mon, 12 Aug 2024 14:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ev/iApT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106A010E22E
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723471584; x=1755007584;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QPd91VoRGd9zze9Wc0lzX8Q6TXVoUsghUwRlrqB8PyI=;
 b=Ev/iApT/CKnyDJepQIj8pk8GMfZYTopT2MrPhlQI5vrIDGaEtUpzTMgF
 OAnPnioE1/4vBV+s6MCgJKFJt7PUO/Zsa5PY0q4NQiE/bdoEl004arhnv
 ipILgCt86q2fPXWFakksJGmc7c22dWt+KdtB+WwS5ZWqGLMLFIQ6peQht
 z0MSiHbRgNAv8XirjXqHn0X4sbY+KIFxIZFjEsPgWkiP0oUl7waglpuQZ
 EvtSmwGxboT718015YXKNtzPnXQ2hByg03jXgVfC4TwomMuRz3WwFFn4r
 7XFFD0eeUp/9Rn2xSd05o3Xq7/9CFyVgzfeEhcs8MR7SVhoMCdykh9JFV g==;
X-CSE-ConnectionGUID: GMqcUVsmTUuoySdoL8IFIQ==
X-CSE-MsgGUID: QSWghaAXRiGLedsN+5b1lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21745370"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="21745370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:06:23 -0700
X-CSE-ConnectionGUID: mv8a+MoRRoOXoVsx9VBWdA==
X-CSE-MsgGUID: dBzyA32mSDeoqkmq7gXbeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="88913126"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 07:06:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 07:06:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 07:06:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 07:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7jLDHZM3JwYzw0HHPg69ae9bxzhL+MJwJ1rLygrDwPjD5NckmAQry1HK9FKSlxBnfl7Tav+nxSixuQ70mwiRCXWbglZynKr6yx0Lq62ZF1RpHeS0/pcBbfvecd5f/rz3RvvR2kL6w0QUQePeevB6suxRJGBT0pqW3XRyXwf1qu4vPx76vhB24rFyoE3FhzlZQbOjxjhd2adZx3o6xlKAqeeb/B6CCreDLziEasIx/RzmlhdhvJ2h0mZLmEdZ1lqs8Gl3QEuzegyeXKTBPdBkx9T/BiiqdYf9pke/yBMuAwOi2F7OwGgkVNROeeuuBVSGPir2igIYFXxFHFngvP8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPd91VoRGd9zze9Wc0lzX8Q6TXVoUsghUwRlrqB8PyI=;
 b=ud5dSspItX1Uq7g/6EGtEpgXGqVa4gURSwAFCXQhv0gAJTTw7W4E3Au6x/BAc73ir80zeIejxbuRddvuc410tt9BtUvh1m1YjwBLy5nflniJyPPJzFSN4HV+U1eyZJUFExq11+FdqOl8YvW2O3XvdQW+tEMf22LseZwqp/DSKZ42LMkxUjqNeFEJi+2dJ0liatVZysXmA8iYQnAj394RjYikwz9PGFwhmY9Js5d0NjmYZCA6ZdnvQpBGfxyOyzAFgRcBOA6JiibAUbYo89nD/7iW1edxFHxzdaZGDYnunwDhPk4PWPfb/5/df1sNJYnAIAH+O51xKYlqqRgbWxjhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 12 Aug
 2024 14:06:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 14:06:20 +0000
Date: Mon, 12 Aug 2024 09:06:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 6/6] runner: Allow multiple --hook options
Message-ID: <7fr5rt3nu4x3uygejhpl3ixftydxauwdzbx242ummd6najombp@foyxc56g7a7u>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
 <20240725142028.51735-7-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725142028.51735-7-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW2PR2101CA0003.namprd21.prod.outlook.com
 (2603:10b6:302:1::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: ddcdd11d-3b1d-44a5-a9fb-08dcbad7f10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YwfgwHtIfIkBlhrT113+mwK+NvwRXt0T7+bFjXWzZhOEvUeWFvzFsgk8YOX5?=
 =?us-ascii?Q?ZKWkz2UWEqXnX/JMaEz29pISDEThF04E0pg8nKYJB+o63ZxNL16SyIG9B4mm?=
 =?us-ascii?Q?WAIEp/gDR3otp3GfdQnXUj10P8cj1I1PsN/CeAiB0/opKFJ4Naq9azBpmh+j?=
 =?us-ascii?Q?zSFK4hEXpZG+Ouo2tUxQfyFtJxpRweWTE4x5CLatICspXNB760uyRKor8WzJ?=
 =?us-ascii?Q?DgpC3HjufQctgTDfAX9vg+7T24pmngHF6a7iNUFDMOMQ2vsp3NnAUfTVvO1K?=
 =?us-ascii?Q?vcXBQB6tVt+6/gc1bSpYE0mD06dR9sKfDxEk0DsVp+xdXKL5u4l2xPkWeE5X?=
 =?us-ascii?Q?V76ZSGH4PNE3K81Sp/TfBHcVbDXv+LITpkevyaStvQYjw7g+f39w8nugorfV?=
 =?us-ascii?Q?9D7CsaEyXeIGbXhkWdXg8bovvadLHMjqyE8FBnTRruAIk9yuyoZCbtP0Ur/q?=
 =?us-ascii?Q?LbKYsQPVYVvqMApxcl5bm4C2M7DKquILxrf+P9QSWYMfqlkFYDZSAJVN/HYz?=
 =?us-ascii?Q?UKbxJx55J7tWIgMC3Uxgs0yLYQ0tP1WlgtOATJfqnPIhdPZzES4+3oqelMps?=
 =?us-ascii?Q?UsRD8z9NcvaY+pvJu0irkne0gbe5KhKXp4B0pQ6GIktXGlOHiQkkhzO2T88n?=
 =?us-ascii?Q?3+FKKYhAAei95LwcwfKinBuas7Ggy5f2ePjl2sZoxvFSoLrMqyEebgpEjb1R?=
 =?us-ascii?Q?nv1t4rtQv0E0I9p+q5qArreg+rNISY0i0XcAFhkKLhnzSjU1Nu32OMwFhJqc?=
 =?us-ascii?Q?caM5o5+OmYLPKR7GRJBDcNNjv7ybNDf2wki5dAMuLJIXauiZ4T+yiUpHQ8Be?=
 =?us-ascii?Q?C84KS8Igz9V2QEZ59xG/wt6ZO1vJL+Sf2Xc/SINx6qt/O1c9G7SkW8rFJY4x?=
 =?us-ascii?Q?7PcAWYHO2vJr3bOAtEDsuHumOYgGG2Y86AjvQcebFlAuMov77YhDXjYradY5?=
 =?us-ascii?Q?y+MFFPbYd6cVTJ5OZyxOFqJNLQwKzcCx+sjgSLBlfVt4nOESzHJLhASW3cXX?=
 =?us-ascii?Q?ej0B5KfJMeUfshjDXfc+Xt6QgBhDtL0wF5fGHRnYZl/5s9dHS59bFSPpFTtt?=
 =?us-ascii?Q?Q7Wt7EADDSKq+qDcpeEnt4ufGMvww1gRUbDug8de/+GUKP5d1HGvyfUAFRF2?=
 =?us-ascii?Q?Ti5OVELkoO4ikE2XJKp9ceDHkyoozsm0mcti1sprd1sdgREP4V3hwllW9cs5?=
 =?us-ascii?Q?qssfSniDpXJNy0IskIrEY+RFVG2+PydDBoNlA4tRmfWxfWpfyrcAM9HasPve?=
 =?us-ascii?Q?5sD6nxfOMAWRYTh5xare/n/YjyVB6ku3Zm2Vt1ODuYJU11dEoXgx9mbveLao?=
 =?us-ascii?Q?8Pgp9J88byP5nVMZcjB4UJpRwC4+zmoUXmDaQPDOiag+vA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YEIkb8Fh8/O//XFS6Ybly/6WkDIwn5Fm5NjuiFHBXsPCV6hdej2dWXT76f9/?=
 =?us-ascii?Q?wvi554zYQqQifamOr+YgsnvpMQl4aJ1TIcOv8E0Tl07VZVwqFgH5oSyfCuDA?=
 =?us-ascii?Q?EZTjPRGrjxe2MeD78v7z/4RAny9fgkFY63/smUpx+zYgdk7z9gC2LO3ZYHyk?=
 =?us-ascii?Q?lnOLq6tVDuDijEpbWpfbSLvN+5DyxFM2Zhfm3uFZzfHQi9WdqIGuWrmYqe1B?=
 =?us-ascii?Q?d+zA9+2MJRDzwBbku9MGk56ROeOfWfFXc2pZ3se9ozKP/jnuBDYN8VBFF2Wn?=
 =?us-ascii?Q?kO7QTNeUZOaRoNS5VOeznF+NbSEqYLjGUNr266Au+7SkDSrixV74NjXUJB9f?=
 =?us-ascii?Q?KUgr+bUMlRQZyUGQegYmKcc/vyRWDUeRh983UW7syYk4JtDPao19ZgMiBQGq?=
 =?us-ascii?Q?WGwuWRtTo1MuCU3OcWGN27uQfRkpr5SH/fzt8Q4sSOZoUGxOtHMzKWfy5+Mo?=
 =?us-ascii?Q?EwTLg4GI+ML1w32DMqSMUuS+V3aEsrZu1zmUlkvrJ8IlHmoegeIgkIDO/v+O?=
 =?us-ascii?Q?BOL5SyI0b8yr7RG4lBBvPoqXCPbxO0xusD8kDZsLIMm0H925GxhoSVL00ysl?=
 =?us-ascii?Q?GAOuUvkhylUGlnWSrSCFMhfRyHSVspZg89hyva/1YA0dgoRX7XAS1WAJhvsD?=
 =?us-ascii?Q?/gAx66o3Vq28bVQfGI4EMw5JodEyYy5fbMCxi6E8Byg6MRGBSQWqc/Gro3OU?=
 =?us-ascii?Q?DnkF7WS1+LT1JgppZeIcLjkqSTBSP296CqJul4Y0kY8oyu3i6qVA4HJo2soH?=
 =?us-ascii?Q?M9aQl2SDPgm1LSm+iUHwaZJ2fpgBjhAMJJ/YXTJFgdz9TyMY2+9u5bZbu29V?=
 =?us-ascii?Q?tEijviL0u6pYz8nnAIY+4x3QfxXuV23N7p0qye4WBkCFEHZmeWfASEMvF1Ay?=
 =?us-ascii?Q?SQDMECNzRAr7+iukZ0ZnGlLHBqYA0kFZfZYgscmKsLU2npLbbbBQp+S/Hhaj?=
 =?us-ascii?Q?ekT2TbmrszGylObX1JZ4EnIBeU38nGwtFC8Qiax2e8lgz3GLBsEsDChr4G4B?=
 =?us-ascii?Q?5ZtKADcq981oQiPpSsjudhfB6fD+Gc2HvLrzCK+T3FSVFGH1ntHG6HgHmK0W?=
 =?us-ascii?Q?uuTbanUmeKtZJtc4il2mz0MHfIGIaT/gDlMaHGsClX+9wHRBsn9WNZhamhgc?=
 =?us-ascii?Q?qTNM58md/IGft7wvOtAXKRvbTuLlirrODLlrU/yMMFWn+OKBrwiRHTc+6/UM?=
 =?us-ascii?Q?m8z2Vrq58MUEwaxrRXMKS1m58HFvdBg2dNXholkHowp2KIViFJXNTXe0E2+j?=
 =?us-ascii?Q?vZMKAZtQI9u0cdl07M8ICM1/vFdg+JQzbePCZ4N+mG0KFWee0gQUkl5bETl+?=
 =?us-ascii?Q?9TYlXpD4w8EttaA0OEcYqDQ9aTKLisrZp5yYjxZY2oRj5j8amypdaQ6ERiui?=
 =?us-ascii?Q?wkSpdKaytdPRFR1mxUVhmLdUbniY4CM+evyIGlhISe6JogpsX1CqncZbzEqs?=
 =?us-ascii?Q?kZmkcyAc3Lbva2UFNuz44jxEDXHgTLdukYROtpqDwtJ/PgJSt0Svd5q7LWDQ?=
 =?us-ascii?Q?WNHYXehN9pifnIcGlo3DLby8SFA0i5SMg513/H4eqOThYEK0RFEHIZYcEN8E?=
 =?us-ascii?Q?gZStQFvkbPfa3H8CsIw6aIjR2vzie6UbveelB+nrs+SySfQFxolfAYZOX4sw?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcdd11d-3b1d-44a5-a9fb-08dcbad7f10e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:06:20.5783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfCxyZVZIPGxRhYqkiLbfyE3SB7uovwxBWGK44ijPmL+Jm/Sk9VOIMs6t6IH18or8JGHd5Vu+ZX55Y18Vli3NWcbyQBXxSm/08VSoB5F4zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-OriginatorOrg: intel.com
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

On Thu, Jul 25, 2024 at 11:19:39AM GMT, Gustavo Sousa wrote:
>Test binaries now allow passing multiple --hook options, it just makes
>sense that igt_runner follows suit, so let's do it.
>
>Note that this requires having another file in the results directory for
>storing the hook strings, as metadata.txt does not support multivalued
>items.
>
>Since we are using a different file to store hook strings, take this
>opportunity to also allow multiline hook strings (which was not possible
>with metadata.txt).
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
