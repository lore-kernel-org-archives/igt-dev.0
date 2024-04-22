Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AA7C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 11:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F82F1129CA;
	Mon, 22 Apr 2024 11:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I86vECRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609F21129C7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713784180; x=1745320180;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GCkdhdJogyP/GNcMiu1zDNHgPLWNYkDX4g9hfD0DeMo=;
 b=I86vECRG8KzycCKT9oj24hbbd6U8KVDCDKuTmcJkJC1Os3mn0mvpybrs
 St3UzgOiyCD8KOY5qx++PTZGERFLc1No2642i+ThOhq0lPYlmA0QWp//V
 uUgrTO/aMFz+6g2xeML6wgRgIABWXEe+7lzjpeie0pbK1iRrReQX8TGzh
 Yv2gUipdZuyVG+VkVgaP78wlTP11NgNsXlwcmZbs3n6pVnsY1MN9dnbyu
 dxRVQDVdtz3IdAjqlARL21WT2ykZdQ2K+DNcgAXGt7IJOhI83KHzoRHCh
 KIEluprMom8Jnlbtcp22TeE0iNye8KSJ3/6Z+5ZIpAg8Otmf+zR85eVZf Q==;
X-CSE-ConnectionGUID: RD28UimQSZqV6/kBExx4+A==
X-CSE-MsgGUID: Y+Q9VH7cQqy+HO2FhB+6EA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9180897"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9180897"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 04:09:39 -0700
X-CSE-ConnectionGUID: HXjQ2GdBTj6Q/fejbatYKw==
X-CSE-MsgGUID: 36AbA4RDSrmN9I8l34YtGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="23954572"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 04:09:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 04:09:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 04:09:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 04:09:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 04:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zywh2TOsKURJe1Wadwz7WMAbDSWuU7ls7pagY3UCv2UkvKHuLKqBz4aEM4tvHSKIDHSBN4KmRyTH3DRaiP8OWjZAT045VfEnKoSUvfG6CCWPKy3CTztNECmjxL0zGozL5/gJ9erLRAKrpn/rg4qyZ+wsGtHsxpfDQSAkd5vXTfpPC6W/P8ZM2q3/BeIVLdZa1f/HZLz+kwgPpfYL4lf7u0FDYOrMIRguSdEc6Ee3pad3ASR2hwQ+Ef89uYRyrnzfiWlBy9JN8Iaae0/Hxj+2+UBVW3gYTFrWLL1CRuZgFjfVL7V0JD4VNfdm7th4qhsFlrp8QstcNwKCkhOxk3oevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7bnOxd9YDd9MMiZVJFbMpBjhcp/7+TjZSyqdDGAOQM=;
 b=ZwOKRzaKubgUtC9Q1GvVYCPhLmoajSav+6NWIzaCTs+8okMY9jxbVH+AuiFmCjCkHDoyD9EwpORoOR0ryYve0SXo3Vgz/2c1bHGr52c0/+f6G+V2Bo6xDnJip6SvfAiCJS/5VjpXJDuP8izPO/iBhq1zshDoCkLl69NNT3bIJbhqHjesSaaZ4e92SDdqstvo5XsHonBS2lGjCWNOoM5Xk6OwAGe7FQN2shN865yAIRVM17sSLPk89QnCmQV9PzDEVqlwf0WILIKDHmli55pOq/xIYJIZ5aHUnLwMkaOIfZs+5mlKDVUhWuBzUwcG61Gr2u1NXrznuPFJzcKsjQiA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.20; Mon, 22 Apr 2024 11:09:35 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 11:09:35 +0000
Message-ID: <d2ac0668-fa17-46ca-98c6-5830c14fca93@intel.com>
Date: Mon, 22 Apr 2024 16:39:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/7] tests/intel/kms_big_joiner: use
 kmstest_force_connector_bigjoiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
 <20240422053454.2523989-6-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240422053454.2523989-6-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS0PR11MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a0efa5-d9db-4950-c7a6-08dc62bcb1b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVBPRVl5SGlRTGluYlRtd3d4QnN4VU1MOEZHSGJCSjBGMGRTbXEvcHN0d1hu?=
 =?utf-8?B?UjZxbTdlMDFKK2dJdG45L2lEN0NVS0ptQkVvaXZQT0U3MUlYZkxId1ZFNEgw?=
 =?utf-8?B?em9Ja1l1YmtNeUNTTVpUTDhaM2t4SUYxRTBGZ1ZzZXEwd0dmS0pWWnZBRkJD?=
 =?utf-8?B?Z1VnU203a3h3VVNiYk9hZ1JKVkNWWEkydDFBemxydC9TQ0tTZFd2UDU3QXgr?=
 =?utf-8?B?aXBsU2N5NGpzWXFaNlZmTU4wczBPR0hXbXhuVm9SYXNZLzJ2Q0pKendrSXN3?=
 =?utf-8?B?VDFrWDBRTTBic0FqU1ZDcGx5Nm1SZThHeUdGbmQxMzBueWJCM1BVUTFHSGRn?=
 =?utf-8?B?dTFsVE1VYVBFbXdtZE9XTHhMeUlzd29uS1BmdXB2ZUh4b0J0c0tkcGFFNmpY?=
 =?utf-8?B?TkV5MHd4ZUU0YlVQZW9GdGxNSmhXNFlWK3dxVDdTamllNElya2I3WkhEeWIw?=
 =?utf-8?B?YjNNVjNab1oybytodFJqMTc4RXRXTXlERjkwcEdTbzlGb3pqK0xQRnZoZlU1?=
 =?utf-8?B?WGNmRjhvWXhINm5PR25iV2x2TVNaVFZ5MUZMNy9jZys0Q2VYS1JiekhZU3Vw?=
 =?utf-8?B?Z0IzQ0w1UnVpOGJWR3ZMTmovTFdHMlVKN2ZxM1dNUUREUGdBekdKeDlXcFJK?=
 =?utf-8?B?alFVN3dkWC9ZZ09wQVNHTzBTay9lTDg3aGI0K0t3SHVwMVhpR3ZTR3BzZXRY?=
 =?utf-8?B?bmFQNnp4K09wQndLZFdvK1RkdGttbFlCVTNCbWovUC8zb3JWMlRLdXErTWxS?=
 =?utf-8?B?UityTmVCN1IwN3BQQjB1d0JBelNrcFY1RmlMWkcrWjRNSm9hUVhMcTVna0Yr?=
 =?utf-8?B?R3YxR2xNMlVhNEtsWitxSlpTRVdSc2xXVkJvVXRkdW51Si9OQXdKWWFJcEg4?=
 =?utf-8?B?VVlXZEo5bGxpb1VxV1lWN1A2eGRmWWxNM0dOVE56S211NFJLNG4xQ2FTc3pL?=
 =?utf-8?B?WTdjdmtYOUNwNS9UckU3akR2UGN6VFpCSHZaZlZuRHpjZW96Q1B0SmZmZDFh?=
 =?utf-8?B?TW1xTU4rTCtwUUQ3WVRMWEExNk1YOHZJejVIanFLZE5lTDR1bEEvZVZ2SlBq?=
 =?utf-8?B?MEtucnRhMXFGWnljWnVYQjh1aFd1MmhEOTMrRHRxNkFNZDE0SjRHbmxQU01i?=
 =?utf-8?B?TmZaaGRXVVZzeFR1dWJMZ2xRT2Z2T05aZTE0bVJseWRPRUVBNERpeXZlZkV2?=
 =?utf-8?B?L3hhMU1rYVAwQzlmdE11WXVhSWwzazlYTnNFSzFyNlpqNi9neWFpeDVGSms5?=
 =?utf-8?B?dkxwSEtlaGMxdStSOEdFR2ladis3MHIzYnpCaG9mZFp2YmtEUVhDRWl1VW5R?=
 =?utf-8?B?dFJFRkNtL3d5RDFaVFdQTXlpdFo1WGZhRnRIWHJVeCtuMVpVYTh6SGd4VVdy?=
 =?utf-8?B?bUMxYkFDa093UGZoZ1BJUTlzUnJtZWtwbkNsYTZDdUpyM09rRzFaL3hxWURs?=
 =?utf-8?B?Ny8xQ3VVNjhHM1ZqcW1XS3B0alpDUkJ6bHdvWThFWXQzcHhqSUtySTV6MU1o?=
 =?utf-8?B?WkJxZmtvVkxXNDFyKzUxd3dnMnc0dHBBWHFrSEl4OGNUYlRLMnBaMktMMXpL?=
 =?utf-8?B?b2ZWelJCK3lYVW9HbWVVbkhkNEdKbGZFVk40cm5WcmNpN2l5ZWpVRHc2RHBX?=
 =?utf-8?B?Tk8zYW1vcnVmOUQxSHloTkxkd012S0xKaWMzNUNOYTFTbkhNbDRQS0xNa1Jx?=
 =?utf-8?B?Q1V3Q3ZyWXNjazZxWXdSREMzNSt6RzNrd0cwbUUzN3l5RWdhUFJlVWxBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTFjTkxzU09VbHBBZ01lczc3M05CUnhxRUEvZDFsSVRISndIR2kyYkJpNzRk?=
 =?utf-8?B?dDJPTFlKR1Fka0liZ05YL0VSU2s1RHd1dkVtY0Y4L04wOXZKcXo2NkRMa2Jn?=
 =?utf-8?B?NGlwZi93YkdBTUFkOUpTbmF6ZVJPNFh0M0RjYlk2bFJYdlMxQVhOaGpDcU9E?=
 =?utf-8?B?WHBXQ3d0VVo3bkxqMUhBVnlXbFhENTJIU0dlK0gwK3JZdFcwK0VFTFExVDYv?=
 =?utf-8?B?aUR3ckhiQXZSUXNxamlucGhRQWkvVmlxQkY4MFRhRFIrbW4yQit5V0Jac0hL?=
 =?utf-8?B?c0pDalcvdEJVYktmNmhnSEV2a2FrNWQ3Q2xoWFo0SUIvWVh0dGJBV0pwNytK?=
 =?utf-8?B?RlJHdzBRMnk3UENxOUc5NisxVTRBSEJmeVFMNmN0QXNjRW91MjJ4S0NYYXJt?=
 =?utf-8?B?ZnF5TEdIbzB0SEtyQVI0MjRYTFFFOW9GbXd5eDQxSjd1Zy9EbW9oTFYvM3RC?=
 =?utf-8?B?TmpHUVhNYkNPNE80VmlRWVkxSU0yZGUxTTVnTFZ4dVpLc2ZJc2piWHpIbVF6?=
 =?utf-8?B?WU1vRjVQSTFucU0zNkhTKy91QkN1Zzg3SW5sTWJsOUdjVDZ5cVhleUFZcmQv?=
 =?utf-8?B?Ynk4TjRKQlJneU14cmxiZnR0ZE1LVVFad0FwZ2p0TjU5NmFHbEZnU29oRlMx?=
 =?utf-8?B?NWlFbDVrSDZqYmszME5JREVVaUhFOU83VzdkS0QyZFJMb1dxblQvam92S2dU?=
 =?utf-8?B?b3Q2QWRrTVNraElYSWVDOFdHSERvNmc1Rzd1YVZEQXBnRUoyWjJITnpiTTVB?=
 =?utf-8?B?NllFQTM3M3o3RWNrUzNzM0lNNnorbW9NRGlUYStSQ0ZIT1ViQXBnOFRwUmxh?=
 =?utf-8?B?a0dZSTFCaGNHdm1hKzUrMExkRFQ2NS8yMzUxcytOMytuSWNWZ0FrT1dYNTJU?=
 =?utf-8?B?N3BOelRHRVFseGJ5TnkrbzVKWVA4ckxxRDREWjdFdEYybThIdThIUUFkYmVq?=
 =?utf-8?B?dnZhQVpPVDV1WEI3cURGWXRTYlQ0RExESlEvTW00MTNUZU9XM21uUUJSL1hB?=
 =?utf-8?B?S2xqbzVGczk0ckF6UVlRNVlRQStHMkRQYmZUWEtTellncGdBOEhXSzZmaFNq?=
 =?utf-8?B?Q1pFUUltbzM1azBlQWxKbElFMXJRSG5hdXc3WDhnVlZaWW00TWk4M3Z4MDJm?=
 =?utf-8?B?VGRIVlgvdys3aDRwTHBoT1NiZDg2eUMxcVFjWFJTZ2oxRnJSWm04dWVvK2w0?=
 =?utf-8?B?cWx2dld1Q1kxTkdCNUFJa0tUL1pLTzdxN1dvWXU2Y1pEdVZ0N3RheDRKeUU3?=
 =?utf-8?B?bkh2d2F5aUV6SHF2QlFzQ0g0RiswVElreURqSTVyY1ZiM0RoNU93ckVnM1pC?=
 =?utf-8?B?RHZ3aFJGMVFCWUV0YWs3dXJIWTdFZVZ2RU1CMVVnaFQ4Nk9ZM3B0ZENiTmNr?=
 =?utf-8?B?NjRveFBMMXR6S0JwUHMxUzM2QkF2WTNHdXA3clA2QlRDUDhQZXV5cHh2bDFE?=
 =?utf-8?B?S1IvRkkyYkVxNm1iSzl0UEE2L3pMbmVjUVlUK0hUQldjc2J0bXlCd2wwdG5P?=
 =?utf-8?B?VWd4V3RFbjZyN3N3ekJ2c0UyQUljWllxN3pFdlFnVFhxR2ZFa0RqaEV6QW1K?=
 =?utf-8?B?V0Y3V1o4aW5USXdkVGkvY2l4SDFTb1dzRTFoVWFPeDNoZlR1bWFKckVHc2dB?=
 =?utf-8?B?NEl0enA1YWoxelppaFBWSUNhcktPZWpIQlhVMnBvOUpMeVljSjJZOEUvWDNu?=
 =?utf-8?B?VXJyNUJsU2JjMHNkTFIyKzlRc1IzeHNoWTBEVU9YMG96aGNGV2ZKSlVOQ3cx?=
 =?utf-8?B?NFZjNFViNnZKUURTbWNMNFpNNEw0cEs3VnM2YU9vWFdmUWhISVpSOGZ6cTcw?=
 =?utf-8?B?TUwxdE5rdGd4bnBNVWVjWjhrSzVlQi9kbmJHeVV2TGZ3Zm5SWk9wenJjbEov?=
 =?utf-8?B?WjJJTitvSVp5c2ZsNHRSMlJaSGlGK3VwWG8rRHJJSGxjaDJlK3ZjZzl1WHNi?=
 =?utf-8?B?YmRzS3pUTldwNzVsNW15ZVNlNUlud3A3U1VsRUQwcUEwZkQzQVRIWkJXTUJL?=
 =?utf-8?B?TzhnQ1dEQ1RiMUNRSkovNDRNeHBvYmF0Yk9tUE5LdU55Nm9NY2dWTEVpSUR2?=
 =?utf-8?B?T2pJM2tuOGlZRm9NSnBaeUFHd1BxL2N4Z1JPWkdRRUpDVE9nTVNidzlkZytB?=
 =?utf-8?B?ZXpyMWNXNVhqMXVyMkt2V0htSmhEU05tQlpKcFBHMVJZWVVkeEFKa3Ava2F2?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a0efa5-d9db-4950-c7a6-08dc62bcb1b8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 11:09:35.5768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+5NDiG3nC1IZ/R2EaYtFmR9RWy7qGxSl0qU+65xGmXxOiz2k++uQYUcdbE/bShxyAvtBV+rPYAG/X26AJk1jYnY588s5JA2P9Ai30hT7/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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


On 22-04-2024 11:04 am, Kunal Joshi wrote:
> use kmstest_force_connector_bigjoiner instead of
> kmstest_force_connector_bigjoiner

Use X instead of X? Please fix this commit message.

> 
> v2: use igt_reset_connectors (Bhanu)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index f325a9839..4979cac06 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -87,7 +87,7 @@ static void set_all_master_pipes_for_platform(data_t *data)
>   	}
>   }
>   
> -static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool toggle)
> +static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>   {
>   	bool status;
>   	igt_output_t *output;
> @@ -95,7 +95,7 @@ static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool
>   
>   	for (i = 0; i < data->non_big_joiner_output_count; i++) {
>   		output = data->non_big_joiner_output[i];
> -		status = igt_force_and_check_bigjoiner_status(data->drm_fd, output->name, toggle);
> +		status = kmstest_force_connector_bigjoiner(data->drm_fd, output->config.connector);
>   		igt_assert_f(status, "Failed to toggle force joiner\n");

It would be helpful if you add a connector info here.
Ex: Failed to force the joiner on eDP-1

With above changes, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>   	}
>   }
> @@ -383,15 +383,15 @@ igt_main
>   		igt_require_f(data.n_pipes > 1,
>   			      "Minimum 2 pipes required\n");
>   		igt_dynamic_f("single") {
> -			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>   			test_single_joiner(&data, data.non_big_joiner_output_count, true);
> -			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			igt_reset_connectors();
>   		}
>   		if (data.non_big_joiner_output_count > 1) {
>   			igt_dynamic_f("multi") {
> -				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>   				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
> -				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +				igt_reset_connectors();
>   			}
>   		}
>   	}
> @@ -405,16 +405,16 @@ igt_main
>   			      "Minimum of 2 pipes are required\n");
>   		if (data.non_big_joiner_output_count >= 1) {
>   			igt_dynamic_f("big_joiner_on_last_pipe") {
> -				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>   				test_joiner_on_last_pipe(&data, true);
> -				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +				igt_reset_connectors();
>   			}
>   		}
>   		if (data.non_big_joiner_output_count > 1) {
>   			igt_dynamic_f("invalid_combinations") {
> -				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>   				test_invalid_modeset_two_joiner(&data, false, true);
> -				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +				igt_reset_connectors();
>   			}
>   		}
>   	}
> @@ -422,5 +422,6 @@ igt_main
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
> +		igt_reset_connectors();
>   	}
>   }
