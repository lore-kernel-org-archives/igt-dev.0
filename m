Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DDEC5DF71
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 08:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A3510ED32;
	Tue,  2 Jun 2026 08:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABIR+xPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125A410ED31
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 08:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780387461; x=1811923461;
 h=content-transfer-encoding:date:message-id:from:to:cc:
 subject:references:in-reply-to:mime-version;
 bh=Bst3Uuse0VY8/4DD5S9rfUgyoAf9tMQaASEyCE86Du8=;
 b=ABIR+xPjY1LPQflpvY87YoLZWyFIOyArnTsyxfkj/1vZoPZvDjW9nTuf
 A66oi2/MQkvtmgNiKO2F6xiwgkd2kSw17eH6TczvKAtWs3WDTPfl5cBk9
 rpoapIy4+IxxiD9RFdeupE3dHefX6cKaSWONpDlTj7ncQOH2gBwF1hF41
 BptNkNBImRg8WpEM04ET2xR2+XAXHntULyg+rtlQif68Sq+iCOhTX1fdT
 4lZUsh/PDnmZcoMfa4NnbwI4uAMRL+85Arl5r+ubJ9bjPn3Q3t6JGlpxw
 QdHr0XbrGWiJWYLnDJQlz3446CIltOBUJafCxawBOn2vF+b757JeB2RMS w==;
X-CSE-ConnectionGUID: 5K0eRYlGQuuryDd7dhDvYw==
X-CSE-MsgGUID: igNfNo7XQiSFhehx5Bl5cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92548610"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="92548610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:04:20 -0700
X-CSE-ConnectionGUID: INY+vNjPQsCagcgRegJBNw==
X-CSE-MsgGUID: WY4mcfbVQKKIg4OX3z7NtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="274101981"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:04:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 01:04:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 01:04:19 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.41)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 01:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiQc21EFWUfnIjF05QOeDrO+OwHy2XqZZFoY+JU5KrVwyk1JwWkH/M1Xu9JaJXQS1D1zRlQAgll2U34mP1u86Pu8ho9woIXIoMvQOTtO3WaNcz/es+Fu6+gxOhyaCADrHrm/eC5t7DZMC8ga95/oXGupt4GXC3GKilCc/qaj/CydZCfpajZTOqLzkjlMiOMKER7v3Xbp6E8S3e31pVcs4d9919+xqHOi5terFrgF9dAOlJm7XxLDX91/WxdeoRxcjbrHAAr6qVXv1hT594PF6Gn55ZY5zlJx1q/9poVDO8SCFZLxo/yYwbaCo8lTO8aKkoR3QDstgmQ9m5sGqERl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bst3Uuse0VY8/4DD5S9rfUgyoAf9tMQaASEyCE86Du8=;
 b=uBcgN2N2z5oXNtCS30K89TpBHolfqjG1sReBDUUH7hLDgHkksb4Kq5JCyEhcuSyY+MAsYku5WFEDhAHQpYDEgTWES4pHPT0jYhkLj0BtcYWymnjc1Tx10k4bHoqrpZZ3Tyml813TurG+4ctdexVP/UTwI1nh11CJeJawmWmR8PddeYOx8F7HewDDz9mOYCUcTzpNm0X83aF/2FfAhQJo9A5MNkb9uUCx4dUFLbFT6P8xshcWjOYVVjmOgFZO3jFuvqtjvZyU2OAZeCxYoangP+K9wHH/YPKQi9hgXxZnoCZes0+VHCS5G56fkAp3Ak7jSPc+wm14JlV7cdH7ltKILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by DSWPR11MB9932.namprd11.prod.outlook.com (2603:10b6:8:3b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 08:04:15 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 08:04:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 2 Jun 2026 10:04:18 +0200
Message-ID: <DIYEOJFQNXKY.1O5SWNM49WSKF@intel.com>
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t] runner: Avoid compilation failure on c17 and earlier
X-Mailer: aerc 0.21.0
References: <20260602073220.1067144-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260602073220.1067144-2-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: DU2PR04CA0209.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::34) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|DSWPR11MB9932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec66b90-04bd-4c5f-fe52-08dec07d8a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: l7ys6rJWXp4GrIaC3lHO962KPGFqccFMDQAn6QOUloyJhRFWjJwSzLGE3qJ0I0BH19T49HspU/ENXkttA7WyYnfZf382QzMll5+Vwh9x0vosxWsnh9IhCObcwqxTEs8BeB2fY0X3kMgM5VP7tlt5zjoLSbWuUweMEiV2trL8sx+HxI+RhzQRK/rx4X6ZZBYl2YaDdInistqSRkuJfBcTcZYi3b5LQBjrLCM2shZhNcaWXCaW6nbWJeQiUDPcffliCYGeoI7bhGpX/MQ4Epfyys+Eho8OjQha7krijv6ZoGHRi2+9eNUIc1Y48hn1qur3kec8Pgmc1yUYxgiFf/B60Hq/T5VnKU2DwTBch/siYVJGQZNGrPIRmIqkueUASo88j2Jzy3gqdBiyVXiSwPxXDKcGrH2I1UTlTC2D4fd6h/NnuP90vBpw58B1nYqjIRQXiFEmoC9NjJK3xCdQRUDU/YkhK0w7sm3EAY4aBMVm7lQrYHFdqBBH6WMSbdPs+v+SV57qP+ghGE9jSEqQbwXP5YXu7LayfRG7d76bnMPqoajVpTo24rOuRCRjLt0bnq+ZcpxUMOCT07FpMK1XVyhhBtH+uyTSiR4fYSjx+HobX6lTx2HKkFc3/foe7vLchCr4xCsxB/ui+HUFeCfGBi9CX60dy+iAn9DXAr2Aav8OZv1KuH8yyH15kvJaRQcbMcRg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmVZWVZTeVJWeVNmTjVvcmFIQ0Q4L01kclYrZHhPZzIzdWJCNG9aaHl2QzF0?=
 =?utf-8?B?ZHRCSHl3ZXg5Z2Vva2t3bFJlanVYUk9IbUsxMjdhcmdwTkRmM1JOL0RYSWkv?=
 =?utf-8?B?bjlVRW9lSDAwR2lWUHFpWXkzVklZNGwyNWNpWXJ3ZHNQMDcwbVBWYkNxTnlJ?=
 =?utf-8?B?L3NNaVFGUnlKWlNMeTVBTFlzU1VwNjZDdGpZSmo5eVc3SkxrcTJ3ZzJ0Mm5J?=
 =?utf-8?B?cS9QZkF1MkdJKzJrUU1DYlA5b2NCQmRhTFlNTlhKa2FXc09yN2Z6UEtUZDhN?=
 =?utf-8?B?S2EyUTNrSjNSZDdoRStvbno4V3E4RVh3dGVaOVJMVUgyUkk3dE5VYTN1VnMw?=
 =?utf-8?B?M1Y3NUw5SzcybTgxZUJ2Vk5veXUrN1V0eWg5Mlc0UjJZd1lEU0c2ZTlKZWMr?=
 =?utf-8?B?VmZrMHNjbVBWWC9ZODRzTkFxSktTWjhjVFZCd05TTXdUQ2ZKNmxXREsxS2xv?=
 =?utf-8?B?RmJkdHE1ZmZyamlxRHl3TnBxR1doNnlsTmdnT1V6UXJhTHhCaXpoVGxOamFN?=
 =?utf-8?B?WHJuTnVtc3Bic0RuSmM5dFkvLzVaREkyS29ya3lBaG9oTUdKNG5YVE9EbDhm?=
 =?utf-8?B?dHBFenpIcGRzNGlPQmJXNVlPcjdldThhMFJ2aTNHR2JPWWhwT0NIcDZuTkM1?=
 =?utf-8?B?Z0krOTgwU1J1N254OGhSVnpZYjRpS0Q0alY2UzA1VlFxKy96UHZ4TGw5V05q?=
 =?utf-8?B?eEtUTHRua2xwVUtCa3cza3BoMFk4OG5BZjU2ME1UZ0NqZWdjSTVFeHVneUg5?=
 =?utf-8?B?K01aZHFDZUo4MjZqbVZNclVvamNydW1WbmJQUWNYZXloSkxTQ1lvckFGTjc2?=
 =?utf-8?B?WG0yUzZ5aDB6d2ZXWEVmS09RdWtYUmpnc2phSlNTWHRKSHE1U0doRjNFQWN3?=
 =?utf-8?B?ZHlVdmhhcW0valZ1TC9KeWZsSTNiNGFRYysydzVvNjFIWStFenZRc3czS3U1?=
 =?utf-8?B?ZnZkUVFMdHJqd0hiNVYzZkcwcXhnR0ZHY1F0VE1yb2NmekhOY1ROK3V4TlBF?=
 =?utf-8?B?Zzk4QXR5Sk5KcExCNjVRdkVnS2NyL2JYczJCVUZMU3dCdjR6dWhpRTMxRDIw?=
 =?utf-8?B?aWVVK3hTRWIwQ2dtQWRRRFhWSklkTk9KTlRIb3VRWGhWZUNhVGFnQ1MrZ1li?=
 =?utf-8?B?RlZkQ2lOcVFVMWx4TjJtR1F6b3V2MFJkUHdWTHFVUkhjNmt6Z2NKY29aVXNB?=
 =?utf-8?B?RkNWQTA5VGIzUHNxSTBNZVBkZ3RZMGZsZkl5T2xWVkkxRzROenJqOFNJN3pP?=
 =?utf-8?B?WGFzWmFSd3BHdjRndEpQVVFKa213VnZJUjRhcW51eWFmYzhMWTQ2ZWkzQnhU?=
 =?utf-8?B?elp3ai9pSjB0aE1USnZ4UUNYMlRPcmtaYmpDWm1qTkRjdXZldDIvSzFZS29V?=
 =?utf-8?B?c1k5NzFxa0NicjZTUkg5QXdQYm9KRWNuVHd3TFArYXhwMlhzeE84UENTQlVY?=
 =?utf-8?B?bkpkVndvWUZ6OXBrZXphbStwLy9SZVBkK2NzMzVWRGNNeEVjNldrNFhzejVD?=
 =?utf-8?B?emxFK0lmYlM5cnVyU3dnUlpaY2xiNDF6Uy9ZQW5lNm13dTVrR2xXZnhmKyta?=
 =?utf-8?B?b3FRSmhURXViUk9SYTlCblczTnJmQmtzSmpRbzNmc2NoZEF1eXhtL2t2SEVr?=
 =?utf-8?B?OUdxaGRld0xxL2JOalJlLzdNclhvbUhLQUJPSERuL3Y2dUx2SXlTKzlLcGMr?=
 =?utf-8?B?NGZTNDVsUVJFTGN0SnR1V04vYzBFVm9Ja3VSSjdwL3QwcGRYN1d2cUgwYUlR?=
 =?utf-8?B?OEZZa2J4U2M4cU0zZ0RFTlpmQk95a3BHZXdQOE12T1drRWMraEZRbXRuMmx0?=
 =?utf-8?B?a3JzRlBiUXZQLzFVZkVpRVk0cEp4OGhpSlVzaGd5NHdtaFhPL2NaWVJXWWE5?=
 =?utf-8?B?dVpIL2hUUUVDTHh1enFLRmZwRWRjU2xINEpDL1BDNnlHZkFHekdQNnkwdXhF?=
 =?utf-8?B?UFB3ZkRUeDN1TnN0V1ZqQ3pPQXpkRlRJbGcxN0lBVS9BWVNwdG1RbThyNzJ6?=
 =?utf-8?B?YzlUMmRSU05nUjlyVUtmRzhyYlZSek5FVm1ITmNsNkxyblVkQ1hpWW41NEpW?=
 =?utf-8?B?cHpVZjB5V0Rya0l6eU9oMVo5cFNxcHpDWG1FNkYwWmVHd1ZyWHY1cHUvS1hR?=
 =?utf-8?B?dnA3WEdjRVgrOXE0UDkrYVo4Z0dIZmZLRXlZZjZ3VGtGSVFaV1pabjhXTExz?=
 =?utf-8?B?VXIyZTE1VjQ0NXNFN2t3NzltVXI2MGlEN2dtR1FwV2RyNWhWSUFNZ3MxQWg4?=
 =?utf-8?B?b2hZRkZKc0oyY0I5blNza3dCbDBFWmIwdzUxNUQzTk4zVXZxa1lMZjlpbzdQ?=
 =?utf-8?B?S2pRaksyY3ZvOG9tM1NRb0x1VEdQVFFUZW0xeitNY2tGYnpCMm1VTWdzWDlk?=
 =?utf-8?Q?8s8LzBKatYhT7AQY=3D?=
X-Exchange-RoutingPolicyChecked: HV8yfDfT84Nu7D3mq0x95EJmvAC9oB+LUbIrjBhbYZJ6TubbDaP0/wFIIiPFqL5Mcn51zNCuDldzWh1PR5T9mkbs1pyZ2r3jte2S1jqD+Sk+YIF2xDUKGTHMGHJGZDmmZDfgwpmd08yh2VoYsj35/E2sdjrGPJpqcYExz5umDcp3J0bzMyQNEEoN4VB8PkJ0k7r1VpQM2mmUQoApYO9Keyp1EJMvN774FARkGU4aThCy2qeDsg0oP4PaECx7HhprlSbI8+pBAXrq/UYmiY5cBeX+Fid+c9OzVr1uiEQ9lOnQsqj2DvDCFuXzVcdfircLOaUU2otU/nbonAB76ZM/rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec66b90-04bd-4c5f-fe52-08dec07d8a06
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:04:15.4671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGP6GwFr16zHNxUsp1XG+GR4/0U9ZK1rAFjc02G7CHCLNte0rso7vDaXSdYVMs4fZ1N6P/Pct9Yk8ahMO06HksSU7Ywe2JZk0OTFGJoMDVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9932
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

Hi Zbigniew,

On Tue Jun 2, 2026 at 9:32 AM CEST, Zbigniew Kempczy=C5=84ski wrote:
> Older compilers don't allow to define variables within switch/goto.
> Move these definition to avoid compilation break.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

