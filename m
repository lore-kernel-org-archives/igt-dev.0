Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8917E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 16:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7755310E2DF;
	Mon,  6 Jan 2025 16:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAFiyn4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E045210E2DB
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736181503; x=1767717503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2wt1Q7HTEKDNP7xeJE9MYlPZmOIRejyvCMUUZaHWOJ0=;
 b=dAFiyn4T/26z/QZdxBL0+eiQngehF8tXGkZeB+jrt+go9BFxmdlEsniP
 qqoXUIHJ/1boLtWYT93u9Te31zE00BRp3cdv0PsSfYzZsYXMaH0+IxGy1
 wMoBDYplSUtt0Npx8KIJEFQyDLFaL47zXItUvSPAP2vcnckCf3v98eIeM
 J+e3VzN7zeu7z4DdBytoUu8THElP88oNF5k9XRxLLZx3trUNiQ8AFvSIe
 4zxODE5TP1dUraJF1SNNUR9CuIexLzAQ4Y4D9y/LwXeek6sVpbLgJJTxc
 1MdIybn2SyGNW567pTuBaVACbXJFTkpv6Pzbx4E+txjHxJoQ0PZ8/7Iq+ g==;
X-CSE-ConnectionGUID: UY/pJViFQbqucdBa3HJCgg==
X-CSE-MsgGUID: Wnw4LG1yQuugtHdJP56+7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46826284"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="46826284"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 08:38:23 -0800
X-CSE-ConnectionGUID: NOrypJQoTmiQfd+eIfyzDg==
X-CSE-MsgGUID: 7O64X8aeTgWwpxa/hAGQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106520511"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 08:38:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 08:38:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 08:38:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 08:38:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcbTEMvdDNtp/3y7ZqnJNLCu7NQVfALFIK0Ct4E3alkwwlvdGEZ8GHlHorysFHVuqB8S/wGV7HUO3P+P0o1IJu0Vafbe+hLHp5Z43r6gTIkNJUSbbSgrwUH01X6zGbLW1XiwWz37vNFZdfhCpcA67k7Q+3OWYlUOWcwOyXNl4NDAOV8Y8iW7ijmYDoMT/Nb/HOew0ly7gGU7FoDotCKPS4NObs2IB/+D8Z5OLsspgaGScyNZ88UNrQH1YLGckMjt/XeNzJwTRZExaj/iBwzD4qzlO/14lNPbc/A4/yVnl++RIK6vZuA9tOgqjVkppWbZ2KeEtpxufjyUEGmybnk4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw97KneTopO1Q3gfTP/6BrUi+0vrerkjO1mEKMPKQzk=;
 b=KrXN9weaVQNoHV7n0Jk8SIb+iCd+YloglRHowJyGPRMiSoqyVGAQvekyXs2eQKAIQbSuO+DgSfmO1xlobu2xlID6WbRxBU7PyF3fk9+5PFg12jUSFwCGDVmIOA/Enq5jFKeyiuohdc6cLASkjrWuNdU8zz+d9nhYhaZ6WYsQebK/OLu3ReH/tn6CpxKfWVhk4TveqzIIum1tA25fuhVz3qxXAjTch6vUB1U5Rq8isL3sJX8fjtOJLFx44pFramwWoCS5bljEKySq/tIe/Xt38Lrw6keuDLPDuXtv4m9MezS/I4dqPUUpsxorZ18C0qiJ2nfkdSNot+FDt30KVfL+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 16:38:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 16:38:13 +0000
Message-ID: <498db3f0-dc81-4eb9-ba5a-5d57e0b2097d@intel.com>
Date: Mon, 6 Jan 2025 22:08:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Add single engine busyness stats in GPUTOP
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>
References: <20250103065304.45781-1-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250103065304.45781-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::24) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN0PR11MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 41326092-e917-4947-ec5b-08dd2e70832f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE83bXpxbjdKbWFxOEs5cm0vUjQ4Y0tjVnl1Nm9tK0ZTYWZ5SGdrNmd2SWQ2?=
 =?utf-8?B?YTZvQU1FYmlpWU5uZTBXN0RYY1Q5OHAxQXdRVDdhN3JNbDI0TXpsanFZeTYw?=
 =?utf-8?B?aDRnU1g5TnlvbGs5ZFRJQzI2VkNyTHFZa0tQaXNxckRVamlhNldXb1F6K0xM?=
 =?utf-8?B?S0tIbjY1V3psZE12Z204b3dpNGtHRnlGMDlwNE5mQjFLd0JKY3FobG1rNW9o?=
 =?utf-8?B?MkJ3TGF6VWNBZEFXcnhoT0w1Q0NtNmhlaTMrakdvcHJDV3JHeXMwakFiSXNX?=
 =?utf-8?B?RlM4TnZOMG51aXlPVHdDa05zaHVCTEQ2dVB2T0tNc3kvMDIxbmpYa3RIRGFx?=
 =?utf-8?B?R2c1MmRTUFBURE1NNEwzb25pdGlSZW1kbkVaSVR2Wm5VUlJTcUxUWHViZXdM?=
 =?utf-8?B?MXpvdkw5UjNTM05qZThWSjdPYU91THh2UmdBUkhJeVpQaGd0dUJSdWt0ZkF6?=
 =?utf-8?B?UGdVZmxtaVkxcnJrRDVTdG9IKzF0b3VjTDBiV0hZMExyV0xZRktYcEVJeHdU?=
 =?utf-8?B?d0NpQ0RpYjN3NGRWMU9rNjVqQVB2aXBkTWJVclYxTjAxTjJpbVZhMDRXMVNi?=
 =?utf-8?B?bWN6Z0FackF2Mm1qYytvSGw1ZzlIbm9nZDl3ZWIyNWt0anZVRGN1Ny9EVjNN?=
 =?utf-8?B?WUJKblYwZmQ4WTVPdDVORjExamYrb2hUMVVwTjZQL0FpSFNOSmp4TzZrL3Iw?=
 =?utf-8?B?NEVrNGdyYzAvSGFiMEtjcEl2c2R0blhMVXlpTy9zY0x3Y2VnMzVCKzYxdDNE?=
 =?utf-8?B?b1ZlRW9xRFlnaFVLZmltdC90a3VuQWczQkFSc0JUM3lBckhOV2FqLzB5WjNP?=
 =?utf-8?B?OVMzejIrcUVMZ2ZDT2hSYVlVYzFKb1lVaXpidTNPL0lnRk1TQTV0bm1HOE9Y?=
 =?utf-8?B?MzU0b2xOQk9ibDN0SnZ3YS9vQ2V4QXhWeXZ4amlZYng3bi8wTzN5M052QUdn?=
 =?utf-8?B?VUdQZCtWOXV2OGcrSWxRa1RDYjVRU2RCU1AzZlZ2SlZnUHNDby9qSENUSkFX?=
 =?utf-8?B?TEVMN3dlQkhlWmJqUGVEUWN4VW5sYUo4WDlPbWxGR3ZnSFBPWll1dDdhTlVZ?=
 =?utf-8?B?YjBNZTE1OFdZQkd2akN0eGVWMEVITEVzUDRXd1E3R3JxSHgxbHBhMUZMVm1l?=
 =?utf-8?B?ZWVtR1Q3Tm9mUzE0eUxTTSs5YWZDOXQxQ3pKOWpKa08vMmQ5cXBPTEt1SkZS?=
 =?utf-8?B?MDVuV0R0SjZDQ1lBai9qRURWVytRVzRoTjgySzFUM2V3YzFJK1ROMVlNTkds?=
 =?utf-8?B?WTBRWllDK2loblFNNW5WTEM2RVo3UnRjYzhVZVg3MzBnalYzSEhBOVIwY0hB?=
 =?utf-8?B?aWNUNkJGRlV4b0hyOG9hOE1TRVhTVitKd0ErMTVtcFhjY2dYV3lpMzh1cGVk?=
 =?utf-8?B?UElwbWd1enRWR2RNNDhhZU16VUxwcnBqYWpqSUYwK1JHanlCWTUyRTJPOXBU?=
 =?utf-8?B?MTRuSlpXbFh6SEcwUWRhSVJ4Q2RMaHJVTjJtbnloUDFoc3FpRlVRSXlndi9u?=
 =?utf-8?B?ajBBVFRjOWJHbVJBemhSbHlSUkx6Vm5VRDZZV1J5TTl1THE1cXdXKy9idW9O?=
 =?utf-8?B?Vk1HNTc1ZHhueXFwVmMwTTlvWkZMYTdvNkZEakZqVDNTUnpWZkFFRThjeUsv?=
 =?utf-8?B?WXJ5M245c2w2b3lJMnVXME1yN1I3Nk5aMHV3cTN0MGYyQjI4VWlrMGlNYWh5?=
 =?utf-8?B?QmFMRUxwQkVFRk02aUFoNG5VWWpZUFAvUUdKenNGUjQ4c2t6UzJhaEdNNDIr?=
 =?utf-8?B?ZktSNlpQQWY4WENKdVNVU3N2dG9Ic0ZXRGIrUkY1bzljbXY3ZERUZGcxS0Jr?=
 =?utf-8?B?V0VnaGsydnNiNGlCM0QwZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3NvZGRvSloybGc1TzBTWDBqN0FFSGVhd0RXZEd1VmtrN3U2S0NyOWd1WlVH?=
 =?utf-8?B?Y3YyQityWFdkb0hjb0NNN29zMmFSSmZ0aHVnR2tURUNHbDZ2NCt4eUowT1I2?=
 =?utf-8?B?SGdZcGlncSs5RFlKdldOdmF3KzlBMVg4QVduVDhiRzkwaHNoZVpTSHdmY1Ju?=
 =?utf-8?B?M215dXBCQzVua1lpMHlXT25uSzlaQlpOQmJvZEdESW1XOFhCZ0R4eWJZckhN?=
 =?utf-8?B?WXRiaGxMVUsyTFN2ejU4UmxtMnhYUUxVN3NldTJVV1ZRakZuSmpWSEpmb2I1?=
 =?utf-8?B?d2tqSjN5RnZRclBKaDZNUDVZRDQ1Q2U0MmFUYnhWK0RDWTB0dVNkMHI3L3hH?=
 =?utf-8?B?WFhuNUlpemgrcFFJMVJ2ZkVNdXM1UTlKQUxseU1GM0pla0FoQjE5azVPZGxU?=
 =?utf-8?B?UGF5YkpCTW1ZTk1oN0lvQWxFU29QWEh4TUhHSWRZejNqZjRCaUF6SUNIVGJG?=
 =?utf-8?B?US9rY2JBK2wrL09jWG0yQ2MyaEZBVTJYTTRGd1p0djEvbjRiUWhCai9BdkYx?=
 =?utf-8?B?ZWgzT0NaaXRkb0lTbFF4T29IdG1qNGEvbFR0VnEyTzdMVWx5SDNFRDl3eEdy?=
 =?utf-8?B?RXhFUHpjUXdPMUk2ekZIMDlLay9RbEk2andOMi9neThRL2V5bjV3OTN3Qm1z?=
 =?utf-8?B?RWxFcndTYXJzcWlUWHZxNVdqNE9LNVBvSjlBUkZOL2R2T2pRSnN5Y091clB1?=
 =?utf-8?B?VnlIRmY0Z2lDSUpGSmlYbEI1MGdQUGl3QnU5QkQ2aFI4UmRoOGROWkgxYjRp?=
 =?utf-8?B?dUhUbGlBUDdMN3QxT2tacXl5NWJ2RDYzQU1rWGxXcmtWbEpDeE5qYlpmYjUr?=
 =?utf-8?B?dEw0Z0x2QXQyNVdmeE5nVGZEbEpqdG00enNYY0JkT0ZOR2hubXdzNnJsRWpo?=
 =?utf-8?B?RlZ4eTIxQjBUOGczc2kvYVA3RFBMNUhjQmgzWVFVMXlYMkowd0NqTUdoSnVW?=
 =?utf-8?B?QnRJamNWenU2ZDdOTWdGWklMdGgzVlpCRWJnNklOMzhPK0xpbVEwSVA4RjBP?=
 =?utf-8?B?ejVrajN4aGdLMnN1ZmowZWVVMHUwT3o3Y2JhcHNocGtubHd4QVRzakJhOGxR?=
 =?utf-8?B?d0RFV2ZCWWQ2YlBscXM4TUNxN3Rub2hXWXJsNDAySGc2RUZJRHNxQTI2eWpW?=
 =?utf-8?B?MXBOd1lROFE0MTNMaS94TFJINTNhaXhjQXM3V3BKYy9sUGkwRzlNMmFrYWdI?=
 =?utf-8?B?bGdMcy9jSlZqZTZRQXFJS3E1S09udXpkL0RkbjhYQ0NqYjhLamE0VFVlMXBK?=
 =?utf-8?B?SFJXTTBodXNQSDRWU3ZXRWtzTTl4RSsyd283c0RKRUtCUDk1ODhVVHN3bFlo?=
 =?utf-8?B?eDRKTjJzRThWZ3laR1hQbkpyY1VFWXR3TEVrSFFHaDB2RnRmcmY2RUVIY1M5?=
 =?utf-8?B?TTdaTjdaVkpmMllkc21OZ2YvMkpZZi80MVJ4RnUrdFlPM2hTd0lwaVBWMWtK?=
 =?utf-8?B?Qld4MWtRZzFhRzU2K21kRGo3MGpKdzFBYzN1eFhEbXpmbTFsQmczbzFGaysz?=
 =?utf-8?B?VS9tZzdQK011UmQyOGZFQzBWMUJZWlpxUXlCWUdaemRXcElYd0Joa0V0bFVD?=
 =?utf-8?B?dVVZeEVCRjN1RDFvOWtsbzYxOGI1dmtsTXljd3RMVDhmWkE3RDNVZ2Q2a01j?=
 =?utf-8?B?MFQ2RzVkbk9admMvQmRLT1p3dXhUYW4rVUxBejExWnk3VGl0YUoxS1hXZ1pM?=
 =?utf-8?B?UFlsbjFLcldoRnNjN3pZMzJTaXhJcm5wa2ExeUJ2RE9pczE5VVpObjB1QWxk?=
 =?utf-8?B?Y013WTh3b3Z0Ui9zeDF4QnhETGNoMi9NVEJMQXk2MDh4bzdHZUZxM3BNajkz?=
 =?utf-8?B?NUQvQ1ZiUlVTblZnaEpCaVdNTlFVNEllelpIQ0dPVlRpcU13b294bzR0aXhh?=
 =?utf-8?B?SEVyek5lS2NoUDhSOXY0OGwwYjFHNjJzSWxXZzdIN3hvS1ByTGZENEplOFVO?=
 =?utf-8?B?cEYxYlNiWmQyampoUmlMYXpOaVpINUNpTjVmd3JxenA2aFpybEZxMTh0WTEz?=
 =?utf-8?B?M3U5MnN4aGd6b3MrcU44N1g3b29ycEFhQXd6aG5TQ2U5OVRlZmJaMy95Um9M?=
 =?utf-8?B?UmY2WVdOcG5IL3U4NnF3TXRCT3RpZDR3L0RqMldSMFA0NW9VQ1B6L1dTUlRl?=
 =?utf-8?Q?aR2h9+zR1dMtExPBiCkhFCaFS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41326092-e917-4947-ec5b-08dd2e70832f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 16:38:13.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t19qQxo19JzaBzfTHgl2kRGPgZi9aVGgYpGeas0Y4tmt0ccDG73MFRdjtT0VfLfMg5A6oFW9U/71Mx+VzxL+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
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

Hi Soham

On 1/3/2025 12:23 PM, Soham Purkait wrote:
> Add single engine busyness support in GPUTOP. This will use the PMU interface to display the busyness of each engine instances.

The approach has changed in rev3
https://patchwork.freedesktop.org/series/143138/

Please check if it works with the latest version.
> 
> ENGINES         BUSY
> Render/3D/0   | 96.5% ███████████████████████████████████████▍|
> Blitter/0     | 91.6% █████████████████████████████████████   |
> Video/0       | 56.2% ███████████████████████████             |
> VideoEnhance/0| 97.7% ████████████████████████████████████████|
> Compute/0     | 48.5% ███████████████████████▍                |
> 
> 
> ---
>   tools/gputop.c    | 586 +++++++++++++++++++++++++++++++++++++++++++++-
>   tools/meson.build |   2 +-
>   2 files changed, 585 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 43b01f566..dccd38d66 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -2,7 +2,6 @@
>   /*
>    * Copyright © 2023 Intel Corporation
>    */
> -
>   #include <assert.h>
>   #include <ctype.h>
>   #include <dirent.h>
> @@ -31,6 +30,88 @@
>   #include "igt_drm_fdinfo.h"
>   #include "igt_profiling.h"
>   #include "drmtest.h"
> +#include "xe/xe_query.h"
> +#include "igt_perf.h"
> +#include "igt_device_scan.h"
Alphabetical
> +
> +struct pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct pmu_pair val;
> +	//double scale;
> +	//const char *units;
> +	bool present;
> +};
> +
> +// struct engine_class {
> +// 	unsigned int engine_class;
> +// 	const char *name;
> +// 	unsigned int num_engines;
> +// };
Please remove comment if not required
Also we don't use //. Comments should be enclosed in /* */
> +
> +struct engine {
> +	const char *name;
> +	char *display_name;
> +	char *short_name;
> +
> +	// unsigned int class;
> +	// unsigned int instance;
> +	struct drm_xe_engine_class_instance xe_engine;
> +
> +	unsigned int num_counters;
> +
> +	struct pmu_counter busy;
> +	struct pmu_counter total;
> +	//struct pmu_counter wait;
> +	//struct pmu_counter sema;
> +};
> +
> +#define MAX_GTS 4
> +struct engines {
> +	unsigned int num_engines;
> +	unsigned int num_classes;
> +	//struct engine_class *class;
> +	unsigned int num_counters;
> +	DIR *root;
> +	int fd;
> +	struct pmu_pair ts;
> +
> +	// int rapl_fd;
> +	// struct pmu_counter r_gpu, r_pkg;
> +	// unsigned int num_rapl;
> +
> +	// int imc_fd;
> +	// struct pmu_counter imc_reads;
> +	// struct pmu_counter imc_writes;
> +	// unsigned int num_imc;
> +
> +	// struct pmu_counter freq_req;
> +	// struct pmu_counter freq_req_gt[MAX_GTS];
> +	// struct pmu_counter freq_act;
> +	// struct pmu_counter freq_act_gt[MAX_GTS];
> +	// struct pmu_counter irq;
> +	// struct pmu_counter rc6;
> +	// struct pmu_counter rc6_gt[MAX_GTS];
> +
> +	bool discrete;
> +	char *device;
> +
> +	int num_gts;
> +
> +	/* Do not edit below this line.
> +	 * This structure is reallocated every time a new engine is
> +	 * found and size is increased by sizeof (engine).
> +	 */
> +
> +	struct engine engine;
> +
> +};
>   
>   enum utilization_type {
>   	UTILIZATION_TYPE_ENGINE_TIME,
> @@ -39,9 +120,39 @@ enum utilization_type {
>   
>   static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>   
> +static const char *engine_event[] = {"rcs", "bcs", "vcs", "vecs", "ccs"};
> +
> +#define engine_ptr(engines, n) (&engines->engine + (n))
> +
> +#define is_igpu(x) (strcmp(x, "xe") == 0)
> +
> +#define IGPU_PCI "0000:00:02.0"
> +#define is_igpu_pci(x) (strcmp(x, IGPU_PCI) == 0)
> +
>   #define ANSI_HEADER "\033[7m"
>   #define ANSI_RESET "\033[0m"
>   
> +#define CLEAN_UP() 		\
> +	do {     		\
> +		free(engines);  \
> +		return NULL;    \
> +	} while (0)
> +
> +#define _open_pmu(type, cnt, pmu, fd) \
> +({ \
> +	int fd__; \
> +\
> +	fd__ = igt_perf_open_group((type), (pmu)->config, (fd)); \
> +	if (fd__ >= 0) { \
> +		if ((fd) == -1) \
> +			(fd) = fd__; \
> +		(pmu)->present = true; \
> +		(pmu)->idx = (cnt)++; \
> +	} \
> +\
> +	fd__; \
> +})
> +
>   static void n_spaces(const unsigned int n)
>   {
>   	unsigned int i;
> @@ -403,6 +514,414 @@ static void sigint_handler(int sig)
>   	stop_top = true;
>   }
>   
> +static double pmu_calc_total(struct pmu_pair *p)
> +{
> +	double v;
> +	v = (p->cur - p->prev)/1e9;
> +	return v;
> +}
> +
> +static double pmu_calc(struct pmu_pair *p, double total_tick)
> +{
> +    	double bz = (p->cur - p->prev)/1e9;
> +	double total;
> +	total = (bz*100)/total_tick;
> +	return total;
> +}
> +
> +static int
> +print_engines_header(struct engines *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;		
> +
> +
extra lines
	
> +		a = "            ENGINES   BUSY  "; //
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +			       a, (int)(con_w - strlen(a)), " ");
> +
> +		lines++;
> +		
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct engines *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
indentation. should match open paranthesis
Same for all functions
> +{
> +	struct engine *engine = engine_ptr(engines, i);
> +	double total_tick = pmu_calc_total(&(engine->total.val));
> +	double percentage = pmu_calc(&(engine->busy.val), total_tick);
> +
> +	printf("%*s",(int)(strlen("            ENGINES")),engine->display_name);
> +	//printf("  %5.1f", percentage);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +	
> +	return ++lines;
> +	
> +}
> +
> +static int
> +print_engines_footer(struct engines *engines,
> +		     int lines, int con_w, int con_h)
indentation
> +{
> +	
> +	if (lines++ < con_h)
> +		printf("\n");
> +
> +	return lines;
> +}
> +
> +static int
> +print_engines(struct engines *engines, int lines, int w, int h)
> +{
> +	struct engines *show;
> +
> +	show = engines;
> +
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(show, lines, w, h);
> +
> +	return lines;
> +}
> +
> +static uint64_t
> +get_pmu_config(int dirfd, const char *name, const char *counter, const unsigned int gt)
> +{
> +	char buf[128], *p;
> +	int fd, ret;
> +
> +	ret = snprintf(buf, sizeof(buf), "%s%s%u", name, counter, gt);
> +	if (ret < 0 || ret == sizeof(buf))
> +		return -1;
> +
> +	fd = openat(dirfd, buf, O_RDONLY);
> +	if (fd < 0)
> +		return -1;
> +
> +	ret = read(fd, buf, sizeof(buf));
> +	close(fd);
> +	if (ret <= 0)
> +		return -1;
> +
> +	p = strchr(buf, '0');
> +	if (!p)
> +		return -1;
> +
> +	return strtoul(p, NULL, 0);
> +}
> +
> +
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct engine *a = (struct engine *)__a;
> +	const struct engine *b = (struct engine *)__b;
> +
> +	if (a->xe_engine.engine_class != b->xe_engine.engine_class)
> +		return a->xe_engine.engine_class - b->xe_engine.engine_class;
> +	else
> +		return a->xe_engine.engine_instance - b->xe_engine.engine_instance;
> +}
> +
> +static void free_engines(struct engines *engines)
> +{
> +	
> +	unsigned int i;
> +
> +	if (!engines)
> +		return;
> +
> +	
> +
Extra lines
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct engine *engine = engine_ptr(engines, i);
> +
> +		free((char *)engine->name);
> +		free((char *)engine->short_name);
> +		free((char *)engine->display_name);
> +	}
> +
> +	closedir(engines->root);
> +	free(engines);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +static const char *class_short_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "RCS";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "BCS";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "VCS";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VECS";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "CCS";
> +	default:
> +		return "UNKN";
> +	}
> +}
why caps?
> +
> +
> +static struct engines *discover_engines(char *device, struct igt_device_card *card)
> +{
> +	char sysfs_root[PATH_MAX];
> +	struct engines *engines;
> +	//struct dirent *dent;
> +	int ret = 0;
> +	DIR *d;
> +	struct drm_xe_engine_class_instance *hwe;
> +	const char *busy_end = "-busy-ticks-gt";
> +	const char *total_end = "-total-ticks-gt";
> +	int card_fd;
> +
Follow 
https://www.kernel.org/doc/html/v4.10/process/coding-style.html#placing-braces-and-spaces
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +	{
> +		return NULL;
> +	}
> +
> +	if (strlen(card->card))
> +	{
> +		card_fd = igt_open_card(card); //open(card->card, O_RDWR);	
> +	}
> +	else if (strlen(card->render))
> +	{
> +		card_fd = igt_open_render(card);
> +	}
> +	else
> +	{
> +		fprintf( stderr, "Failed to detect device!\n" );
> +		CLEAN_UP() ;
> +	}
> +
> +	xe_device_get(card_fd);
> +	
> +
> +	snprintf(sysfs_root, sizeof(sysfs_root),
> +		 "/sys/devices/%s/events", device);
> +
> +	engines = malloc(sizeof(struct engines));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(*engines));
> +
> +	engines->num_engines = 0;
> +	engines->device = device;
> +	engines->discrete = !is_igpu(device);
> +
> +	xe_for_each_engine(card_fd, hwe)
> +	{
> +		struct engine *engine = engine_ptr(engines, engines->num_engines);
> +		engine->xe_engine = *hwe;
> +		engines->num_engines++;
> +		engines = realloc(engines, sizeof(struct engines) +
> +				  engines->num_engines * sizeof(struct engine));
> +		if (!engines) {
> +			ret = errno;
> +			break;
> +		}
> +	}
> +
> +	d = opendir(sysfs_root);
> +	if (!d)
> +		CLEAN_UP();
> +
> +	for (unsigned int i = 0; i < engines->num_engines; i++)
> +	{		
> +		struct engine *engine = engine_ptr(engines, i);
> +		asprintf((char**)&(engine->name),"%s%u",engine_event[engine->xe_engine.engine_class],engine->xe_engine.engine_instance);
space after comma
> +		
> +		memset(&(engine->busy), 0, sizeof(struct pmu_counter));
> +		memset(&(engine->total), 0, sizeof(struct pmu_counter));
> +
> +		engine->busy.config = get_pmu_config(dirfd(d), engine->name, busy_end, engine->xe_engine.gt_id);
> +		engine->total.config = get_pmu_config(dirfd(d), engine->name, total_end, engine->xe_engine.gt_id);
> +		
> +		if (engine->busy.config == -1 || engine->total.config == -1)
> +		{
> +			ret = ENOENT;
> +			break;
> +		}
> +		
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->xe_engine.engine_class),
> +			       engine->xe_engine.engine_instance);
> +		
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +		
> +		ret = asprintf(&engine->short_name, "%s/%u",
> +			       class_short_name(engine->xe_engine.engine_class),
> +			       engine->xe_engine.engine_instance);
> +		
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +		
> +	}
> +	
> +
> +	if (!ret) {
> +		errno = ret;
> +		CLEAN_UP();
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct engine), engine_cmp);
> +
> +	engines->root = d;
> +
> +	return engines;
> +}
> +
> +static int pmu_init(struct engines *engines)
> +{
> +	unsigned int i;
> +	int fd;
> +	struct engine *engine;
> +	uint64_t type = igt_perf_type_id(engines->device);
> +
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +	
> +	engine = engine_ptr(engines, 0);
> +	fd = _open_pmu(type, engines->num_counters, &(engine->busy), engines->fd);
> +	if (fd < 0)
> +		return -1;
> +	fd = _open_pmu(type, engines->num_counters, &(engine->total), engines->fd);
> +	if (fd < 0)
> +		return -1;	
> +
> +	for (i = 1; i < engines->num_engines; i++)
> +	{
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, engines->num_counters, &(engine->busy), engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, engines->num_counters, &(engine->total), engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		
> +	}
> +
> +	return 0;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +static void __update_sample(struct pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static void pmu_sample(struct engines *engines)
> +{
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	engines->ts.prev = engines->ts.cur;
> +	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&(engine->busy), val);
> +		update_sample(&(engine->total), val);
> +	}
> +
> +}
> +
> +/* tr_pmu_name()
> + *
> + * Transliterate pci_slot_id to sysfs device name entry for discrete GPU.
> + * Discrete GPU PCI ID   ("xxxx:yy:zz.z")       device = "xe_xxxx_yy_zz.z".
> + */
> +static char *tr_pmu_name(struct igt_device_card *card)
> +{
> +	int ret;
> +	const int bufsize = 16;
> +	char *buf, *device = NULL;
> +
> +	assert(card->pci_slot_name[0]);
> +
> +	device = malloc(bufsize);
> +	assert(device);
> +
> +	ret = snprintf(device, bufsize, "xe_%s", card->pci_slot_name);
> +	assert(ret == (bufsize-1));
> +
> +	buf = device;
> +	for (; *buf; buf++)
> +		if (*buf == ':')
> +			*buf = '_';
> +
> +	return device;
> +}
> +
>   int main(int argc, char **argv)
>   {
>   	struct gputop_args args;
> @@ -412,6 +931,9 @@ int main(int argc, char **argv)
>   	int con_w = -1, con_h = -1;
>   	int ret;
>   	long n;
> +	struct igt_device_card card;
> +	char *pmu_device ;
> +	struct engines *engines;
>   
>   	ret = parse_args(argc, argv, &args);
>   	if (ret < 0)
> @@ -422,6 +944,62 @@ int main(int argc, char **argv)
>   	n = args.n_iter;
>   	period_us = args.delay_usec;
>   
> +	igt_devices_scan(false);
> +
> +	//Yet to implement the device filter
> +
> +	ret = igt_device_find_first_xe_discrete_card(&card);
> +	if (!ret)
> +		ret = igt_device_find_xe_integrated_card(&card);
> +	if (!ret)
> +		fprintf(stderr, "No discrete/integrated xe devices found\n");
> +
> +	if (!ret) {
> +		ret = EXIT_FAILURE;
> +		igt_devices_free();
> +		return ret;
> +	}
> +	
> +	if (card.pci_slot_name[0] ) //&& !is_igpu_pci(card.pci_slot_name)
Remove comment and extra space
> +		pmu_device = tr_pmu_name(&card);
> +	else
> +		pmu_device = strdup("xe");
> +
> +
> +	engines = discover_engines(pmu_device, &card);
> +	
> +	if (!engines) {
> +		fprintf(stderr,
> +			"Failed to discover engines! (%s)\n",
> +			strerror(errno));
> +		return EXIT_FAILURE;
> +	}
> +
> +	ret = pmu_init(engines);
> +
> +	if (ret) {
> +		fprintf(stderr,
> +			"Failed to initialize PMU! (%s)\n", strerror(errno));
> +		if (errno == EACCES && geteuid())
> +			fprintf(stderr,
> +"\n"
> +"When running as a normal user CAP_PERFMON is required to access performance\n"
> +"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
> +"distribution vendor for assistance.\n"
> +"\n"
> +"More information can be found at 'Perf events and tool security' document:\n"
> +"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
> +		
> +		free_engines(engines);
> +		free(pmu_device);
> +		igt_devices_free();
> +		return EXIT_FAILURE;
> +	}
> +
> +	ret = EXIT_SUCCESS;	
> +
> +	pmu_sample(engines);
> +
>   	clients = igt_drm_clients_init(NULL);
>   	if (!clients)
>   		exit(1);
> @@ -450,6 +1028,10 @@ int main(int argc, char **argv)
>   		update_console_size(&con_w, &con_h);
>   		clrscr();
>   
> +		pmu_sample(engines);
> +		lines = print_engines(engines, lines, con_w, con_h);
> +
> +
Extra line
>   		if (!clients->num_clients) {
>   			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>   
> @@ -488,4 +1070,4 @@ int main(int argc, char **argv)
>   	}
>   
>   	return 0;
Remove all comments, extra lines and indentation across file.

Thanks
Riana Tauro
> -}
> +}
> \ No newline at end of file
> diff --git a/tools/meson.build b/tools/meson.build
> index 511aec69e..8a3290d39 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -71,7 +71,7 @@ endif
>   executable('gputop', 'gputop.c',
>              install : true,
>              install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
>   
>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>   executable('intel_l3_parity', sources : intel_l3_parity_src,

