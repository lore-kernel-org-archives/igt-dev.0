Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70439D3942D
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 14:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2121C10F2AC;
	Thu,  2 Apr 2026 14:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdZsvjFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F42810F2AC
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 14:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775138657; x=1806674657;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EOD2qiMj79PHHDbn7/eS5FXzXEPI/ojb/T8cYzMnUAw=;
 b=KdZsvjFAKa/Guz8m6FicJDdE/5Q/xHhDBnaQFzg4dg23iO1aUZLXGbgb
 mioTtKo9yC/0kiyIuqKu3UG2LeKOPgy3Fn0ZZcEE9d3DSsovMMy0ZImVM
 r+5MqhtXuetEek1ELqSypIO8oVjBRE2q5mKPja7N06mQkADy/pejOxa/0
 kGJMbLAftdlrZvt9DonBM8sKQuWIJ7R/CDdlEnfh3YT30Ds6OgLHmCob0
 kWpuwZQuotGY/q+pLFZR6z6huSiic6E9CclfiMt0Zub0Nt4BQA2US66Dm
 pID8Wdo7fEtqW1Rf32bqABWz1JueszUt3AK/2bpT8JtYNI153ukSdJswY Q==;
X-CSE-ConnectionGUID: X71olj9nQ+Gh+Ag0HHtpUA==
X-CSE-MsgGUID: waMf7JVbTlOtZi72bOVm+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86898957"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="86898957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 07:04:16 -0700
X-CSE-ConnectionGUID: wbUOynBFSk2412rTyoLIWA==
X-CSE-MsgGUID: +3ly+LfUSdycdkuc1NdbaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226153121"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 07:04:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 07:04:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 07:04:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 07:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qid3WmCUqTbsP9gO6cu390sAPzHImQoIt/qvGTGbP4ZKulZ0dvEO51agtybiwIwPsMUns14Fj1bQQsVtUP7CDPerLM08QHozyAVwkPmEdSM06zp5zSTJpm8zhVASdAkVgUMOnfFyxdMx86Mo//ZEewK5TOzL+SqehSjAx0bWYPZ91AprC57dfL5sAvpGUrsue0qnMHklgGeort1lQxOhHmnxiv/cOSkE1Y4/hEdKFQX26NPbasEDFXRFfBtde41tJIsTPMKwitlUmzXlRdvQsBVk82KEguavNakUKKKRNfHLCyGbSJZa+EgiZhL54q0bckzyGWHoYD5jNE2OSwmE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQa26qi6WgTYHpJlG54Rh2tFYvShtF9uytJbwZVvHxk=;
 b=mur/mClafILNkRlsBVNkqxQ3369JB3nVWzVXtdJZs4qRHzgdA6ClYi3GRTKlf6Nf+sKqCg2wq5snV5Yj+Xi1ZPZa9eSWP+uoascz5EnCKgKg5SJ8yO5U9Nox5tZ/sf1Z6DM6rnVomdjFL2sDdtVJsiNHr29O+44zbbYFGatbYKf8yI7Jsivac4PV8WV/wRZ/aCHD9LLDlVGc3qpaVFgBTOdTiuDV1H/Z8KjXDBD7d/GJj16Pzigsgak+lE7oF0SNZXaaXfQCB/WDMUdF326g/Gr+nmJoQQcNsekkzhRfLthLmRwg57bhfC6b4iwGU0wSQ8vzkn8otTHVRMuUn7tMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by SA3PR11MB9486.namprd11.prod.outlook.com
 (2603:10b6:806:47f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 14:04:14 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7915:c7db:9bfa:c41f]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7915:c7db:9bfa:c41f%3]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 14:04:13 +0000
Message-ID: <a25ed362-ffd3-4004-8b34-7f436a641ea2@intel.com>
Date: Thu, 2 Apr 2026 16:04:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] drm-uapi-experimental/xe_drm_eudebug: Adjust
 definition in xe_drm_eudebug.h
To: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <piotr.rudnicki@intel.com>
References: <20260402132004.1712065-1-maciej.patelczyk@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260402132004.1712065-1-maciej.patelczyk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::29) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|SA3PR11MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: e404e038-e690-4793-3830-08de90c0b88b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: vMoWKsc6ObkDu8j7UgIk+AKyIVGsI3/E/7Atn5u4yCOkFXYJ/Cmqb1J/UK8tx5KPz3ISZNRQ3td8YWjWawLAcJ00/1Us8ypZJUsszbw9i+Qe+pRvXOPNkfmqn2MAFUGaIuyIuacU7QvdElwhaFBwyeQ3nMTzt5uw7LecPCL8DBYJtUWy7kTJxSCZ32dXsKgBHLamtFEn+REbXHBlQfdLNAqBEDSP04vew9wtu4MWl8JX4YfFiCJHD4t5pRVwWch3Cn6WvHJKKqV6SxdN4z3xtmIl49UdvFDZ4Ptz6dUkkMuWNg6pmwL530v1CI2xUuFhXlMQPTh+tQS90L9KCJ04cKvfJ1Mn12+F+c/IUbOUiAQud9ixs0/49oN9Di7mMj+TK8lMkvWexTN+wFZ+YTURWv+WQsraVeHG9ukx4PnRYbHPkvP9nA6GgvV8DbdIE38W5pb3PVGBCas0P1vlo0b0LrrBMdY1+tMHAqnCEfG5iKLrK8mYLb0i4Cc1LB+ETHA+5/3UWGzZN37U9YS+HQJnKxyTGK94W7frJhRQgWpRUq/ZoCbDbAOh3u8+qb+s7T13LbURcMG98tT+mPSUP/4jg1E0gY5RcGmaXOEKbxlvdRlSbmWN1wTSx9Vgj1WkRPsDEMNbIseBNbHozQ9KFhulSM4JOA++Bem+db3G3NaHeJNRtcrQL4BZXz7/X2dnZO0556OqXkjdBbj/AXDaOeUl8OzBmonusAZ0QJK/X5GkdJE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vzl0Q25UemtHZ1A0UXJPYStsNDlWMXo2Q2tya2FIUm93ak9XbUtqUVZSWk0z?=
 =?utf-8?B?eXBhMHRlZjA5ZTFDMlJhYkVGUDROUXpzOVdBR1Fna28yWFBNblNxS0wwaXJD?=
 =?utf-8?B?M2tkWHV3R1Y4N3lwUVpEeS9Bb1dhRklLYUgyQlJZRmU1NnJyam9qcWZ5all1?=
 =?utf-8?B?SUdNdlE5M21WWnJXYUxUQzZTSGlOblEvYmplZ0tuV1BRejJSZTdYNGd4SG9N?=
 =?utf-8?B?a2VWVGRUcWRhL2sxbXVWOU1uZGg2V09IMWNjV1l4Z0pYZVZYMkJuS0ZxMnhN?=
 =?utf-8?B?UVZQZnM2OEJEYlpjS1RocE92MHdLTFFqaTYvbmIvSFpYblpoNGx2TjJGd0pt?=
 =?utf-8?B?a1J0WHdrVDd6Ukl2QWw3YlZZN2RFRE14cTlRQmRJV2FSOTlhbzdjMm5kNVpZ?=
 =?utf-8?B?ZDNpaFBsc1pyVzNwdjBOT1g2aUZ4Q01nTndyODNjeUpDTUNFc0Fhb1c5WWly?=
 =?utf-8?B?aElTWHRDWm83UFlWYVNMYlYrTFNmbHFMbmJZMXQrMmt4c3llTmFkVUZXVDhq?=
 =?utf-8?B?WFFJcGVHendZWEwvSER3UUxZdnJkbEpDL3FHNTVBdEJXQkMxWUx0WC9kOGJS?=
 =?utf-8?B?T3pNZXBMR3M3Umh3VTgxZDFFOXFPMEsrZ1cxY1A1eDc1MUE0clA2OEtDMEYz?=
 =?utf-8?B?QUgwZjN2OWg3dVFSQXJCaEtyaFNsM3UvbDhKdWZ1MENVN1RrSTBLZytMWjBT?=
 =?utf-8?B?MUo1SGNZeEttcVdmbDJNem5Od2x2K1VkMUc5Q3BKU1p2U3JuaHdRRExPeWtM?=
 =?utf-8?B?UHA0OHZWT1JsWkJEY1BVZWRIU0FBaVBtdGowbnlBejJSaGNvNXNNZEMzc0Y1?=
 =?utf-8?B?T0doVG1qejJqSVRnUDBnbGdCaStXZFF5V0VlelhVZ0RzT3ExVFl1RGNCd3ds?=
 =?utf-8?B?N3RMMnZaUE5FREV1elY2Q0FISk9XY2RDVTJXMzJnaERhS3hTYlVUWXlRbWhZ?=
 =?utf-8?B?Mzd0V1BlZzBpdVZLTmNyVHBITldncmhVNk1NamtPWlJMTldHVXFZNTFLWkVs?=
 =?utf-8?B?VElvK0diRjZJcHErMi9KRW1OS1pkMzl5bzlpSERzUkRVSWQrS2tlNE5MUWZ2?=
 =?utf-8?B?aGQvbktXRnh5bUR6OWJIcFh1Q3picUduK015b29CUlBPTXNxK0xrU3dEVEhl?=
 =?utf-8?B?UTJWR1EwcHo3a2JxakxtdlZwd0labk0zblA0VEdZZUd1TC9UMHg0VnN3d1FR?=
 =?utf-8?B?eG43MDJHT0FjVU1BTHdFNmZtNFliSkswTHhNOVR5UEpFd3NZdmxQZW03NG9z?=
 =?utf-8?B?YkZ4cVE3WEdFWEFXWE03d2FmM0FBTnluaFcvN2tpWWo0Smo3TEVUYTNOME44?=
 =?utf-8?B?L25rMGxIMnZ3U0k3UTE4Y0FJMUVWdzJkSGZYOCtJcEhOT0ZXVHZub1Njd01z?=
 =?utf-8?B?aERyQkZpY1JFbFoyNmRJclF5b2pLVnJ3Z21ycUNtbFlGY1EwckNFQUlnd1FN?=
 =?utf-8?B?b0hYaGtIU3cvT1hXeTVOMmpVczNDT2xKdnY5NXRiY0FhcmRGaGtnb09MdCs2?=
 =?utf-8?B?MXAvMDdzQ0IrTi9IQkdkWFFpS0NyV011Nkl2Mmw2a0hDc25ISzZrWHRhRnh6?=
 =?utf-8?B?RWFMU2lVOHlTcXd2UE1BQ1VUeXNnSTVqSkJVR25CU3lnQytLTWlPWWF6WDdM?=
 =?utf-8?B?VVp6b05QY2tkNUVGbm4rL29rYnpKaDlTb2FXUGdOcWc0SUhKWTAwUVhEZUgy?=
 =?utf-8?B?eGFqTjFYc2lncnRlSzBhQkpKVVRoSTdzQTBFd0VJSFFnNllJSmJTZFhOWTNE?=
 =?utf-8?B?NmdVbndHUWRpWXh6OWxRQWJ4WUZhSUNiSjhtM05BMzF5K1BrSnl6Y2srdHB0?=
 =?utf-8?B?a0w1WUtHVjdYcVZacW5FNkRDcy9lWCszcjY5UUpsaStWZFJiYmJGaVh0N2tk?=
 =?utf-8?B?MlJWUy9ORE1iY2JBTC9EOUZRRWZ1VlhvSVBKVEJLMHpkTk8vSkY5T0R4bFlr?=
 =?utf-8?B?b3UrbUZhMml4Z0FLMUtGS1o3RGtVQVI4ZUw3UDIxaHB3WThrbXZpdktsQUMr?=
 =?utf-8?B?RkdZaFRPMVFEODNyOUUwZG1tbkVXbm9JSGpIVmFEejRscDNkWm9qdFVyclhm?=
 =?utf-8?B?K0Zwb0hqM2IwUDU1eHYwQm02R213Ry9LblJuUm5iNU03di9zWDNwZ0diM0lS?=
 =?utf-8?B?dGVaaGJXQy9ScnBNTWRXbmlGNjMvZ1VBZ0FCNzJtRjdrUXg5TW9WdnNJckl6?=
 =?utf-8?B?TFNrV1RPV0RyelJadFhOeUE4Mmx5cUE5dEhFZVJsWmp1Zmt4TUl5ZFRrck5n?=
 =?utf-8?B?czJNc1h3T0xhZGFKL2pTSW5uM3gvc1JqbHZGdXNxMUF2NUhZeTNVUGNrc2po?=
 =?utf-8?B?SHc3UG84L3ZBd3doS3dRdXJXZG9uMkJ6bXpVbGFmK2w0ZXFuYUhlQT09?=
X-Exchange-RoutingPolicyChecked: h3Pti7lcbIiK9jbIg2EBpAvFE83t9Ab/v4t6njqSHiAXE6ZQVA3qn54xLpOvBtYsglrqO+3xUxZayxMUvvoaLBxTB1xSyr6SCE1X3+B2//EuzyUbxcY0A3rHSP6Vhs7qenjft7cTDxZJOsByA9i2YyiNt9hZWwLTbT2sELkrnBc+WqC5VmvRSAPPqGFE8F4kiVoFU4BAZX39onsZsGkZC1ms1AwppkG7yvY739wG7oBR3WsGUQ7FSeftJi4xvOuSdwWn1gpxjHs/KaEzSr1MHPdzkuwwKwS6mvnf5IjkY+QAGsfdi61jiJAAHbekZDYqKTGLD6cKLuIU8YZjFpXL1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e404e038-e690-4793-3830-08de90c0b88b
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:04:13.8744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySZp7TFXCjdxH1qJT21aL1TQNG2ClYVYvKdUycM0KaeQZkIKa3COmyirKsw1p3YnktLEDDPhRYbRUtL9UNIglQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9486
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

W dniu 2.04.2026 o 15:20, Maciej Patelczyk pisze:
> Adjust the IOCTL numbers an exec_queue eudebug extension number to
> match drm-tip.
> 
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   include/drm-uapi-experimental/xe_drm_eudebug.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
> index 8e74ced2f..a1733f543 100644
> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> @@ -19,9 +19,9 @@ extern "C" {
>    */
>   
>   /* XXX: BEGIN section moved from xe_drm.h as temporary solution */
> -#define DRM_XE_EUDEBUG_CONNECT		0x0f
> -#define DRM_XE_DEBUG_METADATA_CREATE	0x10
> -#define DRM_XE_DEBUG_METADATA_DESTROY	0x11
> +#define DRM_XE_EUDEBUG_CONNECT		0x10
> +#define DRM_XE_DEBUG_METADATA_CREATE	0x11
> +#define DRM_XE_DEBUG_METADATA_DESTROY	0x12
>   
>   /* ... */
>   
> @@ -54,7 +54,7 @@ struct drm_xe_vm_bind_op_ext_attach_debug {
>   
>   /* ... */
>   
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		6
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		7
>   #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
>   
>   /* ... */

