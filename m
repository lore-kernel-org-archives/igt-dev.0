Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB4CC531FC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 23:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EFA10E552;
	Thu, 23 Jul 2026 23:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cukoEzy4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D53510E552
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 23:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784849307; x=1816385307;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pc8g7Gc2pse8UbP0BR3hWm8hJVTJ+M2ABD/2Yt7Fwn8=;
 b=cukoEzy49fgNOANSDI1lj5yCJKz/zkJBLGDg560dqwrkpKsvz+pSrNst
 XEN/cPgoaJuLbmkv5Qd8nT2xesnJ8F29iLuo44Mb7AUgNk0N/+ZnaaOjs
 6wjCox1G/LU4zRUHNWr3m4I5YG+VJkN9uAFgpOsaUUR6GetnL6adKbqh2
 d06KgXZYbYh5/bcsdbISCF1bGm1le24rJFxWvmOw66hRPIfzdJ4TQUD91
 zIXLtYENQoN50YlLUV5qCKgA7aPvVnRTw6gRgXSt8/DT973sQwG4Am3qg
 3wLUixP1A0kK1DfbIdZ5RNPX3uthd0Sm/b+UJI6kpxqOpjEVX2uoUBlGU Q==;
X-CSE-ConnectionGUID: H6v0vWlJTeiud7WEeo98sA==
X-CSE-MsgGUID: wWDilkAwRxetlBwhTe5t+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88056000"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="88056000"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 16:28:27 -0700
X-CSE-ConnectionGUID: FKxWLCyqQ7eo4OCY6e9l7g==
X-CSE-MsgGUID: t3Ls+BKXT+i3MJNMfT/IVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="252240507"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 16:28:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 16:28:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 16:28:26 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 16:28:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqUY99/5wJEz4Dkabfqbsg2MEn9davgdV+L9D9u0jBbwroam20i2R1YbxIigW6nsRUVlncbSS29INvB1wTJNQy4l8IKqyIM+9iwzqSetJT3HDOLAG5s8t5bAoa/r4/LOwDc0N1OHy1wuEOeJ0Xu7iZqWvNE8tdvJHkdwiPxmw3pJ5+Gx3/Bk8zLPpo1l+/m91YDhymqtM2FbnrVMkJ/YohDudZh5+CCN6W0KmZ7NPxfo+ri2N3NQWmNhkd9MbMisBfkiuKTniFqnKgb8yW/NgGI0STED/2VdMd1MICRbGrrYtbAqMz5pRAv2e+RFFzqZ1aLmO1s4736dhVqG49PIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WonsUZfeZ2dY7fe4IIRaUU1sHPBju/DJGol0Vag/yJs=;
 b=LD6qBmAkFJ+gu6zxirxrdXYHw9qPR2FagzwaCNDMqLRFQ5F5zzCB6oKsZXYkbmLf4hlwNb/Pwb6QT/7K8gxXNq6LbyrdQS2rYtm5JoxNLmwgpT8v3xusXTqmDkCMipVqScFB1K5oz5iW7iYQhEY7X/I3FF1pB7k40Blug5dLFPV83Dow8TwSExOXPRW2/MNK7I+KAcbk6VnPx0QdeNrvd0cVry4H3v7itS5GnRpqmbUWESGzs3DTnLq0Sm75CAQPd9QvIpRzgju+mzaMuxYfRqx6KGRqNxivsYDALMqmlR7cHTW3MoCNBX2NMhhrtVX7j6AimIYqPpxaCnU8jRk9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 23:28:23 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 23:28:23 +0000
Message-ID: <c9af2e59-2565-4f30-a927-dfc4b2b357fe@intel.com>
Date: Thu, 23 Jul 2026 16:28:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/xe_debugfs: add uc debugfs validation and
 read tests
To: root <root@DUT6245DG2FRD.fm.intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>, Sobin Thomas <sobin.thomas@intel.com>
References: <20260722160250.2134179-1-root@DUT6245DG2FRD.fm.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260722160250.2134179-1-root@DUT6245DG2FRD.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|PH7PR11MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 73cadce5-7cd8-4e6c-0326-08dee9121666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: xxAurAko3d7tJDKz3IRxSp7AcyhlF8xeL4yLDBLUUdof6kkEgZTbjTAux7OSTIyvIucRJvVexlhUCYsGVqr9sAcm8eIYw6mEhF4d9apA6pv+NDq0ubGxubDtgrDUwPCbBVqMJ1rAR4q755ldz38XJunWxUgZ362/FNm6YZgMwnJCkmpryh/W+d0jFrcrqt2Sr16lOVta1kOLfw4OJYkOXy62x6hc298tZevMX10EtxWbMfxg4h4sj5uPwbJd1k53LkryPFd2CEg7DOikOlOfeUz8x3OLhHm/GZZtXUIX1XlBrKaqcATeqYktw3iVDzhtBzbU5sYRMQKtz/s0T+/IqGEfTT2+29xIysdnB3i/Vx7KDTHSrh6Rhc1RZW2AI9b8CbsZvlw5Et6+D5QA8oAtpH5EsaDk7pXsvId2xuvZcpnCqxRKBh1kceCFRKE/X47y7waHcZ52VvIyKDmW2jPEG1l1N6StlKTUo7vF8u+DsF6LR1z3zhiSlOKt1jZhG6xpcpPQEfmu+azNllgf51Ciw6Li2o8xWq1ZRtsfobnLvu7MmDQtmWwoduol5bdQXa4x8yN9aeHltQuki6RD3NqtaXNDt27DOrod7XtuyfZxa262Yg0yODD0bicxKIAgTpunc/fi7iMaoiX5R8oAI//T/ogf3zaihf9VmWwPvs1Idpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHQ0WjYweHNLTHpNODJWWDdtYVFndmE3U3FSOFVSSWtuVUh6SFUxVU1kdVZ3?=
 =?utf-8?B?cmQxRDhPZ0EyVjYxaUtWTlovQ0VQRnQyZzBnRk9jZTJVRVdzVkJxSW1SZ2Jo?=
 =?utf-8?B?c0t5WkM5WnJXSlNlU01MTFVqVnNTUGV3ZTJtbUtCMENUQzBXS0pwRm1QTVBB?=
 =?utf-8?B?eUNSYTZMcW56SHlndzlCekYzUW9RblBxeTNzYm02aUgwQ2VNYllyWURkWDhJ?=
 =?utf-8?B?SEJHd0NuYWpNQTFqRXhtelJHR0g0NXh0MWxaaTJaSVNOSmlKaktaTnJuM1NW?=
 =?utf-8?B?Z0ZweUVBTG1sUzJXMjVBT1p4ZXd5akcyT3I4WjdvTjlpa2V1dTVOL01TMnZ5?=
 =?utf-8?B?L2tXa0xrTUxMcXFyU2UxbzM1aDAwZzRYUzlNMnp6R25jV242aDlrTUtuN083?=
 =?utf-8?B?WkdOWjhFUXN1QW02NzMyY2dJOWFKZEhQTVhqazh1S2dtdU5UZG9yREtNY0lW?=
 =?utf-8?B?NHR0UnFPTnRYckJsWDN6eWpUYzFmaFRlT2RKWWM1Qzdsa2lTTlR1d0N3V1Vs?=
 =?utf-8?B?WFlSTW5ibnlLa3RKWVFPcW56dlF3WWxrM0VVNTF2RVBDclJZT2wyN1g5dlVH?=
 =?utf-8?B?VWhNQnM5WmRDVS9wSkZVeStUYU1veGF6TFk4RnpacFRTVDBNRWdON09hUHYx?=
 =?utf-8?B?UWp4ZDdhVFFYOWVySTlxS3ViQTBFejlpVktoZjdFRW44cEZTMjRpUTNJNHdw?=
 =?utf-8?B?QnA1NFg1L2tJYk85RzlnNjV2WEYrNEQ3emk4RmY0amxoMXlGbHlvMTJxQ3dU?=
 =?utf-8?B?MHdjZFA4Q1U3aGdnaVZYTVZqNk5HbnMrRHVuMFBGV05KWlQ5RjF3ei9wM1lQ?=
 =?utf-8?B?Rnc4ZEtVSGlMVTQveXBVMjVpdUEwNDU3TjRGWFR5R3RRTytyYWZZYVNVOEJj?=
 =?utf-8?B?NTFIYUVxNzVjbE1HOUE5QjNnU1NPMGpCVTAyMUV3TmVxRm0yR3lXOUFnR2x4?=
 =?utf-8?B?ZlBZclFiZTYyK2hINm9YYW1sbFJVcnBkeG5yYWt1ck9SQllNdzZtRENaY2ZV?=
 =?utf-8?B?M3AwSkRjNDlzWTNOcTh2aWpLUmZxRUc3M0d2TEkycHJSLzFEUjNHZzhqZ0dE?=
 =?utf-8?B?SmVtOHkxdjRlY0V3Qlc4TU5jLzRqcHRmRmlzV2hSaU5QZGo3YkdYblZza0l5?=
 =?utf-8?B?TjZoS2RVcU4wSWJCWDBNekZnUVRXdFYzcWFabEoyK2VsYVFUQVBqaUdaZjZt?=
 =?utf-8?B?OGRaNUJmUndkYVpoaE1qc1dwN041K0l5RHFZanFKVnMzV3hXenBhS3ZhUkl0?=
 =?utf-8?B?cVp5YjZlSmVsZURDc2xWbEl1ajJGVkFQWVZZYjQ3bXliMjVETCtoREd0aFgw?=
 =?utf-8?B?a3lHU0UwbUc5NUczVFZhYjdyYm4wUHMzaE5rZ3lKeS81RS9MK3c4TVlsM3BE?=
 =?utf-8?B?R3JrOWgwYVQrdUF4bTIzcjB3T01lck5NV0N2bjNaZW9LZ0VRVnpBUkdDOFJE?=
 =?utf-8?B?QUY4eGhBZ0NwS1BLcWN6dnRZbnBoWmdZa2tuVVYydWQ2YngrKys3bkFiS3hT?=
 =?utf-8?B?NmxMdUQrRGI1SSs4Y2lKWURkVXdaNzBqaU0rMTMzbisxSVN0Vkd2REhkVDU0?=
 =?utf-8?B?dkJwMFFKWGNyMmhYMW1QQ3gzeExoMFIzTzRqMW1tS3VrZzE5VlNxdm1LaW9U?=
 =?utf-8?B?eVdwckF5RWJHVXlYL0dVdFE0UnRrbURKMGFUMjRwc0xaMi9LeG9DcnQ1ZnNZ?=
 =?utf-8?B?MGk5NVUxSWczZ1JBUG9LaGluWXNJbUpYZmtscEFtWmh3TFU1V2daY3A2ZFlh?=
 =?utf-8?B?SlNJSTVISUVJRG1aQWRaRmxWME8wVEFMZjlVa08yTzd4bFE2TTAvalFKVXBZ?=
 =?utf-8?B?dDgxeVdHN2NLMmpQVk9PYXQ4QWE1WDY1QjkxU2NYZytINzROeUlXMXNIYUdn?=
 =?utf-8?B?M0V0RzcrZjdwdVNjaEN5MkdQQ0RUOXJFcXNjeTBMakQ5THMvUUlNcmh3bnZW?=
 =?utf-8?B?VEl0TVFXR1I2cThlL0l3MDg5Mno5OE1yMlREVDN6end3RStxRzBSQnoyaG9K?=
 =?utf-8?B?d3RQd0w5MitlTVF2WEVTSG9tTE43VzlibjJjeDN4UnJ0UC9OTmJHdmJqeGhz?=
 =?utf-8?B?Y0ZHNTlGbU1BZXc0bFJ0cjRpRzZSUXpOL0RzQVlHSkt1bXNUdmlFVXhFR0Q1?=
 =?utf-8?B?MU1CeHVuRUdwb0VkVGt6d2tXdzZGb2xWTGpvSmVUK01aMlVqbENSZGZMUU9B?=
 =?utf-8?B?dzE5Vkk0WENLRGtlWTBQRnV1VUVJSTFEbkNoSTRjU1k1M3FHTVRZVXpTVUR1?=
 =?utf-8?B?WkhIVFRzTUVZalFteE5xOUtnc1o1dEUwNVFpSnVpMVBMcDd2Slh1cExVN29l?=
 =?utf-8?B?WFJ1MWlFVHZVaDZuL1VxV2pGQmNlUGUxQXNUdUl5Q3B1WUxBN1BLc0dLWjhN?=
 =?utf-8?Q?0NdTu8MBIeaDtnEA=3D?=
X-Exchange-RoutingPolicyChecked: avY8o7i+uVHWi3+fOjou3BcnP3JfmtBX1ds1oSBkp+yQogNBdTolfhcMJZ/Mpb+etj/U2nHfBZSae+88BOQ9crQ0tG6w+PfACmwE30RiTQ2n1/lU5cOCWh05shiypJYYAzFX+RECqB/AurLw99OJySlA4uLy0Mu/qMBT2YJWMMF4SPkhqWEu2BM1VNm4Pkde1DdaNqKvs/c2HR+c53rYzDcIZ2QA8UkGrQvRPkTCq/CuzTy7+P7QWR1G/49q6nyBxto/TGIqdEi8QPlPM3egIwZjWnfLo9+tsgO6yV1R3c37Bp6CHyZNFJFyK/KE6+QviluHkctnpYsTtRP85ygUnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cadce5-7cd8-4e6c-0326-08dee9121666
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 23:28:23.5962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOldto9trgs5c6n3Pw0D+3am1eIUq59IpJQSbqYINFGN6Ibvtk31jDBOn9NW1CK+pjlsQjyHfAvbNrXz9H2O05n5k8Z0sfe83KDaTC4dh3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
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



On 7/22/2026 9:02 AM, root wrote:
> From: Sobin Thomas <sobin.thomas@intel.com>
>
> Add coverage for GT-specific uc debugfs entries by introducing a new
> uc-info-read subtest that validates the presence of required files in the
> GT debugfs hierarchy. The test currently verifies the existence of
> the following debugfs nodes:
>
>    - uc/gsc_info
>    - uc/huc_info
>    - uc/guc_info
>    - uc/guc_pc
>
> These additions improve validation of Xe GT debugfs interfaces and
> provide basic functional coverage for the GSC information debugfs node.
>
> v2: Add support for guc and huc info (Daniele)
> v3: Added checks for the device nodes.
> v4: Consolidated the calls into single test_uc_info_read subtest
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_debugfs.c | 73 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index da482157e..fd651801c 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -16,6 +16,18 @@ struct {
>   	bool warn_on_not_hit;
>   } opt = { 0 };
>   
> +struct uc_info_node {
> +	const char *node;
> +	bool mandatory;
> +};
> +
> +static const struct uc_info_node uc_info_nodes[] = {
> +	{ "uc/gsc_info", false },
> +	{ "uc/huc_info", false },
> +	{ "uc/guc_info", true },
> +	{ "uc/guc_pc",   true },
> +};
> +
>   /**
>    * TEST: Xe debugfs test
>    * Description: Xe-specific debugfs tests. These are complementary to the
> @@ -595,6 +607,58 @@ static void check_gt_reg_sr(int fd, int gt)
>   	igt_assert_eq(problems, 0);
>   }
>   
> +/**
> + * SUBTEST: uc-info-read
> + * Description: This is for reading the uc device nodes.
> + */
> +static void test_uc_info_read(struct xe_device *xe_dev, unsigned int gt)
> +{
> +	int debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
> +	int i;
> +	int fail_count = 0;
> +
> +	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(uc_info_nodes); i++) {
> +		const char *node = uc_info_nodes[i].node;
> +		bool mandatory = uc_info_nodes[i].mandatory;
> +		char *buf;
> +
> +		if (faccessat(debugfs_fd, node, F_OK, 0) < 0) {

We do have the igt_sysfs_has_attr helper that already wraps the 
faccessat check.

> +			if (mandatory)
> +				fail_count++;
> +			igt_info("%s debugfs node not present on GT-%u\n", node, gt);
> +			continue;
> +		}
> +		buf = igt_sysfs_get(debugfs_fd, node);
> +		if (!buf) {
> +			if (mandatory) {
> +				fail_count++;
> +				igt_info("Failed to read mandatory %s debugfs file on GT-%u\n",
> +					 node, gt);
> +			} else {
> +				igt_info("Failed to read %s debugfs file on GT-%u\n", node, gt);

Here you have separate logs for mandatory vs optional, but above for the 
missing node you don't. my personal preference goes to having a single 
log statement, if you want to have the "mandatory" or "optional" words 
in it you can just pass them as a sting param based on the value of the 
mandatory variable.

> +			}
> +			continue;
> +		}
> +		if (buf[0] == '\0') {
> +			free(buf);
> +			if (mandatory) {
> +				fail_count++;
> +				igt_info("Mandatory %s debugfs file is empty on GT-%u\n", node, gt);
> +			} else {
> +				igt_info("Optional %s debugfs file is empty on GT-%u\n", node, gt);
> +			}
> +			continue;
> +		}
> +		igt_info("GT-%u: successfully read %s (%zu bytes)\n", gt, node, strlen(buf));
> +		free(buf);

Could use some empty lines between the if statements to make the code 
more readable.

Daniele

> +	}
> +	close(debugfs_fd);
> +	igt_fail_on_f(fail_count > 0, "%d mandatory debugfs node(s) failed  (missing/unreadable/empty) on GT-%u\n",
> +		      fail_count, gt);
> +}
> +
>   const char *help_str =
>   	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
>   
> @@ -619,8 +683,9 @@ static int opt_handler(int option, int option_index, void *input)
>   int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
>   	struct xe_device *xe_dev;
> +	int fd = -1;
> +	unsigned int gt;
>   	unsigned int t;
> -	int fd = -1, gt;
>   
>   	igt_fixture() {
>   		fd = drm_open_driver_master(DRIVER_XE);
> @@ -648,6 +713,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			igt_dynamic_f("gt%d", gt)
>   				check_gt_reg_sr(fd, gt);
>   
> +	igt_describe("Verify that uC debugfs info nodes are present and readable.");
> +	igt_subtest_with_dynamic("uc-info-read")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt%d", gt)
> +				test_uc_info_read(xe_dev, gt);
> +
>   	igt_fixture() {
>   		drm_close_driver(fd);
>   	}

