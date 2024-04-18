Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A5CC04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 22:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA3211A05D;
	Thu, 18 Apr 2024 22:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtPl/Yuq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7590B11A05B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 22:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713479684; x=1745015684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nKwH+jbpapaX5FYC+X6O7DvJmI+/Y/LRbJpXeQoR6DU=;
 b=PtPl/YuqRfAtpmNUAvRTgjhtdeprqHRDxXabDjNP/eCF3wYkPjy3OM8K
 Na2yWIMbJrVtvhSVYadBQ68QQZgxx66S5rdcm/E+VUeBhDEuOu8zI5Fy2
 dq71DfqaDaEXX2vC4RSylZoJVS/humhnfBrhlLaPFi/BGmc0QhOfk5YEq
 s/QGbc/gDUqxZ/k0ts2IVYXKUJXYtT9TfwAjHA8EA27NP7bBPLeH/eF9W
 izJ7kXovRR1nRDjv2pR9zWouN4dI0hF5hFm1zbpi37+CR241C7x5t8Yu+
 r/S2igy1PpddxDzPn0EiChQeORQsARC9Xd075WXxy4NKY9ZEPF19Httsc g==;
X-CSE-ConnectionGUID: BY/RhQV/TaGOAiHrxLpchQ==
X-CSE-MsgGUID: 3rZzrkFgTkCH9PStRML8HA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8920226"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8920226"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:34:44 -0700
X-CSE-ConnectionGUID: B80zErzJR9uj8K7rXhTcPg==
X-CSE-MsgGUID: grcsUNkbTreRKDfZN9pP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27766966"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 15:34:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:34:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:34:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 15:34:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZbQsyMpfS04YhAAPamghumpQn3dhozVowUaRZu8JAcTt5RRYK5W4XmVwObDjJEkRaTW9OYQ01EMAzw7ORloM/190mGcm2v9y2dFuHb/GJ/jNqC+wZTQtNXpFJrHgi0xi4klV5GRnaG6QnJMC1FbUBghobhHoBR6Ib1l4Lhrw5ZcedCMY94BDtkqkDi5ecEuXe5DzYWNzU3RV/Cdd6E/3Cy+SHemlaE2g68o3HP5Vje4OAoaQgsZ2Kg1Qm69OZNFkNk7eUQZfkKW14FT9Zyvs54Da/pbNZdMHu6ohrwNUjWh0jelbRs0qX5OdTzd4m2f6URY6Yk1eYndy/c/wIfqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F+jKhBk9+khd8tSwtNOrwm1EziLOmSmHt1j/fj4PlU=;
 b=jYWxXoSwwHfp4sMldEmb2P4/Tu3L7VWsLv4/22DdbQljPckb3Fe8qsh43WUH6PwwspzFcNZ4W4qcGf/iDV5XXnB1VR/eOWh8Z5fuDSeWkmKYYD7MxZgaG7bTJcp4Msx4PHKL21WmP5IMhwEJrp1MGTEkXkcVSVpVlC+cEAK/o5mZ9YdeJ89g67ZELJ40Ngyfdfj1Um3VMRXd1VKiEn2tnf6TIBPo/vxD9ACuv4jH1H3ZYpPF4fG2B+yM81M2emNAg/wF9K4uKNZ7vdUtCcJ4n2mlF/8gfrW8+5Cklzap6zcXTFV/Kad6ys+Nbt83z6Hci+/N/RysC0wvWX63MqzyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Thu, 18 Apr
 2024 22:34:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 22:34:35 +0000
Date: Thu, 18 Apr 2024 15:34:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 06/12] lib/igt_drm_fdinfo: Stop ignoring space
 where not needed
Message-ID: <ZiGf+SVQbyLnmvAE@orsosgc001>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405060056.59379-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e906a78-caf3-47a9-73d7-08dc5ff7b94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wzf7WWwbiqEyzFoH31Uhwo8Ha8sv8QbkXQgMhDe0bc3+7JbFLYJGcMld8jJdxZejvttHCeLYI87DP1NrKAR6+R59qbcSHzMGCDZ0PtxOJ8pJZX1iotT01bgrRn+EEyXBJvLnqehOp6PNVBeBrAKrRw/kI/OHr/lM15CIEVw2BRfjyUzRiMgrHxzlLMqRZgLhrWkS2CvYoP20h17qxoF7HyfO3D+nkeqWex1Ky73rFZtdD9R76ozrd8eCWDl9gheGzh6zJ6yKMvPCbf3B7ZXDne9NyWgh6LhylIolwx46yLNAITsFqqDea2FjPdZPzaEJnPzAC/mikiEn2qJmXAvxq5K7FIUZjKA0jbB7T5qqym7SpRNa3hbL4w6FFc3nyZ7tAXBeLae/K6eJ5ORpWYDMcrXCHQYh+seFsZ6tyqmqt0+04L0NB7yKIIm/7uIJ98Mu6O/l9K+Mfzk4CVCHZNk0mhor0iAUYzcp3TJpY1pci0GqtsRr7TeiiDyiSaWzIlTg7LhlubG87I05mtXoF54FuNv/ugOcPV/6KvDsTfQBsjj3AnsZuc1eGJ/zkZziTGEPlhzGLIkxhqZQzRywUx41FTpE3SEXLNnuiRHTXb9t8IXx2cNTthsRZ/GfDA5WGob+OzS+l/m/4QhPVl5hRH1nvPw2DAsg1IQanH0Fjt0WTC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXJsd2Vlb1VEVm9VMFNtRUtxdnpDV2pVQUl5eEdNQU9ZUllhWjRreFIrdGxm?=
 =?utf-8?B?VDRybEE5ei9NQldiRnYrTVpZNG8vcG9LMlMvdHprcEl0QTA2VVJhNzRScmxH?=
 =?utf-8?B?cUN5UEdMNitiMW0xQWp2eXg0OHVtbjM3ZXZmM1NGQ2sxb1FHQVpaK3hRTjFq?=
 =?utf-8?B?RXdIdVMzNzdFamNHYlRIVitSTjhlV0E4Y09BNlROeTZ5dXZ1eFVYc2RuVGk5?=
 =?utf-8?B?R01VRVVZb1hxNlRSYUtPUTRIeUwzRjErMHZmcVZ1RXRndXc3cTRyMzhPdHhl?=
 =?utf-8?B?T1ZrT2tiNkZZS3gzS0VLSjlycjRUeVRDdmZOMFBWMHM5QXlFVGNHVmV3aXFR?=
 =?utf-8?B?Mk5YalhBYkNrOGp2SEJwQ1MvbjlTa1duWUFEVHFaNVFwMk0vU2tJd1doSFMx?=
 =?utf-8?B?VUREc1hocVFtNjIvcEIrNGZxMXdzcFVPblJXRXBlYWhVcU54RmMwUVNNMFQv?=
 =?utf-8?B?aG5LODVkdzVQTUdhT3AyYUhVaDVzb0hHM1RPcHRPM2doVzJYN01UUFpqN3lp?=
 =?utf-8?B?SWlPQjIzc3hPV0pyM0pKYUU1a2d6dm1Ha0lPaEcycnVpWFRjTk5wd1UwMzlB?=
 =?utf-8?B?endCaHY3aEE3OFZTSjFHVTNmNGJ1dEpXWGJLMTVSUW9lbGxMTVBuVkJoc1Y0?=
 =?utf-8?B?aEREZyttN2dtN0NwaWRXais5ZnZJS2EvWnRXSk5tcCtjSnVDbkZZT1EveTh3?=
 =?utf-8?B?QlB5NW1YMVNkeTd2amdGNklKT0xHLzRHRDNSWXpOOGpxTDlFRjVucU9vZkJY?=
 =?utf-8?B?akVtMUNkalIzRHJXWUVVTEZUbi93QUNDeTF2MmZqN0ZzWjdPK1h1SkdKUGds?=
 =?utf-8?B?cDJjS3VhVFRMT3A3VkgrOTgwRzlKbjRmZ1A0ZzRJTHNZY0tsSGNiQWxDL0pR?=
 =?utf-8?B?Z0tWZlhrWmhhL09UbU53QjBLNDVHN0Z5NzcrNGozM1R0MEdZTEtxUFdXM2VR?=
 =?utf-8?B?R0g2eVFsUmRiaHRVNlNJS2xvOStVRWJtWDQzUWM4dXB2Z3R4aEoxWWxYYlJE?=
 =?utf-8?B?d2lBR1hUeTBlSDR5dkZzZTBZQnNrSVpNQXNreWd1eFFRVWsxQ0NQOGdOVnpi?=
 =?utf-8?B?WDVsS0JMSnZSMXZlUVg0d24zUENyYlBJWFFTVEQ5M1RWVUpyVXBKekVmYXBs?=
 =?utf-8?B?Tmwyc1RQSXNSSWdwWTJLZUJOSTZYa1dpUm1UOXRYd2JJS25tdzFuTTc0c3dx?=
 =?utf-8?B?SG15WnUzSmx1ZktGWEQ0V1hnSnFMRElNRE9WR3JQamM2ekE4L1gydUZNdU9K?=
 =?utf-8?B?S1ZhdGgzdDZOdDlsQjcxK3AySjk5dkNzMjYzQzhaK2x3SVpRMDhGeWkrbE5x?=
 =?utf-8?B?UlBOWVU3cWZldm8yTEtvWjQyYkdrdDQ4bnhZN08wZldQTmNBR1liLzBkcUFG?=
 =?utf-8?B?RVJFYW5TS2hDTzFTMTkyaXhTUUQvYU1ka2FPY3ZVUjl5TVhyZ0JOUHJ4UklO?=
 =?utf-8?B?MXlJZVBZUGZndlE3SzVOejFvcmtHRXREcHJBWGFMYUpxKzFraG0vT0sxNDZp?=
 =?utf-8?B?b3RQaWZLbWt4VGQxUGttTDVTWks1bDcyYnF5eDV4T0tOWFduclZ1MGJNMElw?=
 =?utf-8?B?dTVudVZ2ZWNvWmp3TzBqODlFWGhnb2lnaDNvbVY1M2IveTI4L0k5OXN4M1Zz?=
 =?utf-8?B?b25XcFd5ODVSTmtvc0FhNVhvdHc3bWtqUkhLZnRCZ29wVmNCTXJzNnBYWWJt?=
 =?utf-8?B?c3ZEUm42ZDZRaXIrd0RCKys2S0FYUUFMZndmRmV4SE5DNWtCcGFkYllSemRr?=
 =?utf-8?B?SEJ6VzJTQUorRHhRV0xKUlBDUjZmbTRLcEFEWWd0RnNOaGlvZk1KTnhwT3pq?=
 =?utf-8?B?cmlYMnNtTGVodzh5TU5YeXlTNWxWRTRGdkhlVE9oeG43alBTb2VDcjVWWDhX?=
 =?utf-8?B?cDZDUGZOU3JwNWFHTG90NUhLdVBhUTBIY3dIQXBBdk03OHNtZUZUaHU3MEVD?=
 =?utf-8?B?TnBTeE9OUUZkNGhUMUViYXZ0ZGNaSkFlYkFXNWR6REVoTkI0Q2RoNkhaS20y?=
 =?utf-8?B?TVpVWEI0R2tkVFJJTG5wQ1Vtd0d2eDFNekJZUjI5N1V6L2FkeGNpazVNQ2tr?=
 =?utf-8?B?WExGZHRDdzUyYUtmanlvTUFRa2JiVjF3bTBtc2lFMU1qNHh2eFUzZFQrMnlF?=
 =?utf-8?B?dm5nN1pQcHJQRTdRWVNEYXp5dnAzMUs2TStJcGZQR3BFSzdNVFFWMjd4VkdX?=
 =?utf-8?Q?gEk7GNVdURkCL68bP//7PYQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e906a78-caf3-47a9-73d7-08dc5ff7b94f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 22:34:35.3112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLKf6pqBlxDqiaX6nlWe6ZImQJDw84cWfxEz3hEptQgzJiQuGH5GC8HoFVFct0WgveSAIJf0Gkkgqv2OUKasTne2UIDvFRNLsUx64ljdUXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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

On Fri, Apr 05, 2024 at 01:00:50AM -0500, Lucas De Marchi wrote:
>strto[ul]l() family of functions already ignore leading spaces. There's
>no need to be explicit.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/igt_drm_fdinfo.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 8eb5e5eed..5f05f210e 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -103,10 +103,8 @@ static int parse_engine(const char *name, struct drm_client_fdinfo *info,
> 		}
> 	}
>
>-	if (found >= 0) {
>-		p = ignore_space(p);
>+	if (found >= 0)
> 		*val = strtoull(p, NULL, 10);
>-	}
>
> 	return found;
> }
>@@ -159,7 +157,6 @@ static int parse_region(const char *name, struct drm_client_fdinfo *info,
> 	if (found < 0)
> 		goto out;
>
>-	p = ignore_space(p);
> 	*val = strtoull(p, NULL, 10);
>
> 	p = strchr(p, ' ');
>-- 
>2.44.0
>
