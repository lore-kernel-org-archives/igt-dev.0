Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447EEC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 11:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E111610E058;
	Wed, 29 Jan 2025 11:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqgqcWwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E4910E058
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738149462; x=1769685462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fAJItOzADmACvjT1xWAv1seD0kxbFmuMKxqPQ8qFhXU=;
 b=dqgqcWwh7K8HdlHq8LmXDSSoZQxNHYUxUX3QlqPwLt5qv/tBB9wj2n67
 iKxoSjBN1dxhCidWZBRr9pyl8FSH5OFki9vpUnmRPqwmCxxevTMkHtb53
 +EulB8ag5oStksT0vVtX+rxMyXJbA1SHnpsQZQTDwD07k3sWeOvOtppkH
 WDRun8i0FwJN2k5IHu8YpU268U+7ezmJpfGf5LjRGI8Tw4WpUxmxPGqRV
 KGssVSOmrsU/UVhA98Fg+AOXwYst/0+gbWPWts278xKi3gPVIgcPNSSCN
 5YxsdmjoDGdjBtO6Wh+onEp80hmkvsrDYAcWmph7N+BNsFbhGrG5rEngl A==;
X-CSE-ConnectionGUID: B+X/nbhgQcKvhqtFxDzrew==
X-CSE-MsgGUID: aMJ77aVrRIGaX37HbcYUbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38763437"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38763437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 03:17:41 -0800
X-CSE-ConnectionGUID: fNKtlmPRRiCMhYuxMieRtQ==
X-CSE-MsgGUID: 75nEefE3TaCVqmlvfb1fNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113619365"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 03:17:41 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 03:17:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 03:17:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 03:17:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrKKSmCWYCIlUpoi7WmjuWJX4/pdkR7XVkblzin0qzHpwc0Bx+euBu7VWqMSCIm4VKvb8i18Dnxi0WEkBxgSKVXTkt39lCk8sfIiqUeRFYpn7fVznUkUX9m6t6yX70B1TmnaHLPX6EB0MVDccQjCFh5Qy+H6/mqkQ3HxdW+8cld1EpOf/Y+1YfkQEYoFJiBPsQqLwttwD7VMG7tNZcE0z9Bc41G5Pm118owtgdS81QNBkkXtwU6AtyZTo4uzYmANSUKuCubijIpME2Yfpw+ya15ipYYyOPCqSKAryZxyeO98bAsuz0hi7WJlV9g+dQ4ljNUxKNbztdPJfaFJKOvy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7HrMPfEpvLZCzLNpFW5qozRRU7QBEgzVITzMK4ZfOc=;
 b=wRCgvr4VzAXJSRXOtvIFS3GJzGb1h4wuMOGAXEllSmtn+bcvBn5NCEqxUo30IzN+zgz+AkccAzptM2I7dbSp+QuwJLiGd5cM/lAosKSVek/0dR1r0V2Y/wL5tmAuiZrc7LhbTLmay/RpwCfjYY9GuoVbe8F3YnfowDjQIfSDrX9hGjWApuuaqZsXh7IRB63gJUnOgwkszOMBijGaAUvVi1DNtghPmN5bcyt4eZWbqNCRlvongQy6BGWoWSGXuGuTMAeCPZReG1tb9KYTX3aAf1NMOUOBFqWBQMVjC9MMlKtEq8GI6qV1uM+ctki0Zojyk3CZs7u7XCCl3MKd6gPp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM4PR11MB6093.namprd11.prod.outlook.com (2603:10b6:8:b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 11:17:38 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 11:17:38 +0000
Message-ID: <be5fceea-92ba-4d50-9489-1954db3cc427@intel.com>
Date: Wed, 29 Jan 2025 12:17:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,i-g-t,2/2] tests/intel/xe_sriov_flr: Add flr-twice subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250116192906.636031-3-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250116192906.636031-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::19) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM4PR11MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fa4499-6bca-4bc3-8489-08dd40568a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2xrZzhmWjNoQmx3aXJHbnREb2RzcXhMRFVEWUE4dnNUOU85cllFalQwVTAr?=
 =?utf-8?B?M0lrVEEyMHVJT2krZDVpMk96QjU3OGQyQTJWZk0wM0h4bUNIY0FSS2RoZWxR?=
 =?utf-8?B?eWRJMThtQi9VQ3hNTkRzcEprRjV1MitPcmNrbFR6UXdaZ1N6Tzk3ZzhFZW84?=
 =?utf-8?B?ZGdUcU5HaEh2cHBoM0Rpam5VUmw5RzJVaGdzUVNieTluZHg5aEFpM25qaDlU?=
 =?utf-8?B?bjNFcXBKTlJGV0tuOWNlSStmbGloYndoS3FFRkZyUnFHWjFjN2N6c2JQWHhK?=
 =?utf-8?B?VW9vdHRMdHM0RHpHU2RoRzk5SWljV1M3V3dhTUJDbnhrY2pUNlQzUlZTZjhS?=
 =?utf-8?B?anNGaFNYOWlYNUJPd0kxcnNmb2VINXNzbURNdEJRbkdPb2ZvaU16OFc0M2Ez?=
 =?utf-8?B?OGs2T2t0dHZnQ1VEWWRaaWF2WFgzTVRKSlRMM09YckxBbklQRnVJMnIxZU9X?=
 =?utf-8?B?RmpWQWMzaURmZm9tRDNsREZlQTlLMElibE80SUhHVURScVR6cnhVOTl6aktO?=
 =?utf-8?B?R1BlNlNWWmF0MStzdUh2aGJmUG56cTRMb0hpbnJrQWhHN0ZDSnY4R3hLQVZY?=
 =?utf-8?B?cWppakhlTzRLZU15RWFqOTRxZmNJb3I1QmhDZFUyZXkvKzJSd1VYYjdacXpv?=
 =?utf-8?B?UjlFSUxnSGpUODI4WFJwZVM0OUs2Nk1adkJmQlRmRmx4SlF1dXhBeVBuSzhi?=
 =?utf-8?B?R1lrTjlYZ3VkdUJ5bnVoMzJ3TFUwWXpidDdLam5oNzU1YmpnZmxyYTNWVkNT?=
 =?utf-8?B?eHZnOWluR3NROEVZTGI0eWp2RDJaMmRxOHNURFo3Qk1RdDJwM1hlNFI2aTFr?=
 =?utf-8?B?VDdBZGg4S09EbTN6OUk3QmRtK3Y3Y0tRNG9keTRRYUtkYzhQRkdFMVAyZWJY?=
 =?utf-8?B?WG1OMWd0ZUhKdFFzKzgxeUJrYW9rMjBkRmEwa0ZXUDVpV1V6eityMjRTdVdT?=
 =?utf-8?B?SjRicXBleFpHU3RtNEl1aDQ1WkVveDIvOEF1bEw0SzhqRVUyc0pjdXJDMkE3?=
 =?utf-8?B?Z3JPTGVUSU9ieExyVFJGeVRlZU04RnVEZnlwZ0NNcDA2MC9aa0VEUGgvQzgv?=
 =?utf-8?B?SVZWTVNEVmxNZk1IdCtTdjNZMUFDMDVncldFSnJ6VnhEZVZSRnhCMEpjN2gy?=
 =?utf-8?B?VnN2alFwMXIzRXdKUVltV0xObFcvalNqTko1b1NCQXd5T250TFdGbVBOUGVi?=
 =?utf-8?B?UFdDTlN3MnFRTWNZdkF5STBRTEtvOTg4QXlSVnRyM0hkRkR2SzYreEZMN2xY?=
 =?utf-8?B?QWhRUW9TWU5VYjBMVWVnRFdSZW1ZSHgrV1drTHBMRldWc3MvNmJRbDluNE1E?=
 =?utf-8?B?RHgyRUx3WjNqTlJjZ1B3enZucHNtRFlkblZzSVZ5Y0piYXdiN3VPSnp3RVR4?=
 =?utf-8?B?SWRmRWZ5OGZocWdnSDA5ams0MERERnJuS1pPQUoxcW0wd2VBMkNKaXBvb1FT?=
 =?utf-8?B?T3Z6NGRwY2RqTUVPWVFQcHc5ZUIrL2tyVXhrbHBKUUVNTjJleVJkVUxsc1hM?=
 =?utf-8?B?cHgxS2h5SFVVSGE3QWY1NWdTYWt5dWFiL2dhUUJWWFFTWlVxd1lrY1RkVFll?=
 =?utf-8?B?YnA0ZXR0anQ4dS9RZmhlVmZ4RzJMR05MeWplcnMrTFdSSEtLWitrQ0kyRFYz?=
 =?utf-8?B?WEtDQ2wzRDJBUUZtQk1jbFFubjlOWW55TTBYSVdzK1R6K1BTQTBNWlpEcGxH?=
 =?utf-8?B?TjdhUEEzakc3THF5Rk9zSWJVdXNRTUxWQTA1bmpGTE5aVyt0UE9wV2RXSFp4?=
 =?utf-8?B?S2NuU0JBYm5tZjBQNjNrVW83d28vdVhXQzVpNnZZOHBRTXFDQzBXZXhsQVJJ?=
 =?utf-8?B?RDVEVm5MRGFzanE2R0FldjJhLzRPczFzQkcwK0xJT0V3bHM5ZnhvWml3TmJ1?=
 =?utf-8?Q?3JJffaMNdHyJY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXNTV2ZYZ3Z4UG5pR1A0Sk9vN2ZZY3FzcWs1VTlMMStCVDZxL3NjN1Z1Q0py?=
 =?utf-8?B?R3daVWdrdUU5UUgwODYyMWxlZGVtbHZNRnV3VWNuSmtxV1ZrKzlrMkxRYS82?=
 =?utf-8?B?NVpHOENWYVNMRW00eXJqUHJvQzNielBudUtpMjIzbGtPbHRpdTV1UVlZL2sx?=
 =?utf-8?B?UWhOTVp3S05sTXE2aWcxRGFRSyt1U3V5Q0NkSVp2VnErOW5aZjdwRkd6NTh4?=
 =?utf-8?B?d1Y0ZzNrbUV0eWtTWVAxc1g2RVBJQXZCemtRb0lHVnJsd1o2cnE4a0NIZHIz?=
 =?utf-8?B?Tm1KdGIwa1lBZjdQK3IrTmJhcGJTWDN3TmI0bUdya1JQVjhFclVSTXVZZmEr?=
 =?utf-8?B?dXcraEFRSGJZREJERHVrNStXZ1BrNE4zbzBZRGxBdzJXSklRRTZqM3JJUTRT?=
 =?utf-8?B?UFRQeE1GYWhIWndZczJvejVjcSs1dHY0RFRJd3B1ZVNjcW80QkJSY01LVUpI?=
 =?utf-8?B?OHBjamFVTHdpNmd6d2tSOVBrQXBJMW9nem9XdlhYLzJvWElYaU11enBBeWJS?=
 =?utf-8?B?SzlwOGRtT3VSMUZlN2k0elYwQnFEWnQyOW9FeGJ5SUd0d2JIYXRVekxFM0ZL?=
 =?utf-8?B?MTcxWk51STQ4ckxkQVh6RVF2Q2x2VmludmF5Wkk1MGtvS2ZVYWw2SC9xNXhy?=
 =?utf-8?B?NCtTeEFpSTNQaElFNk1hTktGbFRUSEx5K2hXaGRkbnQyWlJSbEUwZmhhYVM5?=
 =?utf-8?B?dnRocVY3MGJmMnNHSm9ndm4rby80MmRFdmRZNVZRZkRNcTNua1hIZVNzeUcw?=
 =?utf-8?B?UTdNNmFwazU1UGYzdHl2SXo0ZllwaEhoTVNNOVFpaUpGTGtTTHRscGQyMkM0?=
 =?utf-8?B?Q0Q4T1ZWTGtTaGNuVFpyTHA5M1VzMG9pdldvZENORGpKVWFUdVZZYVR2TVYw?=
 =?utf-8?B?Q2dWT0N2QTNpbHlrUkprRCttVDhSckNNTWg1VGxFMjlHemVTb2dNQTNrVHhk?=
 =?utf-8?B?MTNHNWpPTXR6dUpxOHBadmtSRmJvUk1kTkZIMUdqOFlKTzE3M29xSjNvY0hX?=
 =?utf-8?B?QnZDTWc3OW9XQ3RvT2dBWTVFUUV0S0RMR2pzVldSNENubi9JMWRlRXdlcFJI?=
 =?utf-8?B?RjRhNDR3VlJHZWN6UlR1dGtabndFQUVEcnNUaFlwWGlYa2YwOG1CTUtUSzJy?=
 =?utf-8?B?SGlkOHRwK2UyUW40QWs2UGo5OGpsUXNIUWN0Q2VkUitJdkI0ZWM2TjhDeE5M?=
 =?utf-8?B?N3V0RUxYUnVKYnQrRkk5RFJMQWxKaGlxcTdoVXk0emVvRThDWktSYkZFWXFG?=
 =?utf-8?B?WEFqMkgzZFBmOWZsdmhiU3dEeno2YmYrZVIxTnAzNkhCUityelpUNkdmd1hm?=
 =?utf-8?B?UXZHYmJQRXZVRk8vdHNHSWkrUHpSaEVsT3o5bmtad3JTMUZObVF0a0FsTldv?=
 =?utf-8?B?VDdzaEJIdTY5YXFuYjlXcnBQWWZxcGdNWUV1T1JnRUJjLzZ1ZE1YdVhjWEdx?=
 =?utf-8?B?VlNSdzNFa0VPSlpFNHlzbVBzaG1iUHRzSTVRbXVEOWJDSkc3eWRxZFJubGQ4?=
 =?utf-8?B?MnhSc2Y4MWtxUzFDMDNnYzFVcDd5eEE1VHJzS3lETGg3ejdEODhYVE9vSEgy?=
 =?utf-8?B?TlI4UFhBUW9wR2FTYTVrMVgzcURVVmo3WnpFWjBocWloMC90YXh5cUhIN3Jq?=
 =?utf-8?B?V3dMcDQxdWJ0Tzc1K1ZGdWdJU2J1bkRmRDFLRFFEVmJUVE5qVmZrZm1HV0Vk?=
 =?utf-8?B?Z3dzMVk1YXRqLzQ0SDM0QUVzY3ArRlhDc2FtbFdXeDZqSUd6RnVWWHNnOFpN?=
 =?utf-8?B?N1hManNBUTVzVXF2UFd4KzdvQUxLcVJ0c0hwTWgzTVRrMXhKdUg1MTNYODZa?=
 =?utf-8?B?WlRlUnFWaklKNy9qcnJBKzY0Z3dsQU9ZZm1PUmJ3UEtsRlFHV2tlSjVjbFZU?=
 =?utf-8?B?R2JxMGFoU0ZzUUNVRlpOWjcvUHBtWVdITGJ0d0ZsKzQrekxWMkcwd2lCOXZM?=
 =?utf-8?B?Y0JST2p3RUgrTTNJeEY2QkJqbFgzSGhkaDVLKzNMWDd0bzUwK1VGL2sxL0xK?=
 =?utf-8?B?TE9pMnNHTEdadjJkSE85SGNwQVcrc2w2dE9JazE1bGk4LzlPVjhDMmdkblQ4?=
 =?utf-8?B?STJDNFZSeHBTcjhnNDBxRVU2ZEhhSXZmZnFWSExTZkJST1BqWHJZZUp5ZVIw?=
 =?utf-8?B?QXBoQnFjTjEvTk5aSlRmMUFlNmpkd3B3UGF4Y3BtMTkxSW5SaUtEb2NLdlA0?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fa4499-6bca-4bc3-8489-08dd40568a11
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 11:17:38.6542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHuf3A5UKFWZGRD5bJwCmogjIytz09rkG59M8cYnBAaUwqvFqU+rQy9wWJs+/0W3Z9+2TyZ1QHZOhvHVknWCjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6093
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


On 1/16/2025 20:29, Marcin Bernatowicz wrote:
> Introduce the `flr-twice` subtest, which initiates FLR twice in parallel
> on the same VF. This subtest covers a use case where two FLRs can occur
> within a short time frame, such as when starting a QEMU VM with
> a passed VF.
>
> Example log showing the behavior:
> [  241.906514] vfio-pci 0000:00:02.1: resetting
> [  241.907123] xe 0000:00:02.0: [drm] GT1: PF: VF1 FLR
> [  241.907204] xe 0000:00:02.0: [drm] GT0: PF: VF1 FLR
> [  242.013441] vfio-pci 0000:00:02.1: reset done
> [  242.040918] vfio-pci 0000:00:02.1: resetting
> [  242.041794] xe 0000:00:02.0: [drm] GT1: PF: VF1 FLR
> [  242.041803] xe 0000:00:02.0: [drm:pf_enter_vf_flr_wip [xe]] GT1: PF:
> VF1 FLR is already in progress
> [  242.042207] xe 0000:00:02.0: [drm] GT0: PF: VF1 FLR
> [  242.042214] xe 0000:00:02.0: [drm:pf_enter_vf_flr_wip [xe]] GT0: PF:
> VF1 FLR is already in progress
> [  242.149432] vfio-pci 0000:00:02.1: reset done
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index a8d35be31..50f88fed4 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -41,6 +41,13 @@
>    * Run type: FULL
>    * Description:
>    *   Executes FLR on all VFs simultaneously to validate correct behavior during parallel resets.
> + *
> + * SUBTEST: flr-twice
> + * Run type: FULL
> + * Description:
> + *   Initiates FLR twice in parallel on the same VF to validate behavior
> + *   when multiple resets occur within a short time frame, as seen in some
> + *   real-world scenarios (e.g., when starting a QEMU VM with a passed VF).
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
> @@ -449,6 +456,14 @@ static int execute_parallel_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   				     wait_flr_ms, 1);
>   }
>   
> +static int execute_parallel_flr_twice(int pf_fd, int num_vfs,
> +				      struct subcheck *checks, int num_checks,
> +				      const int wait_flr_ms)
> +{
> +	return execute_parallel_flr_(pf_fd, num_vfs, checks, num_checks,
> +				     wait_flr_ms, 2);
> +}
> +
>   #define GEN12_VF_CAP_REG			0x1901f8
>   #define GGTT_PTE_TEST_FIELD_MASK		GENMASK_ULL(19, 12)
>   #define GGTT_PTE_ADDR_SHIFT			12
> @@ -1073,6 +1088,11 @@ igt_main
>   		clear_tests(pf_fd, total_vfs, execute_parallel_flr);
>   	}
>   
> +	igt_describe("Initiate FLR twice in parallel on same VF.");
> +	igt_subtest("flr-twice") {
> +		clear_tests(pf_fd, 1, execute_parallel_flr_twice);
> +	}
> +
>   	igt_fixture {
>   		igt_sriov_disable_vfs(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

