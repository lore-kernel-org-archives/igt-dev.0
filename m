Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843E0FEC11B
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 10:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383D310E1B4;
	Wed, 25 Mar 2026 10:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkR+2e4r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057BD10E1B4
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 10:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774434462; x=1805970462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=kOkRMj83ywDl5m5u8wyUPKoM1a9sQJJGwBqdabuE23g=;
 b=GkR+2e4rRdK8fooWsUkxGMFfCWhJoHHNglFIrp9tEPSvp5EC9E2qgIkY
 szF+iPOQbeHjr8wB8Ql6aTtDug09/350sumOKV9N98/KLabfJlTYWZIWv
 kZtBYeG1fGbDv95qivFrvYCc9HxXcyBI6IVOKCxuoeD7a8lRcfYdmU3JB
 9WXI6HbUGYift2cd2X1oQnaz9YEpsMIz5ZNWoVs1b3WaUUqfu5yvw7fw/
 x2h2Xb3E+T6/LX7f6tMTND6Qqppcr3V+3E+4kr/Gh4+ef1SiaJbIjKUYL
 Zk891ZZesOOkLTEw8AJfi2hLQ/FscqzOUmEopfXnXKOSw1X3JDgwIOgDX Q==;
X-CSE-ConnectionGUID: O4N1oiPFRSOQsO3Y3JYOVg==
X-CSE-MsgGUID: vZyjLYtHQue6YpwN8lmiKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75355077"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208,217";a="75355077"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:27:42 -0700
X-CSE-ConnectionGUID: QISleKfNRgq7RlN3PGz0LQ==
X-CSE-MsgGUID: DkJ8Jo5wTIeGtw6wtsmSuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
 d="scan'208,217";a="224595105"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:27:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 03:27:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 03:27:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 03:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGs3z5+y/qsFtTcPMWE01M7woPi+79EZ9bPypiqlblgvGkkLo+w3UOkf9KR+IgVUiwCun+WFUVnG6Xxjcr92gZAlDKWPXIoA2C4Tq/7ECRG+yqX7bS5N3LJPplUQkiNccRQD7kN4wf8wQ5C/gv+tvDKpJp9AydATXEtn5TypmjNRC/WExztu7ikWZmzv53jTdU6a2XjGl7Rin6N4EXYZt4HPg5/4ckljdEtnCAQkOZACSdpQpSvmKYC5u251Bik/CRZCDYfEqaA1E9SRJ7ZqkidIh/cYHtOpdoUm+79kb8cA7SBEymwP33u+RihRArILufNpQ0nXKV1eMopMDPG9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHngN0csbp2NwXTNQ4yrsXhZnxVWatx1dD6uPz1Beuc=;
 b=hdd8mgbDSEZ7Go0GW/IyqqXUYQqfQ+nxo+VIQ84B5Kppwyhgxboh2/V3eTChRIM0D/PejpygQbIQsDBbRiA59oGlRZAF3qeBh3unLgJih9Hl9tVetHQzaUHkivRILRhQPr4xurXu0sQIb3EOxvOkpcGCsu6JgpplOcWX5lE6N5vCTOxW/f9KBL+Qyb4xuuvusPQkX0SwS/qbHYe1NbIRcluYwQM/kghABXsv70Cw/uZhLNkm/kp5Tqg1mPwwhWVcR8Luo7OZlOS+lyNsMzhyGFrQwT9kmcGZ17IxgYqTn++/NFvXDfp0wszL0gwFZ6mQ1rPtuOQ2BwOicmpHzKbAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH3PR11MB8436.namprd11.prod.outlook.com (2603:10b6:610:173::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:27:30 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 10:27:30 +0000
Content-Type: multipart/alternative;
 boundary="------------xQHXOiE27qOAD7X0n1Xo64kX"
Message-ID: <c6d803ac-f788-4129-a44e-ad0494c43ed2@intel.com>
Date: Wed, 25 Mar 2026 15:57:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 i-g-t 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <thomas.hellstrom@intel.com>
References: <20260325060339.2499618-1-sobin.thomas@intel.com>
 <20260325060339.2499618-3-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325060339.2499618-3-sobin.thomas@intel.com>
X-ClientProxiedBy: MA5PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::14) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CH3PR11MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: de0265a5-be03-4d39-2f57-08de8a591e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 94WYUpiNz72GrhAwOu6p0MhB/wojUF9wQrK6oPQgIwcYtQwoiKjkshY5nfy1iPjH5bi71tSJqBpZ/Hz/3v5+Nx+oyIK3f4vSrwPlK8LMmv5/S07x80Y9TWprx2RTzrnv94ge/6WdmbneEQl1ntacs99JvqSOBDjQfYWQE3JDh3uCS+3EAZ7S3FLLypSjL0eaprT6JgIp6U6IFsjtabg20DgmLCrxXmPqvhj+4/15kn/e0HmQgEkPAY+EC/a4aD7wew29KKq1edW3Zne00nRWB//RCxGPI5Frdc9jCFNARSwZVaxTh1nz42u8WE6oggMjoxej2ERYOmiRPvCnKRLjsE9LtS0Nznm28l5IiXkoFDe7Y4GJMVAIrHcmbt3lmT1cFLAPBZiEHIM4RQWTUFcCFSGFMankz+/38YSqhGJRj5bAMVi5vaMpSrlhgZi92034Ghws/pmgNfPT335bc2KcMbbxxg6Wv3TYrIMtTX7OSJcXDo1029XOejHIBSm5ga1d1DjHcO/09oDbEDG1K8EctfPCZKtBa1TEpnTiH6bZwCUMgjdl4ZnxqRO/0nQF6aiwivnXJir6+EJRnyFENRfNx5eWsKVCZCqRpXzRvE+S0DlED+lJD/RaGmO5i6xCZwDuvaZJxPzPsCytU1s8VNop42vulX6w5plzUxKQEBPbiOnaRepQkpKgUItOApy3coGOpLNNWpTJCfmOICjVGnEHs6wrk4LwLn9UoVfKefkaVrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnc0eHFZL3k5VC8xdlVnVUJXTU5JOTBJN2RUUUU5OEMwU0J2T0JJTzFHVmNT?=
 =?utf-8?B?c1pwZzJpQm1xdU9xNEFnMTFUZmVNZ0FzbHp2Z2c5OUltZEtReWY3ejloV2Vl?=
 =?utf-8?B?MlpaYTFuY1NFTzBJcnROYUNYcTFaWXFmTFJIbWhBVS8wN1I4b0pNOFhnaGo1?=
 =?utf-8?B?OUgyTmpoMm4yVkRuMVlFQlFqQmpoVkVZNllnR0VNdFg1UnZKZ3RhYm5uNmM2?=
 =?utf-8?B?VENrbXpwajBpRVBZM1pBQjdadDBEMHVzU2ovZlc5SmFTVkZVWm5kajMrQWlS?=
 =?utf-8?B?d2kvUHFENVNMYlVTdFpzc1ZQSWpxYjFNTjJxQmhJVDh1MkdSOTJFTXZUN2xh?=
 =?utf-8?B?NThGcU4zUXdPbW5uMEZEV2hCaWFCMDhpdjNHdlp3NFZ2dktGaEVXZ2V0SzJh?=
 =?utf-8?B?V05icXU4VWwvb0VuUUgvbUhoVnB0SitzR0NqZXRPMjYvZFRFeXJBcnYvQTl4?=
 =?utf-8?B?ZUJuTGlaR0Y5a0o1eWd6dU1MZG80VjNpd2FIRUtRTmlKVGpLV0ZxVzdQUXlJ?=
 =?utf-8?B?b0F6NG1LandMaXpEdEpBL28yL21WS3JEU1NjUmVRSXhrOHl3U0FKTEJNeXVR?=
 =?utf-8?B?VU95MnlhRWh4bS9DbG1GQndaNFVzQzJMeml4bkJaUXRvaEhqbzRkL3Vwcis5?=
 =?utf-8?B?cTdIRVNwOEVFbUtocTdsdWZlak0wck9wdi9jemtIV0hvTzZnSnhjYTFXNXBE?=
 =?utf-8?B?K2ViSEVMTzRyS29XQ2ZWdndNYnYybkxXV0psUW5KZEJweVhCVXhtUSt6clZs?=
 =?utf-8?B?RExLQ0F3MzJLQW1xd1JoaWVlNEdUZHZQL3dWS01tVGZEYlJHdlhiNHhtUlRs?=
 =?utf-8?B?bDVGZUs5TkdFU0tNR3dMZHBmZFNHNkJoWW5tOU9wSzBSUFJ6UHZYd3laWExZ?=
 =?utf-8?B?QWZoNnhiZHY2d3pRWThxLzZPcjV3RVRjK2lGZWJBL25HNVA1amE1a2h2elZ0?=
 =?utf-8?B?dUttNVVZM0s2M2YrRkZzSHZTeThSYzl1WGp5bXhGeTNMSXYxcE9ZUkl5ckVa?=
 =?utf-8?B?ZFN0MXRIWGV3c1lYMGtqeHFIcWN3Y3NxNG9UdkFNM1RWNnIvN3BZRFN2QkhV?=
 =?utf-8?B?bEdRalRtZTRNb0NBVzUrazVDamJmUitTMGtHMGlZYVRSdWthRkNTdytXNXJm?=
 =?utf-8?B?d01pL1l4ektLRVhSeEtLWG9JclhTTHNIMTg2WFU2QVdDcWJUVDZNeGVZTlBE?=
 =?utf-8?B?T2Nma2thMCtpaGxOTFBRTFZJRUo4cnREeVluVHdnWmxoWnVrb2hSMXdEUFZz?=
 =?utf-8?B?VGI0ZkNZcWtRbDJONnFwWFIzeGV3TW5ZY3V4c1orWE8rRUt3R2ZFMVhRZi9r?=
 =?utf-8?B?NFFqdUFYRlhwMjNmazRaYWNMaVR6S2dUQjJ1R1hCV0Zkam0xVlVnSlplQXZu?=
 =?utf-8?B?OFpKT1N6VU16MFMwVWRwclhIM0NsZkZiQzZVRTNsOHpOUDIzSmt6RUZ2Y3JT?=
 =?utf-8?B?NlhwcXVzdG9RMmlsU055dDlIaVROMWV5Tm9DUE1EdFBaNWQ2K3hvZjJGSk85?=
 =?utf-8?B?bWdYMVFrWEtMMURhbm82THFIOGR6NGJ6MlB6a3lwVlBBQ2lhRENyaUNxbzFL?=
 =?utf-8?B?blNvdUNUU3I1b2dpRDhQSU9DNVBUKy9EclhGNEduNTRVcXY0d3ZIS1o5N2Ry?=
 =?utf-8?B?MFg3NTRjdVN1MHlqK1N6ZW5kcWxoQ281eER5dDVtTGpUZmV2dlUrN1FzaHNl?=
 =?utf-8?B?QUo3ZXFoMEdzWEhMU09oK2xaWHFqR0JsVUtQRWY4dkdrUjFnNk9jRHQ2OGxJ?=
 =?utf-8?B?MGZiNlhBR3pEa2x5ZXUvUTFaTEF6VmVzOU10Z0NDSlV2OTY5dnJuWnEza0d5?=
 =?utf-8?B?STBMMjZqOWpseHk1UnRURlc4aTFpSkY1aEtLR2x6NTRFYnp6Vmc3c1IvdDEy?=
 =?utf-8?B?WVhYZk04aTE4RUlEcDUyaDZrN3RoaDl5ZDRzL05mVXUwdTJvM3h5S3ZGd0cw?=
 =?utf-8?B?YmJEV2t5VzF5VUUrYjZ5dVlHb0pyUGJjVmJ6L3hwVkU4WEcvemo4SmxBdWJS?=
 =?utf-8?B?RFRXMzBFdWMzZXlpTGphTnBvNHU0R0ZVK1orZi9tZnJ0QmppZUh3UlRrS2xj?=
 =?utf-8?B?S2J0OGFKSTJrOTFSbitPQXh4OVExb3pMRXVoaW5QQ2FTQW8zVitOQU9aQWlU?=
 =?utf-8?B?TjJaWjQ2UDdRMGxLMDFZbVJMSzZpS3BvckQxTnFGUnphRGYwaTdRcTNYOWdm?=
 =?utf-8?B?dEYvd0dPQTduelBpT1dJZElDbnRkbnNaaXQzTVF0TFJDeTFBQ3pab1lHTzVW?=
 =?utf-8?B?cW1RR1h5eDcxUjZaZW5iU09CdGlOKzVGcGZUbnNlTmZHVGxnRkI0QXF0amNl?=
 =?utf-8?B?ZlNIQ2JTRnV0Q1VwYnZJbFgrRDJvbjZIWnNnN0xkR0ZZOUNYRnZzQT09?=
X-Exchange-RoutingPolicyChecked: I3Spq00GhTWVkNqNf5+DwhIWKMSYeKhDcdJDV4cHoTOJgtOy+uch4obozrfDsjB4drZJQaG7j4mQTiZpUEyz+g7D8dd+zYG6jy/0UiCQIFp+IokNjo8w0YUcLwpsRJirJHapWvvfZCdeZ17Ar/vqFKbi3/T89jBOzsoHeuwpmhTCKn70SdofqJDkcorW81vxF7AmuN8KmC1lw4wFl4OuXFDz+C/QdgVC8XRkS+iDrOvRavtxzS2cGTYVF0fqzsfVWIu7pF1AcBLZnJwN0EeKM0QIo17pjK3VPqvreX01c9Sv5MMbwlepGWhgr2uMQePgfkfH1ldA9WvzgVwSJice4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: de0265a5-be03-4d39-2f57-08de8a591e51
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:27:30.2418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUHjgbWTn8XLjMZjbAhPIFK5fDERvPt/PzLjdPk0qUlLCkBSoE4CXYi1nZusIygyt07oJ6tXSNr2MF2AYxpKzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8436
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

--------------xQHXOiE27qOAD7X0n1Xo64kX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/25/2026 11:33 AM, Sobin Thomas wrote:
> Introduce a new failable variant that returns error codes instead of
> asserting, allowing callers to handle errors explicitly.
>
> Signed-off-by: Sobin Thomas<sobin.thomas@intel.com>
> ---
>   lib/xe/xe_ioctl.c | 36 ++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_ioctl.h |  2 ++
>   2 files changed, 38 insertions(+)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 16aae05c9..30c8a15f6 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -795,6 +795,42 @@ void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>   	free((void *)sync_addr);
>   }
>   
> +int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo, uint64_t offset,
> +			   uint64_t addr, uint64_t size, uint32_t flags)
> +{
> +	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
What's the use of volatile here? Memory pointed by sync_addr is updated 
by driver via fence, user code access it directly
> +	struct drm_xe_sync sync = {0};
> +	int ret = 0;
> +	int64_t timeout = NSEC_PER_SEC * 10;
> +
> +	if (!sync_addr)
> +		return -ENOMEM;
> +
> +	*sync_addr = 0;
> +
> +	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
> +	sync.addr = to_user_pointer((uint64_t *)sync_addr);
typecasting is redundant, directly use sync.addr = 
to_user_pointer(sync_addr);
> +	sync.timeline_value = BIND_SYNC_VAL;
> +
> +	ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, size, DRM_XE_VM_BIND_OP_MAP, flags,
> +			   &sync, 1, 0,  DEFAULT_PAT_INDEX, 0);
> +
> +	if (ret)
> +		goto out;
> +
> +	if (*sync_addr != BIND_SYNC_VAL) {
> +		ret = __xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL,
> +				       0, &timeout);
> +	if (ret)
> +		goto out;
> +	}
> +
> +out:
> +	free((void *)sync_addr);
Same as above, typecasting redundant
> +	return ret;
> +}
> +
>   void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
>   			  uint64_t addr, uint64_t size)
>   {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 3ea651063..eba10bd34 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -116,6 +116,8 @@ struct drm_xe_mem_range_attr
>   void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
>   			uint64_t offset, uint64_t addr,
>   			uint64_t size, uint32_t flags);
> +int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo, uint64_t offset,
> +			   uint64_t addr, uint64_t size, uint32_t flags);
>   void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
>   			  uint64_t addr, uint64_t size);
>   #endif /* XE_IOCTL_H */
--------------xQHXOiE27qOAD7X0n1Xo64kX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/25/2026 11:33 AM, Sobin Thomas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260325060339.2499618-3-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce a new failable variant that returns error codes instead of
asserting, allowing callers to handle errors explicitly.

Signed-off-by: Sobin Thomas <a class="moz-txt-link-rfc2396E" href="mailto:sobin.thomas@intel.com">&lt;sobin.thomas@intel.com&gt;</a>
---
 lib/xe/xe_ioctl.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 16aae05c9..30c8a15f6 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -795,6 +795,42 @@ void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 	free((void *)sync_addr);
 }
 
+int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo, uint64_t offset,
+			   uint64_t addr, uint64_t size, uint32_t flags)
+{
+	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));</pre>
    </blockquote>
    What's the use of volatile here? Memory pointed by sync_addr is
    updated by driver via fence, user code access it directly
    <blockquote type="cite" cite="mid:20260325060339.2499618-3-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	struct drm_xe_sync sync = {0};
+	int ret = 0;
+	int64_t timeout = NSEC_PER_SEC * 10;
+
+	if (!sync_addr)
+		return -ENOMEM;
+
+	*sync_addr = 0;
+
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);</pre>
    </blockquote>
    typecasting is redundant, directly use&nbsp;<span style="white-space: pre-wrap">sync.addr = to_user_pointer(sync_addr);</span>
    <blockquote type="cite" cite="mid:20260325060339.2499618-3-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	sync.timeline_value = BIND_SYNC_VAL;
+
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, size, DRM_XE_VM_BIND_OP_MAP, flags,
+			   &amp;sync, 1, 0,  DEFAULT_PAT_INDEX, 0);
+
+	if (ret)
+		goto out;
+
+	if (*sync_addr != BIND_SYNC_VAL) {
+		ret = __xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL,
+				       0, &amp;timeout);
+	if (ret)
+		goto out;
+	}
+
+out:
+	free((void *)sync_addr);</pre>
    </blockquote>
    Same as above, typecasting redundant
    <blockquote type="cite" cite="mid:20260325060339.2499618-3-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	return ret;
+}
+
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size)
 {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 3ea651063..eba10bd34 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -116,6 +116,8 @@ struct drm_xe_mem_range_attr
 void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
 			uint64_t offset, uint64_t addr,
 			uint64_t size, uint32_t flags);
+int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo, uint64_t offset,
+			   uint64_t addr, uint64_t size, uint32_t flags);
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size);
 #endif /* XE_IOCTL_H */
</pre>
    </blockquote>
  </body>
</html>

--------------xQHXOiE27qOAD7X0n1Xo64kX--
