Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798DAC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C5010E2FE;
	Thu, 20 Jun 2024 23:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/JCA1XT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1342210E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925588; x=1750461588;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WN3bFVq2COFQYyCnFbId4jmu6vaNtpUovIGIDPSCxQM=;
 b=N/JCA1XTF58NTY/LChS5Wxjd8WinCy4SSc7W325t9w3uw963fMVMigmH
 Qt4oNqs1rwCiyW4zPM10R/mKgmhb/Je6rrc8ElOwbrE0HkGtqb8QryQX+
 VgStVHldyzCt3yMe8DDjogka1b7QNeuVLaG5jrTq/LuHEELUx8UmpAnL5
 mzGdeNnaXBeYwYSRly+XrpRlMbrMBrvn2RiBJepPKErF8dUOA8iifEi4V
 RD4NY9FKYpGkVhNIPjN5Mhs4omWbT06cfMCt+AyaUf5wAU8VAUVl+lU+G
 EdFunztUcNImbzgbwWaxwa/WtWGv1f1R7iBXXK3Qs4eBguB+n3kH9x6CE A==;
X-CSE-ConnectionGUID: XzvAIQyGRVOTEBUJhTIArQ==
X-CSE-MsgGUID: jAkJy1ceQz6QqWwPw3RIGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33483096"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="33483096"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:19:48 -0700
X-CSE-ConnectionGUID: tH4kwPqCQWGqOFaK3msLtQ==
X-CSE-MsgGUID: UXGtTb9vR6qZRYLu7vAAfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42360118"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:19:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:19:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:19:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:19:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1Jc4Lqbl3Tn3o8SigqqvClw4zsyYBPR3OrFCRzPTtIc3Gw5FgF+mS6i+qX9jbkzaEOFhaf4AEUOvSm3bQae7aA7ieDC2g1eF3R97gUHvdg7GVRQxg6CUxK3z08ncZB/VLVGXPN05+BOHTnlq4L5A/pBP6nza6m5aLDrdLEEyCEH6n0FcdTmoYO25HYutGD/gws+PkGi2yAKP9Sh0IOZjPWtZIWwcMDDGv/eJyg3CS72GiBJS7o6xrQgVDod9cbuB8jv+Kc9IzA0cuBB+80t6/AVmplegfxwoLFXuRDBPKG8qFyqefenvENXJ2qVO2rZcu8tOiF5MbMJE9rP29anFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQJn3ODNbSgRQiAwi1Fk1cLPslm3QY7OBxDMap9o9N8=;
 b=Jb6jKjcEW8T8joGadV6v6cNr35H6DRGA48REmdS6DpGWJdP0dgtOAo93V1dFgWyhAZ7l9ATf+BK9e45kqSfnYkAQYWW+vfkmk3RlS8K+bxYkYBMoLs/gIbGT5PdzxOG9n2LLruVBVDQ0SV3trfOFqgShgjLv/PaQgCW80nDIcUamD5o10UrRvDWZhlpZZ+SVyjKBosrlVimVc3Dpij1nuLtQYaPUK5Q+pRQ6jYov2Coh6BkmMo47RDkPEduP4xnodCcau9A+0JLaa2xcP9YM1RU9oGozD+SlkGL3FB9Sw7vjNjMQpFbUvVGBSltozvBdQ92CAEwPB12nQqos5RbS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:19:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:19:38 +0000
Date: Thu, 20 Jun 2024 16:19:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 14/28] tests/intel/xe_oa: buffer-fill,
 non-zero-reason, enable-disable
Message-ID: <ZnS5CHemA9QHeDWj@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-15-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-15-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW5PR11MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: dbefb209-a11a-4d84-33ce-08dc917f748d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWV5K0FSUnV6R3p1NDVRaytScm5CVjBvbDF2d0RCZ0VDWGxmaTh3cHVJY1cy?=
 =?utf-8?B?TW5FbUhSZE5mc085UE5RUW85dHAyVmwzb0ZUaDJQUWNGaXpDcFNtbEswcmJK?=
 =?utf-8?B?S0JteVB1Z3JsK0F4NStKYTNyeFpiMUlGcEx1YlE5Y1U3U1dTbWcyR0xoY091?=
 =?utf-8?B?U0tQbDRjTGdzSDRUOHU2NENLVlRDczdyVUI4YWVwSC81TGxESENHa1NjMUl2?=
 =?utf-8?B?SkZPdlRnZldSaWtoZVdKS3hsMkw4a0RkaG1FZHdaL1Q1Ky9FV2VpVDV5VCtP?=
 =?utf-8?B?Z0l1MHRVOGtJN3dtblRrRVlNa3VvTHVnK0cxdXVjS0tBWWo3UlY0aU9pY1Bh?=
 =?utf-8?B?NUZyc0JnaEsrREdwVjBMV1JUMW1wZ0ZvMklVSkZpeXBXMVpkYXU5TGsveUxR?=
 =?utf-8?B?bkhrdkx4NzdscWhnU25PS3h2ZkpTZzVremRuMUMvYjRQMEF5VEorWjZrZEJS?=
 =?utf-8?B?UlRKZHNwaHBKR0xIRDRFQzI0ODIwVGFjREYrbnFJeTZzd2N0SVB0cWNTaGRq?=
 =?utf-8?B?ZWNDbG5tczIrT2JTaW5JMUpYSFkwN0Z6VTIyOFo4b1F2elBkQnpYWVV5b3Jt?=
 =?utf-8?B?QWFIQ0VxTUlabDFENTBZRy9nSG0wNVFoVzhmc3pCaVFqQWpSdEpOS25rMTRN?=
 =?utf-8?B?SExlSE8velF5WVhJY1Z5bmhGdHNLaE45NStqa2dmdzZyZ1p1WDZlOUZiMWla?=
 =?utf-8?B?dG05d3ByZngwUWVHTE5FTitMbk94VW1JL1Nwc1pYRE9wTy9vK1poeWxiL01m?=
 =?utf-8?B?WUZsQWpjSTRWT01SdUJBK1YycXc5TXRXaEpNcFhpOGdDK2laQWpURTVIZnMw?=
 =?utf-8?B?MEtLL2FCYUJKNWMrRnlGUUNBeG5pSC96Qk9ZeW9JaldIUk1hN21YZWpXSm0v?=
 =?utf-8?B?ck51WCtvWHZESWpKdWdibkdnY2lmN1FzRmRQUmdtOVQ3ZnhhY3RKazFueUNG?=
 =?utf-8?B?bmVYZllyQTBOekhIMzdZSTZ3WEZyUzRTZ1EvU0d0bHlVRzAxTjFWMWNkdlll?=
 =?utf-8?B?S01vNVV6bHI2NFRYQ2taRFF3QitMZ2wxR3Y4d2FvSWtBcFg0OXJpZXZrbmxB?=
 =?utf-8?B?QUxpZWlYeUhNcVRHb3RkVTgwY1poTGRYdHhlYytIa09zcERFblZLbFFuekIr?=
 =?utf-8?B?c2lHZWE0U2cyTFRhdWY5OTZVRWNjNFJjYUtxVXpUUDRaVUltMkxLSzdXNHln?=
 =?utf-8?B?WFpwUlhqYUpzbk5NeTJBU0h0NWtySjJ0RGdwYXE0VnQ3UmlBOG5jQ2kvUmo5?=
 =?utf-8?B?OW9oSm94emlENzducEVWTjVYN0lBdlZ2TFNGUjVvNlF2WkNKdi81YnFaUzhr?=
 =?utf-8?B?UTc1NzVxV3l4VXJDNWFhZjVjOW5BQkFaVTdFRktiUXlobVlhY2tYODYxSXA0?=
 =?utf-8?B?T3VLOUdMcnZpOWRuSWpmL0ttREhHT0krSW9obG1UY2RHcHRPK1plVDhIcW16?=
 =?utf-8?B?L3VXeXM5ZWJBclRCZWIvY2N5cTF3TlMxc3pUcjZiUG9CbENIWUVDbkprNWlM?=
 =?utf-8?B?UGJRTUpIdGJabUNUUGlvNFNHMzZNYTVtZUo1bmgzY09rVXNnOTRYSEhkVkNZ?=
 =?utf-8?B?cXVkZEkzdHh4KzlCTnZHcmhRWU9VZU5HSkduUDZFTzhQeFpndmdqWGVqT2dm?=
 =?utf-8?B?UHFNZStyaWpCU3liWGJMU3l0S0NJdE5YYXV5bFlCT1dNaXNwNVhTQ3NDV3JK?=
 =?utf-8?B?VGxxcU1ZTzQ0dXNGdUlsV3o3Y0F0cU5OTngyZUlXL0dPRXpnMllSMTNlQzF5?=
 =?utf-8?Q?zkxB782FLEpNkwMZUP4LjAv0yHnGwwIdqjGKaLq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Unc3VFFjMjNSL0UxdDN2MTFmajFCNVFwblpwbWlQVVV2VHFpYmpuWnhpeDBL?=
 =?utf-8?B?TDFXdndEM0xaQVp1eDlaWXhsZFVjTlhXc1NmTVVvWVpNNnBtR3pUNjRMNmdp?=
 =?utf-8?B?K0h1MkR4VnJXeWZtS3BtQmVONzgrMjZ0ckZSVVBweGQydDcrbTN2YytUVXl5?=
 =?utf-8?B?aHVHNXJiSHE2TlZoRk9hNjJIdVFKRm95Ykd3SFViL0RjV0d1VmFzUEZ1Mmtn?=
 =?utf-8?B?YndCck14NzhRWlJXQmVoRldDbm5hWDErajgzWkFNcWQ5eENQM1JJUlRhUUJm?=
 =?utf-8?B?bGpnbjhUTmtYZk5oU2VuVE5JeXQyeHNsRUNoZGFIcWkranBrMmozTHZGTVJY?=
 =?utf-8?B?WkZidGdjdkZRdEtqcWM2WXVBTEhpaFVvVWJPU1ZTbit5U2lQL1lUYlNubm1L?=
 =?utf-8?B?eHp3d0txTy9YTWoxVS9BYjllSk95M1pzampsbkxZQ0ozNFdoTEFLbGJvUUs5?=
 =?utf-8?B?Rkwxa0FQNmNKS042RGo2ZmdINzNIQ0hMenhWZ2NLK294cWhuZnZEaEI0MGxR?=
 =?utf-8?B?elI5aGJEZGE0dkRIUkowNng1L2tWSEdUbllEa3lZNzlWSG5xRVJvVmxsR0N4?=
 =?utf-8?B?TXhyZzM3UUlCc2dIVWxacm5GblQ5V2YyY3h0Y3ZPRzBOMkJHaHNpSjZkQ1FR?=
 =?utf-8?B?dUxpeFpOZGd5N0dTM0hyd2V4RzB5RGVvSE82UDg1L0p0RlBDMEd6Nlc3QW9l?=
 =?utf-8?B?cXVWT3NlSTdGb1EwNytPL2s1bGFvU1lzWVd0MUdrTmVBaytjSVAxNUliR1Jm?=
 =?utf-8?B?NVVnV2pKQ3NGam9QNFFaNHo4WG16blgrTWNSKytLQll2Ylc2cVVpbEhKY1ZH?=
 =?utf-8?B?Mi9BT1ptY1VjcmZMS3ZBaE42Q1BDTkZ2QitmeVZYeU5GVWRGb2FYNjhTYkZC?=
 =?utf-8?B?aHJSd3hRYkpoZWVKSEw3cDdKZ2ZrMS8vTkVKNmhQNUF5QnZaYWN0TndFc256?=
 =?utf-8?B?V1RUTXRnbnJ2dVlxTlhJTExERVQwYVpabnRaTWg3bWlOZk9CT3BWK0ZoZzBM?=
 =?utf-8?B?ZHVIMHZjMWc5Z01SL1duK2lxOU5IQURvNkRubUhQZTJKeU5wTXRPbzV2NVBq?=
 =?utf-8?B?MlErdk1zT3lyQVVhNmtvQlpyN1YybElYd1hJVWhIL1NubVRPektZL1JSazJo?=
 =?utf-8?B?ZVJqcEs2M0hPTUR5L3VkY2xOSlVuc0srdnZEUWlOVWdqZFhyTWxreXRLMEJ0?=
 =?utf-8?B?enN6MlA2WjJCNDVkNnhLRnE4cGxmN3gxakp2QTJHNzYrY2NkV2FQSitXV1RY?=
 =?utf-8?B?UjR3U214QnFOTmZxY2RtWkJTT1d1QlphOE5EQ0RDWUlWVzJkaXJHbkdiVEZq?=
 =?utf-8?B?bXVITTE3YkxyVHY2SFhmalpTaVF5ZnFuQVpTNG9YcTRCSW41dWl5VC96Tkd2?=
 =?utf-8?B?SEZaVjhrMzhscnRnTGNVZm9Gd084Vm03enp5MmZFK0M1R0dzK2N5UXF4aHNN?=
 =?utf-8?B?aWZINzRWeTJ6eENwVjNBTnNFc3Y5TklITGErekpRWWMzWWk4d3lMNXRVN2x6?=
 =?utf-8?B?NmY1akhjZStEQk5rLzZTUDRYZjdlMUkwM2hqWVJUb1ZDaEtlWUlBYko3TERX?=
 =?utf-8?B?dm1YdGdoaFFNbXNEOGxheDU0NVh3bzJDTm51K2tIZGVvZ3VBTFp3cGM1WitR?=
 =?utf-8?B?OU1MdlBNRUVCOVhqZ0ZUd0FiM0ZoNk9qdzNIc3FYaG03UWt5UzJJbG9URFVR?=
 =?utf-8?B?T0tyYVhjaHJvdDR3TllIQXdhRVVxOXdQUVdKbzVSNjZXRzY1SmhzUkhwSklB?=
 =?utf-8?B?YXYvYndoTVB6L1lyZGcwc2V0QUFwVHF0bGdFYkUzNGVBRVcrUEJRWmJHZU1R?=
 =?utf-8?B?WkZZYXNLSFFNWXFaZWhGUDBpRThhb3ArQlJvVjZvU05RUklvZ0FqUFR6ZDJG?=
 =?utf-8?B?aGxEa204UHRKRTdDMFNRMVU2SnV4V0gyU2VjbDlDL21DeE5HYnhtaUtpRzBQ?=
 =?utf-8?B?aUFyUkoyT1RQeWgzTE9RQklmY3Y4YytFSHM3RUE0cEoxTmNtd3ZtejcvWW5L?=
 =?utf-8?B?N1RhRTFBS3A2VlhlbGw4WmVHK1VnUnlMcU45RUNSdndyd28ra3BZYlN6MHRY?=
 =?utf-8?B?UDNTNFB1RGhEei9lVEsrVzdVNXh4UGdhY3B4K3p5OGgrOFkweTBwelpkUURi?=
 =?utf-8?B?anM0ME8wTE9IUlpHU2FHc2gvYkdER0lwVUJ3cUtUU3J0MGttWXZmLzdXR3NL?=
 =?utf-8?Q?hmHgYJfek6Ivm2YZiHPfRRM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbefb209-a11a-4d84-33ce-08dc917f748d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:19:38.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7y8LfkrYULjR9pl4ctxhhk1mNrgGGKGg3ge+PZjAA/NQLF53Gq1e01wYZ4t47N6qQ1wN10sDzKKL52EIhxQ/BcKhRzc9n3irlkG2MUXzog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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

On Thu, Jun 20, 2024 at 01:00:39PM -0700, Ashutosh Dixit wrote:
>Add the following tests:
>	"buffer-fill"
>	"non-zero-reason"
>	"disabled-read-error"
>	"enable-disable"
>	"short-reads"
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 606 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 606 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 46bfd1d16e..50f6d14670 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -1721,6 +1721,591 @@ static void test_invalid_oa_exponent(void)
> 	}
> }
>
>+/**
>+ * SUBTEST: buffer-fill
>+ * Description: Test filling, wraparound and overflow of OA buffer
>+ */
>+static void
>+test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	/* ~5 micro second period */
>+	int oa_exponent = max_oa_exponent_for_period_lte(5000);
>+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	uint64_t fmt = test_set->perf_oa_format;
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	size_t report_size = get_oa_format(fmt).size;
>+	int buf_size = 65536 * report_size;
>+	uint8_t *buf = malloc(buf_size);
>+	int len;
>+	size_t oa_buf_size = MAX_OA_BUF_SIZE;
>+	int n_full_oa_reports = oa_buf_size / report_size;
>+	uint64_t fill_duration = n_full_oa_reports * oa_period;
>+	uint32_t *last_periodic_report = malloc(report_size);
>+	u32 oa_status;
>+
>+	igt_assert(fill_duration < 1000000000);
>+
>+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+        set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	for (int i = 0; i < 5; i++) {
>+		bool overflow_seen;
>+		uint32_t n_periodic_reports;
>+		uint32_t first_timestamp = 0, last_timestamp = 0;
>+
>+		do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_ENABLE, 0);
>+
>+		nanosleep(&(struct timespec){ .tv_sec = 0,
>+					      .tv_nsec = fill_duration * 1.25 },
>+			  NULL);
>+again:
>+		oa_status = 0;
>+		while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
>+			;
>+
>+		if (errno == EIO) {
>+			oa_status = get_stream_status(stream_fd);
>+			igt_debug("oa_status %#x\n", oa_status);
>+			overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
>+			igt_assert_eq(overflow_seen, true);
>+			goto again;
>+		}
>+		igt_assert_neq(len, -1);
>+
>+		do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_DISABLE, 0);
>+
>+		igt_debug("fill_duration = %"PRIu64"ns, oa_exponent = %u\n",
>+			  fill_duration, oa_exponent);
>+
>+		do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_ENABLE, 0);
>+
>+		nanosleep(&(struct timespec){ .tv_sec = 0,
>+					.tv_nsec = fill_duration / 2 },
>+			NULL);
>+
>+		n_periodic_reports = 0;
>+
>+		/* Because of the race condition between notification of new
>+		 * reports and reports landing in memory, we need to rely on
>+		 * timestamps to figure whether we've read enough of them.
>+		 */
>+		while (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2)) {
>+
>+			igt_debug("dts=%u elapsed=%"PRIu64" duration=%"PRIu64"\n",
>+				  last_timestamp - first_timestamp,
>+				  (last_timestamp - first_timestamp) * oa_period,
>+				  fill_duration / 2);
>+again_1:
>+			oa_status = 0;
>+			while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
>+				;
>+			if (errno == EIO) {
>+				oa_status = get_stream_status(stream_fd);
>+				igt_debug("oa_status %#x\n", oa_status);
>+				igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>+				goto again_1;
>+			}
>+			igt_assert_neq(len, -1);
>+
>+			for (int offset = 0; offset < len; offset += report_size) {
>+				uint32_t *report = (void *) (buf + offset);
>+
>+				igt_debug(" > report ts=%"PRIu64""
>+					  " ts_delta_last_periodic=%"PRIu64" is_timer=%i ctx_id=%8x nb_periodic=%u\n",
>+					  oa_timestamp(report, fmt),
>+					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
>+					  oa_report_is_periodic(oa_exponent, report),
>+					  oa_report_get_ctx_id(report),
>+					  n_periodic_reports);
>+
>+				if (first_timestamp == 0)
>+					first_timestamp = oa_timestamp(report, fmt);
>+				last_timestamp = oa_timestamp(report, fmt);
>+
>+				if (oa_report_is_periodic(oa_exponent, report)) {
>+					memcpy(last_periodic_report, report, report_size);
>+					n_periodic_reports++;
>+				}
>+			}
>+		}
>+
>+		do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_DISABLE, 0);
>+
>+		igt_debug("first ts = %u, last ts = %u\n", first_timestamp, last_timestamp);
>+
>+		igt_debug("%f < %zu < %f\n",
>+			  report_size * n_full_oa_reports * 0.45,
>+			  n_periodic_reports * report_size,
>+			  report_size * n_full_oa_reports * 0.55);
>+
>+		igt_assert(n_periodic_reports * report_size >
>+			   report_size * n_full_oa_reports * 0.45);
>+		igt_assert(n_periodic_reports * report_size <
>+			   report_size * n_full_oa_reports * 0.55);
>+	}
>+
>+	free(last_periodic_report);
>+	free(buf);
>+
>+	__perf_close(stream_fd);
>+}
>+
>+/**
>+ * SUBTEST: non-zero-reason
>+ * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
>+ */
>+static void
>+test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	/* ~20 micro second period */
>+	int oa_exponent = max_oa_exponent_for_period_lte(20000);
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	uint64_t fmt = test_set->perf_oa_format;
>+	size_t report_size = get_oa_format(fmt).size;
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	uint32_t buf_size = 3 * 65536 * report_size;
>+	uint8_t *buf = malloc(buf_size);
>+	uint32_t total_len = 0;
>+	const uint32_t *last_report;
>+	int len;
>+	u32 oa_status;
>+
>+	igt_assert(buf);
>+
>+	igt_debug("Ready to read about %u bytes\n", buf_size);
>+
>+	load_helper_init();
>+	load_helper_run(HIGH);
>+
>+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+        set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	while (total_len < buf_size &&
>+	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
>+		(len == -1 && (errno == EINTR || errno == EIO)))) {
>+		if (errno == EIO) {
>+			oa_status = get_stream_status(stream_fd);
>+			igt_debug("oa_status %#x\n", oa_status);
>+			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>+		}
>+		if (len > 0)
>+			total_len += len;
>+	}
>+
>+	__perf_close(stream_fd);
>+
>+	load_helper_stop();
>+	load_helper_fini();
>+
>+	igt_debug("Got %u bytes\n", total_len);
>+
>+	last_report = NULL;
>+	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
>+		const uint32_t *report = (void *) (buf + offset);
>+		uint32_t reason = (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
>+
>+		igt_assert_neq(reason, 0);
>+
>+		if (last_report)
>+			sanity_check_reports(last_report, report, fmt);
>+
>+		last_report = report;
>+	}
>+
>+	free(buf);
>+}
>+
>+/**
>+ * SUBTEST: enable-disable
>+ * Description: Test that OA stream enable/disable works as expected
>+ */
>+static void
>+test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	/* ~5 micro second period */
>+	int oa_exponent = max_oa_exponent_for_period_lte(5000);
>+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	uint64_t fmt = test_set->perf_oa_format;
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	size_t report_size = get_oa_format(fmt).size;
>+	int buf_size = 65536 * report_size;
>+	uint8_t *buf = malloc(buf_size);
>+	size_t oa_buf_size = MAX_OA_BUF_SIZE;
>+	int n_full_oa_reports = oa_buf_size / report_size;
>+	uint64_t fill_duration = n_full_oa_reports * oa_period;
>+	uint32_t *last_periodic_report = malloc(report_size);
>+
>+	load_helper_init();
>+	load_helper_run(HIGH);
>+
>+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+        set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	for (int i = 0; i < 5; i++) {
>+		int len;
>+		uint32_t n_periodic_reports;
>+		uint64_t first_timestamp = 0, last_timestamp = 0;
>+		u32 oa_status;
>+
>+		/* Giving enough time for an overflow might help catch whether
>+		 * the OA unit has been enabled even if the driver might at
>+		 * least avoid copying reports while disabled.
>+		 */
>+		nanosleep(&(struct timespec){ .tv_sec = 0,
>+					      .tv_nsec = fill_duration * 1.25 },
>+			  NULL);
>+
>+		while ((len = read(stream_fd, buf, buf_size)) == -1 &&
>+		       (errno == EINTR || errno == EIO))
>+			;
>+
>+		igt_assert_eq(len, -1);
>+		igt_assert_eq(errno, EINVAL);
>+
>+		do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_ENABLE, 0);
>+
>+		nanosleep(&(struct timespec){ .tv_sec = 0,
>+					      .tv_nsec = fill_duration / 2 },
>+			NULL);
>+
>+		n_periodic_reports = 0;
>+
>+		/* Because of the race condition between notification of new
>+		 * reports and reports landing in memory, we need to rely on
>+		 * timestamps to figure whether we've read enough of them.
>+		 */
>+		while (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2)) {
>+
>+			while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
>+				;
>+			if (errno == EIO) {
>+				oa_status = get_stream_status(stream_fd);
>+				igt_debug("oa_status %#x\n", oa_status);
>+				igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>+				continue;
>+			}
>+			igt_assert_neq(len, -1);
>+
>+			for (int offset = 0; offset < len; offset += report_size) {
>+				uint32_t *report = (void *) (buf + offset);
>+
>+				if (first_timestamp == 0)
>+					first_timestamp = oa_timestamp(report, fmt);
>+				last_timestamp = oa_timestamp(report, fmt);
>+
>+				igt_debug(" > report ts=%"PRIx64""
>+					  " ts_delta_last_periodic=%s%"PRIu64""
>+					  " is_timer=%i ctx_id=0x%8x\n",
>+					  oa_timestamp(report, fmt),
>+					  oa_report_is_periodic(oa_exponent, report) ? " " : "*",
>+					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
>+					  oa_report_is_periodic(oa_exponent, report),
>+					  oa_report_get_ctx_id(report));
>+
>+				if (oa_report_is_periodic(oa_exponent, report)) {
>+					memcpy(last_periodic_report, report, report_size);
>+
>+					/* We want to measure only the periodic reports,
>+					 * ctx-switch might inflate the content of the
>+					 * buffer and skew or measurement.
>+					 */
>+					n_periodic_reports++;
>+				}
>+			}
>+		}
>+
>+		do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_DISABLE, 0);
>+
>+		igt_debug("first ts = %lu, last ts = %lu\n", first_timestamp, last_timestamp);
>+
>+		igt_debug("%f < %zu < %f\n",
>+			  report_size * n_full_oa_reports * 0.45,
>+			  n_periodic_reports * report_size,
>+			  report_size * n_full_oa_reports * 0.55);
>+
>+		igt_assert((n_periodic_reports * report_size) >
>+			   (report_size * n_full_oa_reports * 0.45));
>+		igt_assert((n_periodic_reports * report_size) <
>+			   report_size * n_full_oa_reports * 0.55);
>+
>+
>+		/* It's considered an error to read a stream while it's disabled
>+		 * since it would block indefinitely...
>+		 */
>+		len = read(stream_fd, buf, buf_size);
>+
>+		igt_assert_eq(len, -1);
>+		igt_assert_eq(errno, EINVAL);
>+	}
>+
>+	free(last_periodic_report);
>+	free(buf);
>+
>+	__perf_close(stream_fd);
>+
>+	load_helper_stop();
>+	load_helper_fini();
>+}
>+
>+/**
>+ * SUBTEST: short-reads
>+ * Description: Test behavior for short reads
>+ */
>+static void
>+test_short_reads(void)
>+{
>+	int oa_exponent = max_oa_exponent_for_period_lte(5000);
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	size_t record_size = get_oa_format(default_test_set->perf_oa_format).size;
>+	size_t page_size = sysconf(_SC_PAGE_SIZE);
>+	int zero_fd = open("/dev/zero", O_RDWR|O_CLOEXEC);
>+	uint8_t *pages = mmap(NULL, page_size * 2,
>+			      PROT_READ|PROT_WRITE, MAP_PRIVATE, zero_fd, 0);
>+	u8 *header;
>+	int ret, errnum;
>+	u32 oa_status;
>+
>+	igt_assert_neq(zero_fd, -1);
>+	close(zero_fd);
>+	zero_fd = -1;
>+
>+	igt_assert(pages);
>+
>+	ret = mprotect(pages + page_size, page_size, PROT_NONE);
>+	igt_assert_eq(ret, 0);
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+
>+	nanosleep(&(struct timespec){ .tv_sec = 0, .tv_nsec = 5000000 }, NULL);
>+
>+	/* At this point there should be lots of pending reports to read */
>+
>+	/* A read that can return at least one record should result in a short
>+	 * read not an EFAULT if the buffer is smaller than the requested read
>+	 * size...
>+	 *
>+	 * Expect to see a sample record here, but at least skip over any
>+	 * _RECORD_LOST notifications.
>+	 */
>+	do {
>+		header = (void *)(pages + page_size - record_size);
>+		oa_status = 0;
>+		ret = read(stream_fd, header, page_size);
>+		if (ret < 0 && errno == EIO)
>+			oa_status = get_stream_status(stream_fd);
>+
>+	} while (oa_status & DRM_XE_OASTATUS_REPORT_LOST);
>+
>+	igt_assert_eq(ret, record_size);
>+
>+	/* A read that can't return a single record because it would result
>+	 * in a fault on buffer overrun should result in an EFAULT error...
>+	 *
>+	 * Make sure to weed out all report lost errors before verifying EFAULT.
>+	 */
>+	header = (void *)(pages + page_size - 16);
>+	do {
>+		oa_status = 0;
>+		ret = read(stream_fd, header, page_size);
>+		errnum = errno;
>+		if (ret < 0 && errno == EIO)
>+			oa_status = get_stream_status(stream_fd);
>+		errno = errnum;
>+	} while (oa_status & DRM_XE_OASTATUS_REPORT_LOST);
>+
>+	igt_assert_eq(ret, -1);
>+	igt_assert_eq(errno, EFAULT);
>+
>+	/* A read that can't return a single record because the buffer is too
>+	 * small should result in an ENOSPC error..
>+	 *
>+	 * Again, skip over _RECORD_LOST records (smaller than record_size/2)
>+	 */
>+	do {
>+		header = (void *)(pages + page_size - record_size / 2);
>+		oa_status = 0;
>+		ret = read(stream_fd, header, record_size / 2);
>+		errnum = errno;
>+		if (ret < 0 && errno == EIO)
>+			oa_status = get_stream_status(stream_fd);
>+		errno = errnum;
>+	} while (oa_status & DRM_XE_OASTATUS_REPORT_LOST);
>+
>+	igt_assert_eq(ret, -1);
>+	igt_assert_eq(errno, ENOSPC);
>+
>+	__perf_close(stream_fd);
>+
>+	munmap(pages, page_size * 2);
>+}
>+
>+/**
>+ * SUBTEST: non-sampling-read-error
>+ * Description: Test that a stream without periodic sampling (no exponent) cannot be read
>+ */
>+static void
>+test_non_sampling_read_error(void)
>+{
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* XXX: even without periodic sampling we have to
>+		 * specify at least one sample layout property...
>+		 */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+
>+		/* XXX: no sampling exponent */
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	int ret;
>+	uint8_t buf[1024];
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+        set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	ret = read(stream_fd, buf, sizeof(buf));
>+	igt_assert_eq(ret, -1);
>+	igt_assert_eq(errno, EINVAL);
>+
>+	__perf_close(stream_fd);
>+}
>+
>+/**
>+ * SUBTEST: disabled-read-error
>+ * Description: Test that attempts to read from a stream while it is disable
>+ *		will return EINVAL instead of blocking indefinitely
>+ */
>+static void
>+test_disabled_read_error(void)
>+{
>+	int oa_exponent = 5; /* 5 micro seconds */
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* XXX: even without periodic sampling we have to
>+		 * specify at least one sample layout property...
>+		 */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	uint32_t oa_report0[64];
>+	uint32_t oa_report1[64];
>+	uint32_t buf[128] = { 0 };
>+	int ret;
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+
>+	ret = read(stream_fd, buf, sizeof(buf));
>+	igt_assert_eq(ret, -1);
>+	igt_assert_eq(errno, EINVAL);
>+
>+	__perf_close(stream_fd);
>+
>+	properties[ARRAY_SIZE(properties) - 1] = false; /* Set DISABLED to false */
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+        set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	read_2_oa_reports(default_test_set->perf_oa_format,
>+			  oa_exponent,
>+			  oa_report0,
>+			  oa_report1,
>+			  false); /* not just timer reports */
>+
>+	do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_DISABLE, 0);
>+
>+	ret = read(stream_fd, buf, sizeof(buf));
>+	igt_assert_eq(ret, -1);
>+	igt_assert_eq(errno, EINVAL);
>+
>+	do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_ENABLE, 0);
>+
>+	read_2_oa_reports(default_test_set->perf_oa_format,
>+			  oa_exponent,
>+			  oa_report0,
>+			  oa_report1,
>+			  false); /* not just timer reports */
>+
>+	__perf_close(stream_fd);
>+}
>+
> static unsigned read_xe_module_ref(void)
> {
> 	FILE *fp = fopen("/proc/modules", "r");
>@@ -1948,6 +2533,27 @@ igt_main
> 		__for_one_hwe_in_oag(hwe)
> 			test_oa_exponents(hwe);
>
>+	igt_subtest_with_dynamic("buffer-fill")
>+		__for_one_hwe_in_oag(hwe)
>+			test_buffer_fill(hwe);
>+
>+	igt_subtest_with_dynamic("non-zero-reason") {
>+		__for_one_hwe_in_oag(hwe)
>+			test_non_zero_reason(hwe);
>+	}
>+
>+	igt_subtest("disabled-read-error")
>+		test_disabled_read_error();
>+	igt_subtest("non-sampling-read-error")
>+		test_non_sampling_read_error();
>+
>+	igt_subtest_with_dynamic("enable-disable")
>+		__for_one_hwe_in_oag(hwe)
>+			test_enable_disable(hwe);
>+
>+	igt_subtest("short-reads")
>+		test_short_reads();
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>-- 
>2.41.0
>
