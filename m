Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E44CC79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 18:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F78F10E2C8;
	Thu, 10 Sep 2026 18:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0hF4l54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D0D10E2C8
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066090; x=1820602090;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qfcAlCxirEdXQ3x0uFFDWjfHpNsuwdYJqSkWj23xFY0=;
 b=S0hF4l54SmirVmiY0eZOIj3ebbE4EcSIP/EtdwfBg27QmOMQz7PFVBLS
 wfCpo+71hb+JRzh6Iu3i8odNsFxTSbHdeJxCtO0azeurpGmVwKdH2N+zS
 DIyar/QeRJ16tv/H+mHVyi3xiSdP90VxvUAzrwUDZ2c1bOLl9OPc3czWw
 vf3rNvTz6h9mz17zCbZ4puar6h88m+tCTkTHM1avvEsQVB2qztMgwJBcv
 rJuwzVUZQrHSUkM7sagapF+44jVl7xVnW93IYbisz5QKCxezGTWTaaKMI
 yyltcru7Fw+DcMGbg3xdx8tQTPWu6cW6dEFKcd16lz4F8ebkjJZH3NKhI g==;
X-CSE-ConnectionGUID: z6AYR+TESPy8OC3qeXUOIw==
X-CSE-MsgGUID: otossyBoRBKqtYyOgtZCZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="88468613"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="88468613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:48:09 -0700
X-CSE-ConnectionGUID: hPOSzTtSSx6jRbM0MH/dHA==
X-CSE-MsgGUID: itCtx4GfSZOg9lCdLbY69g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="275487029"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:48:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:48:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 11:48:08 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:48:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTBvftuOiAFwo6TsuGQw215pu27497kD1DvLi3OMLHUpR7booF+YAKLej4HUZv4xSNcK23cAOlnA/+rPLfk3QLdcXHvv2bnsCk3Vt38uLT4iQ/k1s0sPP8c1mAnljcY5gWt81Brwko2INWw2rmRYQC1XNz1wRD/CxFghN0Foxs9TCFgMwn/cWZ/vP4G/WD8irGclTTvSNej2/T0rIS/qT8QdnlR825fLwL/vdJnz8CZWJ8EwbsvrlIWi3w22LDzkES7aXz6OmTcS8w2wiWkC7GwKwaTeQTewzNNTebOHZ59Mcn5S71NiUaR3SNktF5NATV2LXrDaTyz7wUof7tYHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp6cb6TEdhAhqhjfgCrMSnWXYwMIrXqAOKNmI2NGYe4=;
 b=RHSE0Vq2zv/H9TJdTZQyZuSc+Cc6+lNAiEefLL6tk7kHGF3+pd3wl2D2zZivKOj+bRs8poVolA/OnVkBbH9FjnQL0bsR8DvTWGzJX1u+N0J855kSdLmMJUz2IWYY8ZZbYTRwSyJCLdoChPvm/J3DoNOmpgeJiXRIMViKHtKKXH7UhhdinwQJk1lPy6+0kt9OPaI9mPeJR3i6p9Lnd3blrSj1OS9EJ1xlHFT5KCil81QHf6Vvz/TAMFaGr17WqJY/8l4Yw/YGJgu8z68/bX8Fv5tAKB9uD27desctCy/jEmwhjTOrVt9SE8BMWHzO7yYKPFUVM7CurZ2BQOv0BBfqIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Thu, 10 Sep 2026 18:48:02 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 18:48:01 +0000
Date: Thu, 10 Sep 2026 20:47:57 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <nemesa.garg@intel.com>,
 <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v3 04/17] tests/kms_async_flips: limit S/R to first
 and last CRTC
Message-ID: <e6tbyxtv27pld7thhohadvp666ydn3cvhebb5ht6t5a4r4f2bd@sm5g7r536bo3>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-5-michal.grzelak@intel.com>
 <16fd8eea-ec0c-4877-8cf2-33c4fd969dee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16fd8eea-ec0c-4877-8cf2-33c4fd969dee@intel.com>
X-ClientProxiedBy: DU2PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:10:234::33) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e51e486-ff34-4d50-a33b-08df0f6c0a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|3023799007|11063799006|22082099003|56012099006|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: VXHCC8p9QsBiZDsLVxOjxB9bqEaQIQghPfON9Fjwv4dnPZCc6T1J1NfgMpEx6gIqOw6Tp6ohwYIDFDfPbuowUr7MWG8FiqogfLZU3pvFLQJTpCVSGoThflGCBr32sS8PQc7RVTm93buw5GoC+1DT5jHXk0xnyBu5RGD9to5s043pwk5MVOi60uWF8fOcvdtEt+1MXHfLB1+ZEIY3yhr86zfmgK3IJlE/OZnI5L2SzGUxIkPOXqdyD4Ng8wOf4dRjHkpK3WAF8PBvR8/MbgDMOTMOgcK6Y5Zato46ZBr6eElRDRg33rqRR5CbulVzYBysZsatKPM5KvfO4j89vC+FqdZBJbCuTZ5rQaQUxBAECzflumh++YnG6DG8lIyKGUdVqxCF5gv2zvkCSb7ZmYoMOQlEXRt1ErrP3oPxtm+DeS/376sN7J+pAAfnszPlZhgcb1xdCMPcNtBlfjEAfxi9W5phLo5oWITAQhUy+l4+OtVv6NmWHdikswsXBFq33hPCdQfllosWumOtEhLzK8QNbV/HORqN+G11vq5g5QODTxe46csntS5KwYyeZoyRgujzdcWPuKl6w+TxbYYuQ7M2g0xqBOxITiG5p4GlZ0DExgRRzjdvi5yoDFpSrBVgCB/De2/nJtmJS9HS8TUSj/f2TDxUb1dscSv08D0HYOLQaGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7256.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(3023799007)(11063799006)(22082099003)(56012099006)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW10TUdjZFZwUlJKSEIyY0F4SEVFVXRvQ09JdXcycWZIWEg2Qm8xS0FWRjYr?=
 =?utf-8?B?dXByVUF3bGhCdnBtSG5NMmUxa3FsKzFrcm13cjJLanBOcTNaaFk3ZkZlOVpa?=
 =?utf-8?B?bWJxSDJUYllRcG5DdEZOZG1NSWZvcGtwbTM5dW5TaDZjeWl0aGN6TzM3ZExV?=
 =?utf-8?B?cmIrY2djcDdIRWwxMnQwNkJUZ3hVcVJmaGtGd0VKT2k5L1pTcGV2NnpkZGZQ?=
 =?utf-8?B?OW94aE1hcUhrbDJXdWlUclpPRG0yRVhXN2ZGUkZEeFhJcWl1RGVoVVN1KzdJ?=
 =?utf-8?B?cmRLYzhpUFBpMHF3czdRaHNGNk5IdVNTeXJGQkI5Yy9sRmQ1MlZIOFcvbVV1?=
 =?utf-8?B?T1piM3ZQaEhnVTVYYW1oTHQrM1B6TG50ZGpxQVNteEs1Q1FKWXZkWXBQMkMz?=
 =?utf-8?B?TU8yVnhTdTFZZnp1M1VmT0J6UmdVZXAzYXBuKytrd3hhWHAzbThaT3JHNDcz?=
 =?utf-8?B?Rmh6T0dZWUFYSzVNYUdQSCs0STRMdmFXY2pLVU0yM0FrV1JubTBaQzhXWnQx?=
 =?utf-8?B?cDRwcHFUZjNWbmFDZ0lmdFlNbFMrRHVkMTJpa0dURzE5VUZzUFVQN2t1aE5a?=
 =?utf-8?B?UzNncnVIVk5oRi9vcktHTzhYUk9PM1I0WjI0YUNoTi9UTFl0OXpickpEUTRu?=
 =?utf-8?B?VisyYkgrRjExWndoZVZzeUo2MEc3WlF3NmtlZDI4K1RyK21xbmFpTDdDZ3lS?=
 =?utf-8?B?UW9xSVZsRmlxY0tkbnUxeTdURmtnaEc0M0JDK0w3R2ZXWjVIWGpYUW80VkFo?=
 =?utf-8?B?MFY5TFAxK3hIN212MDY5Sk0zQktQZklIaExYd3JRTC9nc01yNFhZZWRaVVhR?=
 =?utf-8?B?bUlxSGUyY00yOHhTK3Q0V1pJMW9PSFFNcExIbytxU29oQWNBTjZTZ1FHalEx?=
 =?utf-8?B?aU04UzI1MWgzSzEyN0p0b0dFNE9zcTVBQkMzTjV1NE96aEk0S0FGbk5pZjhW?=
 =?utf-8?B?aTJmQy9vNnlBR1lXY1VQM3o3a3dsRWozR1p6WVJzbnk5UlVVR25TMy85dEto?=
 =?utf-8?B?R3NLK2NyVW02L1RjaDlCdmpyREZFRjI3cjV4UnB1S1JwU1RPRXZYd3NuOUNo?=
 =?utf-8?B?ZkViOFM4MEZOMjFzQTlLSTB2bThEL1NwTHBVSUZ0VWxmWElZSmx3NE4zMkN3?=
 =?utf-8?B?ZUlrWFk3T1JhQkhFeVN2NHA0QVYybnEwa3ZWMnJmVEdUSnI4RitQVlprWDBQ?=
 =?utf-8?B?VEgyWFhxQzcxZG5LeGp6aG1sUkI0OXZOM2JwQzZFU0JiSS9qa2Q0TWhiTjhT?=
 =?utf-8?B?a0IzdDcrUmV0bzhJYS9QWStiTzBwTENyQ3NieStOd3RncUw4S1QwVVp0bWZP?=
 =?utf-8?B?bDZ4SFlFSDVuRkw2cWFOMWorSjk3NWd0eTZzL3BWZnh4dldGNGpDVmV5ZTd0?=
 =?utf-8?B?YThTWHVxUnhXdHVnMnREWkM4Q3VvYTBJbENTY3VyZVN1YWZmWW00NjhWRG8x?=
 =?utf-8?B?b0FvYjFUbGc4a0lnMDZncVJGSkM2ekcybnB6KzEvd0VPcklBTW9kdGR2cVdL?=
 =?utf-8?B?cU9BSXdpOXZxeHNuTU02R2xFTy81M0xrQ0N3UHlzTlFwQjlVNmtCeStpUDc0?=
 =?utf-8?B?RlBjZHJnR3dNK2psT0s5ektRSUk1T1F5WUs1akpWQUlGL3VjT1VmdThFZGRm?=
 =?utf-8?B?elA5UnZKNDIvT09XU0pubWY5SS92d1c1bmx2cmt5bGdZSnhTeUVwQzRTQ2w4?=
 =?utf-8?B?RXozU2d6b0hnWGF3MHcvdGRHbXp6RWJKQmlQWUV1SVZHOWZuWS96YXdiTERZ?=
 =?utf-8?B?SnNEVTd0aFBGc3IzTzBSMks5MEl4ZTZ0SzNXc2VrVklLOFQzRFVyWHNCanlz?=
 =?utf-8?B?Q2k5ZU9xSkxMNlVDTUJjWDU3Q1hQUzN5SmZ1QU1mcDRhWVp0WDdzbzlET3B5?=
 =?utf-8?B?VXZHME5iZXg5dlFVdXp3T1ozcWJzRjJMblgzaUJxTkYvNDlyWkZ3OXB6QzBz?=
 =?utf-8?B?NllaaVFGWGhQUFEwbFdGbTJQN216c3hMWWRDaE50cWZaejNiR090NXJ1b0VT?=
 =?utf-8?B?cTVEVTkyRG9ETkRUUTNRcTAwTVlMcFVGTDZBS3RsV1N0RU96aVNTaXNyZ3NG?=
 =?utf-8?B?RnRhMEo3aWF1NmUxRElRRlJpMkl3Rm5LQXJValc3aGg5K3VwTTdkUjFPSXpy?=
 =?utf-8?B?NFk0WkwwR0JVWnFNa3J5MDRBdno4YkNOQmhlK25BTCtjaHBWNUxhSS9VUHR6?=
 =?utf-8?B?SDlyNmlOT0ZWSGJZajVIZnMxVmQ3YXo4Tnl4VzgyeTUxYjFtLzlTQWdSWjdt?=
 =?utf-8?B?aktOcnlGUG8zK1BLblpFdHJ4UVl5NlJHQWlBZGp3enhVNFhlUDQwT1lvNEYr?=
 =?utf-8?B?YmdOYUphOVcxUXNaS2ZxNTFiTzF4WXErUHBsVml0Z3djVEhJTTZhUUtndGpE?=
 =?utf-8?Q?8X5eAr9dcIt1QbhI=3D?=
X-Exchange-RoutingPolicyChecked: sUw9Y6XXsZVrUQlEwLn0RcLEO0V/Y94LzsQUYaZWSFnuG8LEZydj9RFm5iqr3pIhTcqr/8L/lfK0Lcm8sKgKfjYDlbGFJ7tm1Mm5sdAmsC/iT/i2uQv/3Oy121Hgi8FeQYi9MN7O5baFtC5ym7IzVLBIxmHpuG7xfoweulU8rJCibMvCTqd/Wt6BBhEm3oS3jM4LPS5Pe7VrqD2oIYWpxHWsOIcOsj8GED6X1dNHvB+t+KyPOGII82BqsnzpoMZ3jRRTRJaJUwtIKByy6YSVoFJ14DeiLpdT6o1UNUOUf5v8D3ue6J/SLD4guk8wLGHudHombDWPJ7GUdRCWehflOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e51e486-ff34-4d50-a33b-08df0f6c0a7f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:48:01.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YarZ6uNKz8/nJegvqOWJ49mOPBhR21qkYoXmY4nZietTKdFAQ+2RXBoBZ1uMxjP7X1QRryEYYToxIizmzT5O8449thVtXUuBB+OMFqEOYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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

On Mon, Aug 31, 2026 at 12:24:28AM GMT, Thasleem, Mohammed wrote:
> 
> On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> > In order to increase tests performance limit suspend-resume's execution
> > to only first and last CRTC.
> > 
> > v2->v3
> > - add missing S-O-B
> > 
> > Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> > ---
> >   tests/kms_async_flips.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> > index 03348d958d..5c143e71df 100644
> > --- a/tests/kms_async_flips.c
> > +++ b/tests/kms_async_flips.c
> > @@ -873,18 +873,23 @@ static void run_test(data_t *data, void (*test)(data_t *))
> >   {
> >   	igt_crtc_t *crtc;
> >   	igt_display_t *display = &data->display;
> > +	int idx;
> >   	if (data->atomic_path)
> >   		require_atomic_async_cap(data);
> >   	for_each_connected_output(display, data->output) {
> >   		for_each_crtc(&data->display, crtc) {
> > -			if(!igt_crtc_connector_valid(crtc, data->output))
> > +			if (!igt_crtc_connector_valid(crtc, data->output))
> >   				continue;
> >   			data->crtc = crtc;
> >   			igt_display_reset(display);
> > +			idx = display->crtcs->crtc_index;
> -->IMO: display->crtcsis pointer to the first element to the crtc array  and
> always gives same but not current being iterated , please check this once
> > +			if (data->suspend_resume && (idx != 0 || idx != display->n_crtcs - 1))
> -->You mean to skip if not first and last?

Sorry for delayed reponse. Yes, and thanks for catching those.

BR,
Michał

> > +				continue;
> > +
> >   			igt_output_set_crtc(data->output,
> >   					    crtc);
> >   			if (!intel_pipe_output_combo_valid(display))
