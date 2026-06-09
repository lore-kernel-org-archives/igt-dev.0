Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A234CD8CAC
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 08:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAD610E189;
	Tue,  9 Jun 2026 08:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDqk/c+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758CC10E189
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780992687; x=1812528687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=svF94hDUo40chj8YGcodkqALbnkYsE8Rc6jYfrc8nBY=;
 b=XDqk/c+yqKkCroidTWKrBfL3CiYyvbVYwW+ozetuu7jAgW9MIh7jbf6k
 vxsfnb0o7SYb+AdDCoGJJz5gDnAm8VFCf58r+Zy4dwFGugeRYFe8XlzFW
 BPDM2GHhZz0ODOu7xB/rrFGtDA56VGmuL1Nrzf6PR2l40xYQ52eKPw+8S
 ERiQyCSOKl6aSYloKtfRpLVBgZEQKKl/mPnsAOZ1HmcNrH9mC85+t81bq
 a6Iu1VWpLgHcHmL8VT3pJKpFKUUx3JG6Yn+wnHrW89X67BGQgP9uBGKAI
 iKUSbwFmMNQYFSQ0pdL+dC7z7uUksXqcOhmOIqfD14a1zNiCoP2LUjaKe Q==;
X-CSE-ConnectionGUID: PVjMJP9URlCIBYkHQikb8w==
X-CSE-MsgGUID: lbLUjfmUSiG9pHQgVaBLIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92310469"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92310469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:11:27 -0700
X-CSE-ConnectionGUID: UnvzZLWASTiWbtfMvktxxQ==
X-CSE-MsgGUID: Lq/92H2STM6Emg3DaIyNTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="241343371"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:11:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:11:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 01:11:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:11:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnNYnxFRRy18GUgGSG6lXHukSDpFuMHR0BdwOJ6UfWwYxegFa9xiS6tw/qt4MxBJ+8hyrnwJb5ygDQ4qIBx3Vtm7DsAMCrCIMEe5rmHQtj8Q/AeUNujvBlV3bnzky79ZadvDnVWbxBgoAmeasQlN/iPSdsoB5yY1y/hRstXIRG7M9Ot5yor9CRGEYG8GkYO8YxZIY61+Qsg7ZBBiqmbvJjL46zOisRgPt8f9H/m77gRDBHm3asfhQjkG7Ui51CGncwC2WA52rf4JuLxZiaeXSX2/8PiubgQkq4iS8rjWw7Zl1BL9XjmfvCg/9FH4XBmvBTlqlrfFlAZU6oSpFQQ1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhPVMpfmNYj7zz2236RIrZeAh3mGCqkeLeOcl4OXLqU=;
 b=gF1BT52vKvxvmRp/ubqJn5HK1Zy1ViXj6i9QEJosVR2VDQul/UzpU9f+61kobcmbPOr/kPAQp58AzeAwB39peUcTwF1W0K0EjWuxtjJNVy49+t3aQl7pWlN4iS5VIuFCvkKF9z4UFQGmxwAN4kxvUSXa5veXRFrFFSM2h6Ku7lT+VYErX0ifgX0INMIXxcWEjGHlry+ifQxr2pFERA+lnSVlg3J1IBacAwUsF8CtZjvFqZV5G+pUFCsgQEi+IOgyW5cwQy4APsqZ/ohl4Kih4Fhn9Ib+dM5YXH1Ep2XpzfqqOXR9WjUj8JG+tzIDRMDE/9BrL/dXOztdszocLdS+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:11:19 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 08:11:19 +0000
Message-ID: <7012f6e5-c4df-48be-bdde-0a8c12ea3b08@intel.com>
Date: Tue, 9 Jun 2026 10:11:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/6] tests/intel/xe_sriov_flr: Arm SR-IOV exit
 cleanup
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
 <20260602141609.3941750-7-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260602141609.3941750-7-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 57055968-d5dc-4d6b-266c-08dec5feaf8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: D0ym9QcqXnUfnL0KqslHql9GQH1/BRlVxTTsYH2l/0UjML1a4C3pd2kkjQddPkpGT90OgkPRiz5ZIJ8sMZWWbjWPlYaZIgrn790WDa2dLdJUL7zptixvehO5YMhzKZuE1k09dRb64fZrBoNOkM+SKHVz2y5cXKybMCJ3mrHTu1UPzp4j36x4g42jdSeCYAbo1FmnepHpUPsqIqeJRl/ewnojvHi5Txcy+SYfoPyQVWlpdEaiJcjla0xyj5uCBdS/zXQovUEJpB+A9WmSvwLzN29yt6KDxQLAocB4Q/GOm3j1TdqtnDpl1aM0bYIgm2tz8DsEe83fAvVTwVrtioyINYTW0kdRlJ5qA4P17TQ6HvGMjKaHRG2jHHBka3cufILC2tl9pMiWXmsoxRvOGVKd0+/cn3jp/eDjZMnbvC+F1aQKqGphuhV7tjr1G5vjKgMonkiXjH/eSVYQC4JbiKku92OQ7fGTZ6oiRz0QuzxuNojiaLd2vUWhRkEZW6XbZiLnkE0IeAZ+2POiUgIupCIeBI2uNJsO74fcfaxd+0v0tUrjUee0OAy6Xgu2OUgiUYlJVKx4JV8A4hIOSwo6hWOsT75Gg8QH/tPJSyBwZeMQJt0FUmHkEaHrL4LVKomlzOakktQJ8fXh2B4pyQNU9rOf1LKmh4wrqEiRlndO+fjuRQuC9Pptlh4qblRZZ288UHfZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(5023799004)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clVlb01Qd3o4OVl1MWtZOHQzUEFyT1lQb244RWk5c0tHQWVhMmJ1RVBqSC9r?=
 =?utf-8?B?Z1BuUjhxV2lKQUwvalJ3WWxGRjRrenB3b2VmUGpiSEZDRmhKSEt2M2xQb1NQ?=
 =?utf-8?B?bHRta1FLd0NzYWZLaVJSMjkyVmNRS3d3MXZVTnk3S1gyN2RubXRRZldZRk5J?=
 =?utf-8?B?OVhkMFBvT2EwaHpPWHRUZjlaKzN2d2FKMWNhUDRiSkhJcnhuMUVQcGtOcEtv?=
 =?utf-8?B?T3FHTmJpL0NxckJMd2l6RC9wWmhkYlpBYk1lQlI0N1ZzVmJJdlI0bHZlMmc3?=
 =?utf-8?B?ZHBDb1Jvd1J1QXQ5N2szb0RPTmE4VW9VQ1NLR21ZTDFXT2UxSkk2NEhBQTR2?=
 =?utf-8?B?SGcxbUUwa2pUdDdRcWlwSkgzeDBFK2lBVmV1QUJKRmlMeUJsaXlDekFaU1Uw?=
 =?utf-8?B?MVVJYktseVJGbU9ucmJsdmR1Z0YvdjNSbmJ3anUxaVlvOWwyc1RwT0VVSnAr?=
 =?utf-8?B?U1RvL1RnU3N2UWordnl1QS9QV29IeVdwV3RNeERuczhLOXEzMm02azNqTTJn?=
 =?utf-8?B?T25iOEtZZDNqYUFkU1BkWVMwRjk3VGhGRWZ4UHZQVTB1RjRGTXNWaXFpMnVl?=
 =?utf-8?B?dzZRZW9TSUxVMGN3aDRBSktJaFVLL1FCOWRjNmpTekNnVExhaFpZYkJTdUI2?=
 =?utf-8?B?bnIwQWxmbXRwMENYOXRFbVJXVCt6T2JBcDNOVk1vQjdTd1FpNjAvaUVvZUVY?=
 =?utf-8?B?bUVpdUZiRWgrcEdXUWxwbXIxZTdFa1NkeEM3OHVaUDFiNHE0eTJlV2lRbHl0?=
 =?utf-8?B?ZnBJeE5aWkZhUlExL1VoWTd6NkNMRDFpTXFsOHdSU3IvL0tlb0ZtV1hwbWlG?=
 =?utf-8?B?dm1mbFBnLytoSDVvcjI1eXJMNW5uUmMwS3huT3oya0o5cS8zbFd6dFRyamw2?=
 =?utf-8?B?Y2VYekxWSlNxTWRrOHRUUzF3Wmx0ZVRHZTh6ak5UVDFtL0srTWZlRXFnWllu?=
 =?utf-8?B?VkJxNzE3V2E3MFVBR3NieE1WRmRHUGJtdTNhNjExSVBjK1doekxCNHUyaHk3?=
 =?utf-8?B?T01hZis4eTVmOEZEK3VKT0NrazdlbXFiZ1FkdElaakJVbmJGZU96NS8zakhZ?=
 =?utf-8?B?ZjByQkt0VUZGZ1dlVC93b3lRNVFnM21ZVTZuaW1iSVpiTEduU0FHNEhiZFdL?=
 =?utf-8?B?d1RqRjkwV01FWmF4K1JKTHBQOEZ4MlJBSW9rZEVDVTR0bHkvTk5wT1Frd0pm?=
 =?utf-8?B?eHVKanNNUjlCRG5lVFB3eW90S3Iram82LzJaNTlIeUozSHFMejYzNm9icUFl?=
 =?utf-8?B?ZWtSQ2FrMjZhQ1RzL09yRWUvY0JPbUlkWURhbm1KSjVYOUZYaXlqcmt1c3pk?=
 =?utf-8?B?VXJwMSs0MGEzd241ejMzbFNrNy95TzdJcDdwMG5JMWdWSGhHSmZlTUs2Yjd0?=
 =?utf-8?B?SjFwd285YWsyenJ3SWRjREhWWGN3T2JraEZTelF0dTBoWTdHQ3ovRFhZUm15?=
 =?utf-8?B?VUdwQkg4Z1YrUXU4YVp6WU11NHV1YnpjcUQ1SVpDUkQwUUFyMUpnZUFPRDFP?=
 =?utf-8?B?NmZNMm9ZVTRjczRXczZDQWs1dGplVy93WEh6ZUVZU2pOSm9aMi9VTVdValBi?=
 =?utf-8?B?RjFJSXVTQU9DQnJDcWc1RjQ1Y3ZjdDUxWXNyK1VNcmJwSGhuWGd1RW0rUUg1?=
 =?utf-8?B?MG1rK3N2TVJHeDYwcGNuUkFXb1l5RjVmRTdCODh4ZHM0amZQY2dhVklMcDJY?=
 =?utf-8?B?M0lrdnhYdjYvNWhsd2J3bGd4MDcrelJNWStZZFZyako3Skp2UHNZd2F6b3l2?=
 =?utf-8?B?dHVEUUFWQjBnY3l0YnQ5MzhZb1dzeWhlMFVxYWpzTi9yaFZEWmRzRnJmQ3dp?=
 =?utf-8?B?UzVMQzNoSUVnZGVjRW8ralk4ZU5QbG02NXdrK3JxaHpMQStsYUt0Q3p5cm1V?=
 =?utf-8?B?QmNaNnVYNm1ybERnWjVUN3Yvb29yTkI0emozdjJacExwUkhUeEFJTWw4MytU?=
 =?utf-8?B?ZW9uOVdLcFd1YXQ3WlpONkVrNXMvSWZNYjFlK3M2aTdTajRidmFtQjlMenBE?=
 =?utf-8?B?dmhvZ1BWd3lWVWIrbW92SXB4RmlqdjBZTGZZSXJ1amRHaW96ZXQrMWRyMkJy?=
 =?utf-8?B?M3A2VTljSURrQjlYVTVOVkF1TktjQ3NVcUtFMkFkTVFyMjAxSkFDSmk0T1Rz?=
 =?utf-8?B?cTEzckRtMWRnM2RrTDNTVVVIcmxVNlhudGw5VFJPT3hGaXBMYlBCZ1FVRFBs?=
 =?utf-8?B?eTlzSXFOWFo5OVJrNXFZNHNvUkpYWG1PTlMrbXFiemEzK2ZEZ3JrQjBjL1JM?=
 =?utf-8?B?WVc1U0pKOW5SM2NwNUc1ajNvV1JwZlB0TklCSlo1NkRoWStTdEg1QXdDa0l1?=
 =?utf-8?B?NngrM2EyWEZyZUd4RS9SSndMRHJTY055K0F1UXpTN2VxSnRlTUNZZz09?=
X-Exchange-RoutingPolicyChecked: MMjGAOwq+TIl/+3sHCXeSHfx+JOhnejtGglZqFPEoQjKWVyBlw8ui00ylUkojP8CnthyLnfbryb3tFK7eLpyHFIpPTWtWO/1x/R0MI03Munb3qvwPW5EyIe0rSeHG6Fm2vMNwcac8vdZvIai43vZVeepzSwH2qpn3GAOi3w737eD4naR2/xv/z/eHe6Q77RS010Bax5Je5lNkb2pGiDZBkoh0/JQ4egA7RAyuGY8MW4imvGEBmfgZ0BJmlLLaz+tldzM57Bzat2sYu7QESmmd+/A+Qu5l7sErrNR/z5G2HJ1hsuCorikd0g7Q8+9zukuT8EtFaQ7BfT7LR3pAB20/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 57055968-d5dc-4d6b-266c-08dec5feaf8f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:19.2513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsime5tTErD/Erl+OZuYFvkgy97UEADMjRIvPnMY4WA8LxJ/1Q4PhRaYoQxnCoFOo7y/uQ7QQbOfgzJZgE9VtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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


On 6/2/2026 16:16, Marcin Bernatowicz wrote:
> Install SR-IOV exit handler in xe_sriov_flr.
>
> Refactor xe_vfio_pci module restore helper into shared core with two
> wrappers: strict teardown path (abort on failure) and best-effort exit
> cleanup callback (warn on failure). Clear exit handler after explicit
> teardown succeeds.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_flr.c | 42 ++++++++++++++++++++++++++++++--------
>   1 file changed, 33 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 861e647e4..dcc8e633e 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -334,28 +334,50 @@ static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
>   	free(slot);
>   }
>   
> -static void restore_xe_vfio_module(void)
> +static bool __restore_xe_vfio_module_state(void)
>   {
>   	bool loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
>   	int ret;
>   
>   	if (loaded == g_xe_vfio_loaded_initially)
> -		return;
> +		return true;
>   
>   	ret = g_xe_vfio_loaded_initially ?
>   		igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) :
>   		igt_kmod_unload(XE_VFIO_PCI_MODULE);
> -	igt_abort_on_f(ret,
> -		       "Failed to %s %s during cleanup\n",
> -		       g_xe_vfio_loaded_initially ? "load" : "unload",
> -		       XE_VFIO_PCI_MODULE);
> +	if (ret)
> +		return false;
>   
>   	loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
> -	igt_abort_on_f(loaded != g_xe_vfio_loaded_initially,
> -		       "%s should be %s after cleanup\n",
> +
> +	return loaded == g_xe_vfio_loaded_initially;
> +}
> +
> +static void restore_xe_vfio_module_or_abort(void)
> +{
> +	igt_abort_on_f(!__restore_xe_vfio_module_state(),
> +		       "Failed to restore %s to %s during cleanup\n",
>   		       XE_VFIO_PCI_MODULE,
>   		       g_xe_vfio_loaded_initially ? "loaded" : "unloaded");
>   }
> +
> +static void restore_xe_vfio_module_best_effort(void)
> +{
> +	igt_warn_on_f(!__restore_xe_vfio_module_state(),
> +		      "Failed to restore %s to %s during exit cleanup\n",
> +		      XE_VFIO_PCI_MODULE,
> +		      g_xe_vfio_loaded_initially ? "loaded" : "unloaded");
> +}
> +
> +static void exit_cleanup(int pf_fd, int sig, void *data)
> +{
> +	(void)pf_fd;
> +	(void)sig;
> +	(void)data;
> +
> +	restore_xe_vfio_module_best_effort();
> +}
> +
>   /**
>    * flr_exec_strategy - Function pointer for FLR execution strategy
>    * @pf_fd: File descriptor for the Physical Function (PF).
> @@ -1230,6 +1252,7 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>   		g_xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
> +		igt_sriov_install_exit_handler(pf_fd, true, exit_cleanup, NULL);
>   	}
>   
>   	igt_describe("Initiate FLR without any additional state checks.");
> @@ -1279,7 +1302,8 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
> -		restore_xe_vfio_module();
> +		restore_xe_vfio_module_or_abort();
> +		igt_sriov_clear_exit_handler();
>   		close(pf_fd);
>   	}
>   }
