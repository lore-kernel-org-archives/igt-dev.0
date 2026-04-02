Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDB1D39417
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 11:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91C510E419;
	Thu,  2 Apr 2026 11:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3Ton26g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B1210E419
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775129103; x=1806665103;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=y16Ubr55f1Up/2EDsxBRbnF/9NrXdLCJ3g3syitYzWY=;
 b=D3Ton26g2eG1ORJIBY/QqBE6Fq75TPs0kQJ5G0NWukeSkd9U9d1BYKnQ
 l43zXly6VUYM6Mwt/gyxOnyg1flaZ6bxM4HlYsya2jIyXGteRB1AEZugt
 D9C7B9nEgpW2XjsKNeuc4Im+SbdNO3IMLe68kK/kivMoQ+1+faZBTLchk
 Mdsw25nItmf5d16B2HJzPh2DZnrFjhEh0h3OPGV2yXT9Jpmr07XCF7ajs
 CbZ0UVICDT6DBU7YBVOIa9T2o1oiF2/MZWYlYCCT7/Y0KPm+mtRXlst6r
 AWlYSusugIW3qGKq0ltE16P5Kh5wnrMum6dwPSgo29RJ4d/NOeYaHXDaB A==;
X-CSE-ConnectionGUID: IeN8KXodSXSIvgoC4hU/jQ==
X-CSE-MsgGUID: 8OU0m/gqSIiKw3iR2NqOWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76304668"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76304668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:25:03 -0700
X-CSE-ConnectionGUID: xRQeqLI7R1SJ4c8fBSd67A==
X-CSE-MsgGUID: 85jKCxeMRJCRm1Dg2KXjcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222594374"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:25:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 04:25:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 04:25:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 04:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qc5vF4JdkYAVcyIYPKbyLAzJcleCrrk4ENnvDYimZn3C9WBLZjYgy5f7hn7dXwbOZFo+likOCDJU6E7PA2qquMVuWUgkbMUKAlQuZmZWA/0gQ4MKMl45mqjuAegQm6C+OApuzWbDTTtnXddYjs2hZ4L03/zGmTeYZJgho/i48Tc+uqFu1GxkUo9OTf3BWQBUCCERhkSQojNyZwNK6ndAruBagNTyzAkpp/JHPuftSZfK/Z0H33UrYBjoBB3an//sj1WqpZQkzHQPVsp7dF3jG6SYirAuBVEve1z4SiL0r3nXu8QczrppIXwjQlYTWNOP96o+2aT9JR4bxJGSBZrHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Xb/i86mmTZ3PpZEejxN9d5PSJxIhN8fZNMB9soG0cU=;
 b=nxrPZ+J+4FejADMDp/K8xw/RBQoNIk0E2s2zKhvhBSQQnt313hY6MgkujWQYTma3CSgfi7LwnWcWS30QiYGbqmyERsw29Ewy4H0HqYI3Y+qCe3INXuFCyBuIct2u7dLEiDmdhggNmnm+WBnqFPSDGb/zCGMfnNyEvnyPrmLEjCAD94LGs3euyRFpOa/cdIXe3l0rBc4VSnXt2QTDyEDzNYZ2blZm6vlMQFNDa8e0oUr19vzh3iDtSsWEYNpvTGUqYWGI2mlD71EGZ6GBRPjjgm9o53Au2c6exGYaDgnvLEeW6IxPPEWOAvre4GWbGEXbhpnM7/dMkVNk078jMPB/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 11:24:59 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 11:24:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 Apr 2026 13:24:52 +0200
Message-ID: <DHIMQVF67ANT.23LIAAMEJIANT@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_endless: Use the per-gt
 interface to set frequencies
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260402110411.6367-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260402110411.6367-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: VI1P195CA0086.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::39) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a121fe4-cd99-40fa-60f1-08de90aa798e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: kVkyPa5TeKHPazuGCc3XlydKQWGNBMqZnJlBUan4U4zXg6zBHiQ8/J23kU+6gxG+YJjP0q+ZET33VsrRVOQgny/jzWgOMVW+7hTQcoLo4tLC0rT27saiO9hMXMj21E/xfnF3bqwGVU3ixpd3qsv15ycuz3QjDVDtSnEZQ6p3tt9tM1fy8asuo5qc/36HksGRTu5L+ZpAngeoa3crVpeP/WuTghXJbvgNLDRSqCAtPwdlZZh0eYim9vkqqZoSCkpfcsTuIx4uNrhWgGtEXA4XW7PHQlOVPbeqzp3dsOIL326+rexDsJaFTJf0Txe2PTgPomAEHwEVfgZCNko5iS4xmKWEsBa5YbDrOCkaitBEUxcstbKCOpfVoiiT9CoqPhzASuwa8SopSbdkTBq1VMti1JbBNQ35f2T/tJX48IkFhW+meUDIi2sBAPAYJslCLgsH/Nv30DX4yCIdKslCLl2bIQHnRsNDlTz0NHq+33Ry+IHuqUZYBp9MB5EaEWCOkByxi78TdSgjCnzPk2BEaWO0tbZFqKohjzkaQMacGwNPt94Xiz7irYSgc960dOAWkPLIN6bNf+bUSuEuMKeMg7CbiRSE2oAt0zcM9l88Xexwm1kYwWmKCoUysUpGdozxUlM7NZSl+6bNMDsY9fEazXeESy5N7CoKF+8OsmAz7FEcRkiJ+qx7PYpOuZa+2P+pDv9ZJw2wXFQ6s096M/w/wd6vkadDSMxK1fdZ6jRpbuKmvIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS9vOEk5SVkzRFFLS3VyS21UTGhiVFU4dFNoMlJIcFJyQTNYc1dSU2hoS1Fj?=
 =?utf-8?B?Zkh4bHkzZ2xRbyt4azJMYXU0Nml5VUpYdXYzdmI0c0laUGtITUJMNktUaUpm?=
 =?utf-8?B?d1Y0ME5aUmpkSTlaQWVMeURpbVlGL3JFTU84aHd1MDFlcEpPNng2RFF6SkpX?=
 =?utf-8?B?MHdhU0ZDaFhXODhhb0Z3OUR1U0I4cGRwYldENHp4blcrZUdWQk13bC9TdC9p?=
 =?utf-8?B?UklzSzRFM3Nxbm1DR1ZWKzhGZXhLRnJwR05tRWFuN2xFOHZDRlVpbGNTSW1u?=
 =?utf-8?B?ZktSMWVxMDdJT3U1SkpnTTFNdWxvKzVvdnZ3TjQ4SkdEZnV2eEZZNTY0UTQ4?=
 =?utf-8?B?Wkt2MTVBSUVwRUZlSDYyMWc4ODI0WUtHV1UzdXhmY3VUbVpWSzFLZjVpVHZR?=
 =?utf-8?B?czVQdG5CY1dpNkFtK0xMSFEvZ0JaQnAxTFRDVmF6VTVJdkw0RXFCTXlKUXVL?=
 =?utf-8?B?RmM5cCsrZGhPTEFNOXFNWHg2c1RCdW5OdlZMTHltaThqOW5EeCs4NzB0MC9m?=
 =?utf-8?B?RTBqbk0zdnVTNGdIOXJHT3Z0RjMyNTE3MDhGVThVN20xS3VuUStGQnVRNk9N?=
 =?utf-8?B?dHhobWFRRytBWlE5SGwvWFNwK3E0SnpWaU9ZOElXVmF2TnYrMzBLY05ycWhF?=
 =?utf-8?B?bXp1OWh2dC9EVHRPQkhBZjUvZzBudlcrMENIQ0w4aE80bndKelJMTnFLZjJI?=
 =?utf-8?B?SEtmWG44YjRhcDRxYTROQUt5Si9CUzZqelpOY3RDU2JYOGRRcjFPK3h2cUxj?=
 =?utf-8?B?WEVjbmQvRzFmdXdwRmxhSTdhNk5FNjhJRFFmWTljMWwxQThFMkEzb2NPZWRN?=
 =?utf-8?B?N2gvSWZpRENaWWR5ZzgyL29tdkpNcmw3M3Z2VDQrWXN1V3VtNHB4aWhJK2d0?=
 =?utf-8?B?Vkx2YTExSWIvdUlhaDdHQzY2diswZWVCT0F3UXFSUzBVcG5YWlVPNDR3eXZu?=
 =?utf-8?B?TTFURVhiL1lWQ0NZYTdiRWIzVkR3SXFQVC9TVElHODd2czZ4aUFLS3BxZTYr?=
 =?utf-8?B?QTc5Y0lwUFBsR1ZpSTI1cnkxdTY4MmczMXg3ZTZjYzJSMjlqVDNnWmF2YWwx?=
 =?utf-8?B?UVExL0wyTnRTRkZTSmhaaE4wa2gxQmNtK3VEdWJXb3hCSUdFRmdjSnRDclhL?=
 =?utf-8?B?Z0dyVEhJVHIxQkFHTWZaTGRUbzc3UHVzSFdNemxGMWRNRzd0dHNwQmhXRUtl?=
 =?utf-8?B?L21DOGx2QzJqdXVXSEZTSGU4NTdnSHdmNmpWTDFpOGRVcUNVT25xVmsvT003?=
 =?utf-8?B?cnhwcnNjeWxDVnNRQTB1RDgwaTZ2VnBkMmZJa3UyRzZzUW5xWWJQSkJIUzJP?=
 =?utf-8?B?N3p2M3k2d0RQbjIzRlo0Y2g2L1preWQ0elBKZDg5U1ByWkFPSi9UWVZPeSt0?=
 =?utf-8?B?Qng2T2NkeHloZ0xJNFFWV2YvTnRnSnI3eEhSNmtqSFRnRXJLcFY3Y0lwQTRJ?=
 =?utf-8?B?SS8vQ1F2c1VYR2tBZ2pEREVPNUszaWhhdythTUxvd3FpZmNsMTh0czR5TGpw?=
 =?utf-8?B?dExqSlZYb2pCV2FDM3lzYmluQVBaVGFreDFWOW5LK1RwK0lyaHZPV21YNEdK?=
 =?utf-8?B?VzBWeWovSll1MFhLWTluTWZXYjhyN0xxRXlnTHMxcHNxRFdqN0d5NC9pMm5T?=
 =?utf-8?B?ZUxBYzNockdsaFNGcEdjTUwzSFYzZ0VBbm1zMHVaS3N4ak5FU0VZTzBWMTB0?=
 =?utf-8?B?VDJJM2Z4akxEV0dna1RRcFZmN2I2QXZCN2VzSmN4RkhGdmcxR3ZGOGpkVHhE?=
 =?utf-8?B?UzVYcG11S0NqNzhvMnk4NDkya2h4ajYxZGl5ZGpoK2x6Y0RzbTFiamViQWtZ?=
 =?utf-8?B?ekZWakljOEFyOXpiN2hHVDJWNW4vOUZwREdpbldETnV2ckE3VUN4RkxBaXhW?=
 =?utf-8?B?dXlzRnRKTWRHYTdHVDJuMjNHWXFacndpYi9BeWFmbE5FUXU4cmR6M0N4MGYw?=
 =?utf-8?B?dCsyemVRYW52bGNDUFlGK0ZDVnNrVGxOYytmMnRDa2x4MUZOMHJkc1BWbHoy?=
 =?utf-8?B?UDU2cVlIVHQ5N3dIWEVqRnNUckhIZnF4Wm1iVUpXNFZaUFRTR3E1SWhHQ3k2?=
 =?utf-8?B?cFhhQTBneEpoZFRpYkdDRXZuemQzMkRxWVpFaFRDcG54ZUZQYkIzd2wyVEZr?=
 =?utf-8?B?Y1hURHdxbWg3SFRsVHR5RXV3dXd0T1hRZnJkV2k2WlJhKzVWaWNzQ2lDOGY1?=
 =?utf-8?B?azZoME9IMUlabE9HZkNxcnhlNWxGaUNUd2hVblVKdmVMajhGbVZqbzNxVmJz?=
 =?utf-8?B?RUk2OWVaNTEwTnNLUktqTlVXUldPaU84T2FjREtNNnlYbGN3MmgyZldCZVdY?=
 =?utf-8?B?Wmp0UzNtZEJNWXNUWFJYaUg0NGoraXc5MzZzU0V1YjFaMzAvaUg4bERwK0ZS?=
 =?utf-8?Q?Ph/tGiufjlq4XLo0=3D?=
X-Exchange-RoutingPolicyChecked: ayOHGZDSe2Bg8VUFFqWihfB1HaZ2XI/4cnS+KaJ6m3Tcb2QgfHAaa4B1T8Y+4BSapNCTwBXOS5/J0vMYjBEMqB8XhHcoS14CBoMWM+JBGETx0o8Yrizwh9M6Fuab1SJDuw0xoxVRjA0xeojy5cw14PRQyu9PeC0byJyNufysm/Dal6n+V+NPG0KG8Rt6Hkr2VcidNs3PN1F1gFz4cGv8M809F2hzxG2my7D2SbLFg9dCq8kfOprRCvkajtDrzPcreMJ2CgPZvJ6Pj/x5w7hE27prUH/WSi/GBTBHjh2bAcKvxdmqnGhhNpcNKxJyJwKdkc5jfGBupYpWBQGrjPlPsQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a121fe4-cd99-40fa-60f1-08de90aa798e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:24:59.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HWoLpibpEHGmXjLb997t3+MZ9990Cicf/RUsP7VdDHRkvgpJwU2L86VHslFu7LXvqO6KFtCr72KtgO3t8ZMowo6MMbl0ZSyjHwQdIYG5Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
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

Hi Krzysztof,

On Thu Apr 2, 2026 at 1:04 PM CEST, Krzysztof Niemiec wrote:
> The test alters the environment, specifically the gt frequencies, for
> its duration. Using the legacy interface, however, makes it impossible fo=
r
> the pre-test state to be restored due to its limitations in multi-gt
> systems. Use the per-gt interface instead to properly set the values and
> clean up.
>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/intel/gem_exec_endless.c | 38 ++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endles=
s.c
> index 7f35e985c..9f41d812e 100644
> --- a/tests/intel/gem_exec_endless.c
> +++ b/tests/intel/gem_exec_endless.c
> @@ -316,28 +316,28 @@ static void endless_dispatch(int i915, const struct=
 intel_execution_engine2 *e)
>  		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
>  			igt_dynamic_f("%s", (e)->name)
> =20
> -static void pin_rps(int sysfs)
> +static void pin_rps(int sysfs_gt)
>  {
>  	unsigned int max;
> =20
> -	if (igt_sysfs_scanf(sysfs, "gt_RP0_freq_mhz", "%u", &max) !=3D 1)
> +	if (igt_sysfs_scanf(sysfs_gt, "rps_RP0_freq_mhz", "%u", &max) !=3D 1)
>  		return;
> =20
> -	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", max);
> -	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", max);
> -	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%u", max);
> +	igt_sysfs_printf(sysfs_gt, "rps_min_freq_mhz", "%u", max);
> +	igt_sysfs_printf(sysfs_gt, "rps_max_freq_mhz", "%u", max);
> +	igt_sysfs_printf(sysfs_gt, "rps_boost_freq_mhz", "%u", max);
>  }
> =20
> -static void unpin_rps(int sysfs)
> +static void unpin_rps(int sysfs_gt)
>  {
>  	unsigned int v;
> =20
> -	if (igt_sysfs_scanf(sysfs, "gt_RPn_freq_mhz", "%u", &v) =3D=3D 1)
> -		igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", v);
> +	if (igt_sysfs_scanf(sysfs_gt, "rps_RPn_freq_mhz", "%u", &v) =3D=3D 1)
> +		igt_sysfs_printf(sysfs_gt, "rps_min_freq_mhz", "%u", v);
> =20
> -	if (igt_sysfs_scanf(sysfs, "gt_RP0_freq_mhz", "%u", &v) =3D=3D 1) {
> -		igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", v);
> -		igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%u", v);
> +	if (igt_sysfs_scanf(sysfs_gt, "rps_RP0_freq_mhz", "%u", &v) =3D=3D 1) {
> +		igt_sysfs_printf(sysfs_gt, "rps_max_freq_mhz", "%u", v);
> +		igt_sysfs_printf(sysfs_gt, "rps_boost_freq_mhz", "%u", v);
>  	}
>  }
> =20
> @@ -355,7 +355,7 @@ int igt_main()
> =20
>  	igt_subtest_group() {
>  		struct intel_mmio_data mmio;
> -		int sysfs;
> +		int sysfs_gt, tmp, gt;
> =20
>  		igt_fixture() {
>  			igt_require(gem_scheduler_enabled(i915));
> @@ -365,16 +365,22 @@ int igt_main()
>  						   igt_device_get_pci_device(i915),
>  						   false);
> =20
> -			sysfs =3D igt_sysfs_open(i915);
> -			pin_rps(sysfs);
> +			i915_for_each_gt(i915, tmp, gt) {
> +				sysfs_gt =3D igt_sysfs_gt_open(i915, gt);
Isn=E2=80=99t sysfs_gt already opened as a tmp file? Also, is sysfs_gt clos=
ed anywhere?
```
#define for_each_sysfs_gt_dirfd(i915__, dirfd__, gt__) \
	for (gt__ =3D 0; \
	     (dirfd__ =3D igt_sysfs_gt_open(i915__, gt__)) !=3D -1; \
	     close(dirfd__), gt__++)

```
=20
> +				pin_rps(sysfs_gt);
> +			}
> +
>  		}
> =20
>  		test_each_engine("dispatch", i915, e)
>  				endless_dispatch(i915, e);
> =20
>  		igt_fixture() {
> -			unpin_rps(sysfs);
> -			close(sysfs);
> +			i915_for_each_gt(i915, tmp, gt) {
> +				sysfs_gt =3D igt_sysfs_gt_open(i915, gt);
> +				unpin_rps(sysfs_gt);
> +				close(sysfs_gt);
I see this close() but im not sure if it's same fd.

> +			}
>  			intel_register_access_fini(&mmio);
>  		}
>  	}




--=20
Best regards,
Sebastian

