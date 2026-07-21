Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F25C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 06:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30BC10E29F;
	Tue, 21 Jul 2026 06:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZMZA8EI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CD410E29F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 06:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784614430; x=1816150430;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MbDKGgM4v0/hozoA1FFdgohqH3ESXzcARX6wPBn9FBA=;
 b=nZMZA8EIX60DMtniMzK68LtT1o8UhJkH7rHhAe93X4TXUqmnqVbgUc+W
 Us+3PtG4ekb8qrpveNH7vJRcbGiCLTdBHPWBZiRM6VYUFPNigr/kqfwoq
 riNRx3U3YPC4aKndx2/M22kHuxO63McVpSWWqTNtKpuPvIrZ9Erv2Uhib
 AVquyv4uGBD00UoFV9nGDWGDisCcRdOdzFG5G7JGaooFVSBR4G4yUjVzK
 v5kIUPteu3f2YH+LbphzaUxyVQkn9LPYGLPOGF+39oABhPFwR5ILTptwv
 KhK5CIlggRKJoWc9wyQ/gXCRUWvCygCPrQCKk3+qEAOhl/m+o7kgKNpLy Q==;
X-CSE-ConnectionGUID: Z+tYzP8dRemMRQ8JPkp6Ew==
X-CSE-MsgGUID: iQNPcBRMRYiZwNLwAwYjqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="102752415"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="102752415"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 23:13:50 -0700
X-CSE-ConnectionGUID: gs9oYspKTuiDmoOE8FKbCw==
X-CSE-MsgGUID: +l4D30xgRsWS5RdKvmF+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="255874722"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 23:13:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 23:13:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 23:13:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.15)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 23:13:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScO9oMnDeFkuH1lZmjoAIb8fI65Z0m9rtIte/LHfCgjy3ZXjwSoj9tW27orxqDU4Il3fZTmKFsii/bvX8IHk1wae6kvNU1JKCVN3BGx4ByeR7oBkWOnanMbvbFgrj4R6BQSwUSbJOcEAFrGcgR4swdGrjB+x1V7rdZDN7ZL22Tg20VQnCrrllTeK6QLzIIGzpRJOrGa50CpMiQJPFWZfGFztqcSWEYpqXd09EWzwQzIycRUdaNnFTTZdD66pXTrsEdRacqFxUbd89ZVw1kHSUI7eYhZzpuppnFzjQn7bvxIzMisIU5ytGgfG3sXx/ss/fZdGHMERyzHzXphfFT+CVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk9LcF7PJ4Rp80gUvQyfKFT1q2Ddz0PKMyQ29XuulJY=;
 b=hXyTQLRHNvFTioP71+6KUiZTaurP8rA45PeT0WAZJ0wk9A5iKM5XUnI6yhsFF7YX/U6ESCMtp60I/ByVc796CjI7sieWweoUh/lOotNbld71vD54VL0uK5X+zuRanZUcF9OBvVNqZax4EjUH55/k2Ngr/GopLfc/jUQVjk4wf+NPFqPK8L+59oVqiPinPu9+dcuIOjmeqIEQG6CJyeQFsytv8kPtLbt5q6AU1hhApIZgUJIbKfUd1lFGAzqkKUr0NrllxQLTzLORBXdEWp1M0bn1JqSBVrsDKCGQmoR6MKmQfRDgTag1rzXMPMvTnKH/dC88wz333IqdU8wB3O6i+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:13:46 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 06:13:46 +0000
Date: Tue, 21 Jul 2026 06:13:35 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 23/31] tools/intel_forcewaked: link with minimal
 sub-libraries
Message-ID: <do7h3ozghjlnopvm6ai577xc7sgvmevojr36ditqv64tmpajkx@gkgeacxy2p6f>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <6c25941170913726ed4b4ec4296e16127cea751d.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6c25941170913726ed4b4ec4296e16127cea751d.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::7)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 157e9be3-45a9-400d-d088-08dee6ef3905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: Cptcfz3MGs5XMUN0iJpml0My4NV0SeELWcdV30DF01up2o1TeuDn3In15Tl9XlYkJNGPdbCei0Zj+oILchU+4LmjweS4pPKFVtgofdZq34h0U6lQ03Wrlmu7GmeSqCpzkaUNE5TSwgYqgZ3IC6ht9T1whWtXAcdZwRQpQopnUmYE6Ms4WEPzGigtDi7Zc7nWPEGxOPaGKIJRHWQOSR3EEUIEO/fqueT3QaBY825QisdBnhmysh46r0Wn8m1sBsYFnmv05GMfiZHOrIATYHlY7UpWbHrCCE6VZBJR43rI3EW767jvRuCvRmRwWROKgVfZS24G0O28hNcVE16qtLZ+asnn3Qzls3Kiv1yuqtqwqg6RErtpzkooPgm437tJFGKCSc01rUZRYGixVfwbB7uYHkcs+zr21i4HR+erXZj/+SP7IQpbn5nlnWMew1zwC74m7pZkLOSF/41hkv5gind2XyJEgK2JSfoK+oFS2VWYhhb5YZdo65qhL4cE93WSC+pfaf2YrU+BFzY7PXZtE0D77GTT6nphnbhfzxu6kqWBrd1LcL2xtya07IFTy0xSE5OxPzi+kXe0rDk0TgdHtc/BSWEPshnCB+SOsfNeypdTvASMXOCTnHklQN5JvnAfAyvhBgFNvcq4rUoqz6yvbDp3DyVJcvZGQbRnXbwSemrRLMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xQbmRVSlNMblpNcGN1U2tXSnhjWVF0dVJQZHQ1S1d6KytTb0t0UUgwdUlO?=
 =?utf-8?B?WVFGeEFNODJqc0VpbDB2cjRaQmNLeVRvOXEyUWVGVnluSGFoa09HZTNGdURO?=
 =?utf-8?B?cEpqT2p0TEh4YU13TExkZVQ2cHZpVmxqVDR5R3dCeU5HZTk3Tjg3SWJVbCtm?=
 =?utf-8?B?eHc4Rk9sT081YWsySXJ2OWtrdXYwRnZIcEEyVm9uQk9ZV3Q2M0RUNkQ4aTMx?=
 =?utf-8?B?Z1V2YXcrNkYzYU1DTS9ZT0dGK2ZKaXNwUUo5SmNYQXhQcjFPT25ZWHY4Nk1Y?=
 =?utf-8?B?MXNuWnVtOHVhdk1INlRFd1dNRmJnTzMvQ3pCRTk2N3V0VmtYTnFNM08vMDB5?=
 =?utf-8?B?UXQvaUgwN291UzdGQ201aURrc1ZxYUw0REhDNEJWSXRmNVAvSldlTFJGcWgr?=
 =?utf-8?B?K3RJVVlVTHlHemVROTBJSStnZDhJY2RwSlZzbmh0UUh3WnBjS2x1UGhiL3Qr?=
 =?utf-8?B?SmhNT0RqakhSUlRMa1MrNHdkb05nKy9UVDRPakc2N2FGS3VmY2NMTTRML2ZV?=
 =?utf-8?B?RGYzOUo5aDRKSmh2dHFNSzNleGIwS0pvOW9FdDY1aVAzTENQMkRwSW16czJt?=
 =?utf-8?B?Q1R1ZXVtY2RpcUVSWmVoSDZQdTVYeGIzY2lNQXBTQTFZMUdvSUJzWE5vS0lN?=
 =?utf-8?B?T1N6SVFrY3gxaDFTcnU2enVPZ0FaTTJYb1hLNzRaRVRWZ3dtekU2dFlSUVU5?=
 =?utf-8?B?ZWk2ZGZXL0VNYmRoRWZrNDY0VVE5cUZId3lUYWtrdStGN09VTGlWc1JiYm1z?=
 =?utf-8?B?MTNQWjEzejA1aTYxa1RkZ1A0WTc2TExIa1R6VkE1YkR2RW1RZWdKam9OL2Vl?=
 =?utf-8?B?YXZwZnFTS1BJRlNWdytQWVplMG40QkQrbFRUMTZXK0JrNVlLa0xvUzBUYlp3?=
 =?utf-8?B?WFBBQldXSjJmRURuaEJzUDR6YzE5RDlxUTlaMVg3UHJUcWtCY1dhbzRtZCtV?=
 =?utf-8?B?cDFNTG9wUGU1VkdVc21OMkxoREFiemZrSnRYaisrd0FueDVUMGJDOVBuMG9q?=
 =?utf-8?B?V1p4Z0JzdXBxQXU0dHo4aW9WTXJwVUpEV0tNSC8yV2c1cG1BRE1BcDlRTW9N?=
 =?utf-8?B?Mmx1b1RiZ0pXVEhEb0duNEpJVCt2M2M1a2dCZUFkTzdnazlpSmxCdVIzUEJy?=
 =?utf-8?B?ellIYkZKWVAvajZwazRZeUl0RjRsSTQ3V0xlYWxHN0hZLzR4Sk5CRFl4L2d2?=
 =?utf-8?B?MXc1YmZBUmtmSmpTSXlFR0ZIYktlTHNQMjA2dXpGc3BER2l5UmpnVEcvdklJ?=
 =?utf-8?B?OHhhU3hMM3pOQ2N5TUcvVkdpNWNZaFc4anFYRnFVZGxQT2FicWorekd2cCtE?=
 =?utf-8?B?blA4TkRnTGJadTBiaUQ3dHMrL2dVdGdFQmZOWW1LZ0ZjWFFNZmo4bXZlUzFw?=
 =?utf-8?B?UndtUXdHSDJTSzVRL2Fkem9lYlNmbURHRE5iZzF4Vzh0OGNOclJJL01ISDU5?=
 =?utf-8?B?Wld4aUg4WHVUOWROMkZCbGlubmszZHJVL0Z1RDBkZU15RU96NmQxb0lYWWdV?=
 =?utf-8?B?UHB3RVlFUjNlUmhrQWJGYXhEVTBMZTJ0UzFJY2NxaWpWNkltSnNYV1lkR0RO?=
 =?utf-8?B?b3RpME5GTEl1V21PQlNYNXY2ZWs0SThQTXBkN1E1M1FMa2IyamdrZlAzb2tD?=
 =?utf-8?B?dVZlREo2RHBkWjNFWUpaa25lNGRoVDJhRUVFbmQxRHFWOFRTZTF5TDdKZWdu?=
 =?utf-8?B?eGIwWGFNSVYzMm5haGorNVRyenhYQW90T01LTm56aC8zNkRKU1NOdUViakVF?=
 =?utf-8?B?MXpQVlFtb1dET0hQNElhM2hNVW90ZmE1UUNtU2tNcStRa2dSRkU4OEFRTlFG?=
 =?utf-8?B?ekM3VnJtand3bFlhZVNWOWV1L3NNWUhPU2pTeVhnbUpWa0tYSDNwaE16UG0y?=
 =?utf-8?B?Ym04M0RHbUNra3FWWWVqYUx6RGlyVlpJN1VDeDhnL1Z2SFM2K1NlOEVPWlEr?=
 =?utf-8?B?Uy9Ub1RweFlETkYzbjY1SEZpbzdwODFweERLWHVzdSswQk1IcTVZaUx5VWl0?=
 =?utf-8?B?WVhzdUtDb3E1MlZZNGhBbEtpNmI2U1pWZHo0c3M0cUZLeGkxUmJHV2NpR2pq?=
 =?utf-8?B?K2JtRnVvaUJVMFlVc3RZZlBQZzh3VmlxdTZOa1lHbUljbmxPUnZ6MWJDMmh5?=
 =?utf-8?B?ZWlWMDZRSWZMS2pEQlpwT3AzVVJCZlJ6dGtYcXpxTXM5VGNMYXlPUXZkVTdm?=
 =?utf-8?B?aUJNVk5wd01VY1pka3R5djhVNWpUYkJPT1FMREN5eE4ySEtZL0poaWM1RWky?=
 =?utf-8?B?VitqWnhRa3dFL2dueENabXZsUkJOdXRpRTBYVDRjZHIweFJQdHo1Nlh0VExn?=
 =?utf-8?B?Ym1hYTlPbEozaGErb2ZBeWVCMnk3Tlk3R2ozckNYNUoxbXk2SWpOL0JsUEVs?=
 =?utf-8?Q?ncgLy4Gdza2kk9u4=3D?=
X-Exchange-RoutingPolicyChecked: sM4bPnaf/V4IxU5HbtWVf4jPHsR3GqWrvp6zbK2kH+ppT3ahsNr6J0EEnPMl5kMH3Eb/ZA4APFQisJRgtjzz87RUrt5vS28fukTevtwbeGQy2yzFUSSRTgMsrpzRPEkfMFKos52nVK9I5WLhkshWWj0KKPOGVimkWXj4iMEJ0gAB9vJnttId3ywb8GaGBakQ1KY5HBmNygVYFeXYvgEg0eRV41ME0WEvWRCRAWR5c51ZTJgL6oV9ptdomuwAF9g5aG8OTaPCAIqGvGlZN/8SclAo5F4wrfAQDV8Dth1BcuZzZJV8zGi3F4GW2H/q27iZ0XsRcvJcNdsYQcXxfPva6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 157e9be3-45a9-400d-d088-08dee6ef3905
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:13:46.5154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbWkWXg4/u5JLUe8m0qRtyKNuixJA+E4maevj2DwLkv239STBnJ5fyf/L29Y9X/SbOz2YuYaRuAL7ZHwj+vrM5GjmUWmLtk0/nZxnnPYfBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
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

Hi Sebastian,

On 2026-07-15 at 14:15:33 +0200, Sebastian Brzezinka wrote:
> intel_forcewaked only needs the register/MMIO helper subset, not the
> full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index f9bbb41a9..15bd40dec 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -18,7 +18,6 @@ tools_progs = [
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
>  	'intel_display_poller',
> -	'intel_forcewaked',
>  	'intel_framebuffer_dump',
>  	'intel_guc_logger',
>  	'intel_hdcp',
> @@ -108,6 +107,11 @@ executable('intel_audio_dump', 'intel_audio_dump.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_forcewaked', 'intel_forcewaked.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
