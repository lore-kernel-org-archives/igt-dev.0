Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7537103E162
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 11:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1D010E11A;
	Wed, 18 Mar 2026 11:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwonedQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA0E10E11A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773832946; x=1805368946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z/jzlyGypWcXahjBOloeER5iKbx9X7P2PzJLkMaauvQ=;
 b=XwonedQOSKQWHo5kgYh8KtGjgVHlWkSnO3aY7NJjTGO9Uzimfxl3PCwj
 NwX8xvKU/n4QB2zmaOSe2QIAaPR4pnp2gHFx22Ub8DfNlG5Yl31MRSMEM
 DEE3Vt2glvgzRohK41TUka40bHYCCjEGXUDxsOhkhD9NNku/xKyUTlv80
 MvUtKoH/QaI0Yr3ToZGfaHo5WADySpnOAyMD7oVnFfM/SoO1mZEgrKFLO
 GMW2ub6HsIMRhmsRgsrKn3sRvfIRCwwwPYtlKlmAql76Hi9vNhk3RFBZh
 wgjtBVLI8Uo+MaV+TRAAIvD1+7uTJVcmCerj2+Gqdxx0AQIwWsR5BH674 w==;
X-CSE-ConnectionGUID: oycnYVZ9RP2KhW1fW3YFMQ==
X-CSE-MsgGUID: 724tbw/HT9mkKdhhax9v/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85198243"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85198243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:22:26 -0700
X-CSE-ConnectionGUID: 2gmqkbW/TVi9RsTmBxE1/g==
X-CSE-MsgGUID: sHU+qgZ0TqetN8ZNPPL9Qw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:22:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 04:22:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 04:22:24 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 04:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwLo2iSoYkqtm19RJiW7sb4CwTN/HhYwd8kvWJUxTLcZS98y/qGhaVZ0cszUqC0kPZX7p04YDFKSOTm0qfIUt6E5Pythn+3ilGUpQEOHf8sv3zPcvULHB6AnktOVbfP8LNZ9ORPHssShQFaaoAJj2bxuNplUZpKAUuemqRHB9mSqwFNMMrxVR2ve6pcrOZ6Im+YZUj21hlOeX+3MynMkJmoSVvkDdKgVwPr5HU2R9OULuvv6mbP7dFRTptaPZUXqad+3vrzhq5uObctif0lNjOTi6ZNF7d6Xf6j6hG4+OxOHUEfzLmrx2ALA1nctV83hdojX/Chta1pSoENCc1nRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B30Ur6lyyK8HOjI+UTzBeJUAiWSx3Gr6SSaT+Wm6n10=;
 b=LlGNRT+npaD8fmaAB+txOrUXIHl8y4WMiO7inxledk5gQnkGZGXCjk7sYF6WFkLI1rBALgR/3V/HmM86HwmeG6zxi69qyuMvU3vaKII70lfxSGy4Em4eX4MccPN5r1NgQPNLu8YnQkyKcITrhA78tiz4AmE4yJTzNkhgDVQAqCBz6QWeyKH289hOHLnQxEy2DUVGBcQUwO0iXYaKgEcPxEjgL5uVd9IS//gt8nYyMJ+pF0pAAciFJZ1QCC3O534EiquLZXAC/BDpVTvuT3hOnvKnJjuyZzkAm1oTYNiEsOKFhDCV0PePg0SM8ofr1xBLNis0oB3g/51U/6EzaHnWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 11:16:08 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 11:16:08 +0000
Message-ID: <c8a6e72a-bdad-4c2a-93eb-e7eab15ae1c7@intel.com>
Date: Wed, 18 Mar 2026 16:45:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] intel-ci: Move suspend/resume chamelium tests to
 end
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <kamil.konieczny@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
 <20260316075611.3333142-2-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260316075611.3333142-2-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH8PR11MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: d7689f9f-44fd-44ed-89c3-08de84dfc0ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: WO2F5sfXtP8/IiufV2FU9Kun7O/oV+kgTA5rHhhtr2N3VKJrWvSfb83wUPkcyGe2T5zBB0up3mqBjMvbuW4++tXyzsJmICHx1Qz86ZFmtH/GArKmI7sUc+8+typEu1K2sIou9cb+8de6CkMBNQpS29s7UHJOalXZ9rk0GbtEdnPu8b1sHjPUAtjMRTwiv5vcciohB7RobJNelfsNBCGxao6boCjxHqWcZqpyU8Xm+7aEQh3SMkkxKJ7avld5KIQ0mixAIwvwL7t+3sRNXAjqkh32kV8p13Rm9JjqoWmlJe1VUK7mjTfE//KSvMSLTKg/kxvUhmCit5qzePdp57oEBJs8nlPuV17K2ynH6QmN+mHQ6edTBwpZgqkszdp0QMuP2pvv/8VgS5/xRAuj7UFyH22mFs2s/u5uLPB0ORH0ecooqhf7e+/YAVieywV/aJMiELBXGk7FDBVNz71VrqFqtIrFDoXDQI/z6kmy+Fu96bGTcy4MagMHYXLG2FmMu4Yp/7JVK6lGtht/2evchGcnq0Zo+m+MUdC+RbIL+ya0XgPoo2/NHgHfAO58n9vCc91vK112cqtrMWxqkVV54hGIZVh/hSxtvvoRKNcE02IFo4lw3jdhBfH47QbEv40EEuOX1s9NKD1VqkBY6prraigkHsVqiMLVYOg0p0lktTHclV6BYQdfNCo4NtEoOhaz8uEkkpvSCFMBzHGjZUbQ+oxN7ffhZRGEGXfVhrXbSBP4x30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE1uTHcrdm90aTRzN3VaemMyNkIrOGVzZjhPMVBLQlI4eGlaMVZBb1ZTS254?=
 =?utf-8?B?Zmtub2lmcUdMWVViK0NMb0JYQ2IwMXF4R0txd2ZBaTlMTkpRakhGNkljYTUv?=
 =?utf-8?B?Y0FPNHdKeGhWODYrbGZTOXdaeE1NRVpFaEdZM2wzMGwrRUhzSS9QcU5mVk5r?=
 =?utf-8?B?RWpLMDRpWkZUWjN1c3pwUDRDRVJBdjBHeUY4d29ZTUdUOW4wd3NWaUcvNlA2?=
 =?utf-8?B?L0YyZlpjV0RhNWhDL1dHZHNacU5KSUNWTDgrTFZ3RnlrN2IwL2FtOWRraEF2?=
 =?utf-8?B?WTIvanAwMzM3c3JxOWZFTzR6bitqeko1ZFNPelpaajVuUml2eVhHajF2OE41?=
 =?utf-8?B?QjMzbW1zVGpBWmQvVDlVTmxCVk5HdEtKMmR2M0JFUVI2L2c3Ym1oMEdwSzNE?=
 =?utf-8?B?dmZtaG1YZXl1bGV4US9QVWY4MkhjWTY0YVVqdEI5b2VmcVpXZkc5VUZna1VT?=
 =?utf-8?B?cFEvWTdwTExqVXYwVUNXNy9KQ1oxTkxHQms2SU84M0lFZ3RWb1MvRFFFLzlp?=
 =?utf-8?B?SHh2ZzdHZWRKNGttbEUvcldTSWpoUGhOM2tBMWkyejl5SW9JenFEMFpuWnpp?=
 =?utf-8?B?QWVja1NPSjJwdnRxMGQ5WlZoQlUwbEpXbmh6REpQNnFLcGNkOWNNVFVNRDRa?=
 =?utf-8?B?M0U4bnN3ckNjbnlWUHpQT2V6c2NVLzBJckRnWVRtTmd2TURxWHBuRTl3eE1y?=
 =?utf-8?B?ZHp6L2JWb3Z1a3RXNWRRVFJpaWxzV2tsRnVZcytFYnIwWlRTMHFsVkdLTHQx?=
 =?utf-8?B?SmlJaDBUTitaRHorNFl3SW5jVDIzSmVTNkxCeUhxT2JkZFNuT0JFZVZROGYy?=
 =?utf-8?B?THh6Zm5HRlJ6d2RZbWwrOGJaVVdQdlFjRWkzSVFMMFJISVR4LzRBRTFHOE9T?=
 =?utf-8?B?aE1melNnUnA4KzArbWxIVGxKWTV0WDN4T1VOTDFXR0ZqVFAwN0JuMzlVRkky?=
 =?utf-8?B?RlhueFJZelJnQkxoRFFYM214c25yT2lXOVFVNDlpaUZSWTlNZ084ZmJ0R0pI?=
 =?utf-8?B?UklNdHQwT05UUG5kREloUXN5dElYZFdzSXNxbWpnbnZZYXdtaGhqZW5NcVF1?=
 =?utf-8?B?bGQwOUVpZENmKzRsRmJpUEp4WGpmODZxajdtc0RDUHkrYm9qTDUyeVVINU5w?=
 =?utf-8?B?ak8ydVc3Q2lyV3dwenE5ZzRNaXpTN1hNRXc0UzFSUm1USlVVRkU0QVpVanRT?=
 =?utf-8?B?a0NHWDBUdE5wVzJhQlNwbzNJSzFOZEFXSk4xS1ZMcU9rNjNtNHBISFFSS0Fy?=
 =?utf-8?B?ckMyRldpUVlScHFLOE52WnQ1QmVwNWllVXNjZzdjTEV2eVFpdjE4b0RpS05l?=
 =?utf-8?B?TmdXbUx1YTZ1Rnh2TG5wQW82Y01ST0JIR3dEVFpWTHVBYnh1YUkxYzBGcGw4?=
 =?utf-8?B?Z01MMEltZm50R2o0YmZuNFQ1L2ZJU2xiNVBuUTlhakZtNjRKU3psQmRIVkhj?=
 =?utf-8?B?K3FiZUd5OUh1UDRNbzloMk9KV1Rpc2R2MlR2VHZmd2pRbWxWT0NFNUo1QkIw?=
 =?utf-8?B?OWdlaUhYSXpoRXJ1aHl2b0RVdnBUcmowcXhvbnlRa2xNWTd6NC9YanNQUE5u?=
 =?utf-8?B?ZDdIL3c5cUJPSXBNUEc3Rkt1OXdVZXE4WTEwZVpuV2xZYUJLNCtldituSlRy?=
 =?utf-8?B?UEVIK1laNUtRR1F1QldRMFVHdmtLeUMyeEJ1aHFLd2UzWkpmRjRQOFlZSWZj?=
 =?utf-8?B?dkZEdDVMVW5RcHdla3NMZEZDZTRHQ2cvRks3b2k4S3BPaUc5bzFGd3RxeUZ6?=
 =?utf-8?B?YXd3NU85ZjdLaGJVQ3N0ZjRVL3NLOWZMQnpPamJ1YTl2cjVIYXBtMUo5a25o?=
 =?utf-8?B?dDNiZFZ2SWZ6NnpLRndKNUZ4OEUwVW91SW9mb0kranYvKyt5RW1hZktWOXpt?=
 =?utf-8?B?U2VUMS82Q1ZaSGh4dDhHV3JqdkNUYmZDR3p3b3ZYWVVNUHBKUktTUkRGOStL?=
 =?utf-8?B?ZHo2bmF5clpzeEFBc3NuS2VUK3VpR0Z6Qmg0bzJibVhHa3czQ0cxY3Q5cmdK?=
 =?utf-8?B?L3k3dEMxSU5EUDZsR1loNThyYXpldm9oZ3U4cHZBTGdqZTFJd01DRGRzMURo?=
 =?utf-8?B?aCtudEpJZjBQeHBseXFHRTVxbnpDUnFoZjI3b0paT2lLYmtWZmMwMzBOMzdv?=
 =?utf-8?B?TlltOTk4TDlJZk95aUtyaHpRLzU4OHJKYlh1bE9GT2hTVk1hLzJDQmdkMDk4?=
 =?utf-8?B?aCtON0FuM1ExRVh2OU9yMlRaOVJQejhjRmZYbE4rWHZoWEJnZlpiSmplK1Nw?=
 =?utf-8?B?K1JmU2ZCU0JkNVVUTkJOV0diaHVVTzJoRGtPR0pHcWE5a1U0STV3RCtxMkI1?=
 =?utf-8?B?NkhzelJVTmoyRlVRcWpmWU9wT0E2cldCajZkeDF5WTR0NFZ1djN3dz09?=
X-Exchange-RoutingPolicyChecked: izB1wZxo6+f+A232Yh/wlqcTHNXm1cnPqqYuNvMIEFhyJriCFJrHhYVMbJsHDimhWVOmLklz95aKUFYWO8bg7pzOJ/PdKkdHZ+mBuS3GsGZT1+0CmWAdVNDCvGK2B+sQtOlYJ0YuT6od4QVoXdFnKViC+5wPEqV8qpDuamKgXnhZtgznu/JK5w4QSgcximTROVKWYXkFxj4cEoDw//pBkYo3Bx1E6k0EMPO/fVok5+D8P1jAiSbGRaSSUq7tWVSv9gVrf5lRo7++9zvobH43lqY+wmbJhQ7aElfL5ClvWpyed6ns8uXYqpwZBsXyZfEtLAMNgmCn1etFYlmPt5Zb6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7689f9f-44fd-44ed-89c3-08de84dfc0ba
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 11:16:08.4608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCqLhrFJsZaS7GiDAVdI8sMyqO3PmVU0vgYF4MVMGtqNh9+VOVA4Ow0mrwbenvMTjdz8ip4jjgoPtTnZUD8G3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
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

Hi Bilal,

On 16-03-2026 01:26 pm, Mohammed Bilal wrote:
> Suspend operations can cause system hangs or connection timeouts,
> so isolating them at the tail ensures stability of main test
> execution.
>
> v3:
> -Sort tests alphabetically (Kamil)
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index 9adace28c..adc9aea92 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -12,13 +12,11 @@ igt@kms_chamelium_color@ctm-negative
>   igt@kms_chamelium_color@ctm-red-to-blue
>   igt@kms_chamelium_color@degamma
>   igt@kms_chamelium_color@gamma
> -igt@kms_chamelium_edid@dp-edid-change-during-suspend
>   igt@kms_chamelium_edid@dp-edid-read
>   igt@kms_chamelium_edid@dp-edid-resolution-list
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
>   igt@kms_chamelium_edid@dp-mode-timings
> -igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>   igt@kms_chamelium_edid@hdmi-edid-read
>   # Chamelium v1 board HDMI receiver supports max 4k@30 resolution
>   # removed test as its having a mode 4k@60 resulting
> @@ -41,9 +39,7 @@ igt@kms_chamelium_frames@hdmi-crc-planes-random
>   igt@kms_chamelium_frames@hdmi-crc-single
>   igt@kms_chamelium_frames@hdmi-frame-dump
>   igt@kms_chamelium_frames@vga-frame-dump
> -igt@kms_chamelium_hpd@common-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd
> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@dp-hpd-fast
>   igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> @@ -51,7 +47,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
>   igt@kms_chamelium_hpd@dp-hpd-storm-disable
>   igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
>   igt@kms_chamelium_hpd@hdmi-hpd
> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>   igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@hdmi-hpd-fast
>   igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> @@ -61,7 +56,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>   igt@kms_chamelium_audio@hdmi-audio
>   igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@vga-hpd-fast
>   igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> @@ -75,3 +69,10 @@ igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
>   igt@kms_chamelium_hpd@common-hpd-after-hibernate
>   igt@kms_chamelium_hpd@dp-hpd-after-hibernate
>   igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> +#Place suspend tests at end
Instead of this, write what you wrote in subject.
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
