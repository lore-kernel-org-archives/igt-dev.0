Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63910C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 06:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC4E10E528;
	Tue, 28 Jul 2026 06:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lu7yX8n2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0926D10E528
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 06:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785221512; x=1816757512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A4pD8jIB1ee6DGpp0B7m9n1aykrTwXY/R2IZDIUiDnc=;
 b=lu7yX8n21dbuXzgTA65POhmX9KKYpYzGwRePGzCAIdu7qOTwR/X9rzXc
 jiHwYcph90lOZd88HLT8U1uxC/fFIoniwwm6QKuqH64Z7k0439aW8830G
 HcoqfwCk/XvjjpvjRb9vhJYhW6Xk/FhEXUXYmeQBHIsvj1vw01vtp+0KR
 HJo0eo8npGszlnDVoOF4fjZnSJTx2gE4vtxzd/d4Yh12L7jOnzhmr/TiX
 GwUnTb7ImA7qbdKfjvxRwtKmNBLSX6CJIiSPdWg2nKkewYq8LaCnsxXdb
 DtBJr82N8bX7JiOpr3TnTjBhonrnjhLd1AsF6qMBINy2fmeuAui8kLtwi g==;
X-CSE-ConnectionGUID: vzGy2PeuRVyNuHa+FEmw+A==
X-CSE-MsgGUID: v2VIvU8ES6Sd4/5zvaAhWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89469465"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="89469465"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:51:52 -0700
X-CSE-ConnectionGUID: W9BOIlAISNmPyFFQQhHaRg==
X-CSE-MsgGUID: xEjQ8cDnSqSBeLI5lNB9sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="263932596"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:51:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:51:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 23:51:51 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoGtHViIgBMzJp6Ag8V35FS9uqSTd5J1G7Uz7PYisTCRt8QOvmazoAUrE76lpEJoCisx1tp1ZyQHJoK7NFXPnmi5epU9zODIVzGV0NDOkqOMqvue4MwKBpwFKPzK9nzEXLGz4VvgRrP34Z7tNCH79zFgS+RfncV+Jd1eRnTSfqqexMhy/j35N3rf7oEFdXVjvF/jBgwU0vHlcy95U2Sx8z8ojQ/t7KeQXZs/EbRs6BOB2uHJLRvJZs33sr5aAsAMjKxHH3GomFg/hxKImfejFs0BhW/SodQgS0uug5mU5bal1y5M8IGzGoEWxsTailwVKV5tK61GDkpfWernHqsFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mp5q5EKo6k8kz1I4xhY/8ktlU0KFSiobom2rasEyAY=;
 b=YswSsi1L3Nio1Q1sLj0CuklQcnSpijsNGuUDSUxub/MTX7jpi+jQ9bhuPrBJ64mqPSoFpeGcrhtb12V4TqBIykNxlxxvKn6+197Bn79Lzh1DfUVgt+RoMvSD/fA12Zn/AzBoF8gh9b/A3vW0WlQLOMA+5AroQaZbcjnMQXIKtlj7zE6UUtkffFpyp4XfwXZx15w7MEtKYhNMOmvTweNfujo4lB7s0HbWQvbukC7pidLESolstFyJbxAlVaRbYwv3Ls+t2CfiAom5qFmjCmFpxp9lCyjz7L4mBl9bo4qWRqWgOpMuyOmSl7DGF17dOzhvKvOLPRm1TPso4Nap+Ov8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:51:46 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:51:46 +0000
Date: Tue, 28 Jul 2026 06:51:37 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v4 02/31] lib/igt_stats: introduce static
 sub-library for tools
Message-ID: <jrrewpoqxibheudls6s4aycpomyax2rh7vqfd72tevwqwsveys@uy6ui3mg7wrd>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
 <09781f7505b66627efeb001534af8b749dbe944a.1785152675.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <09781f7505b66627efeb001534af8b749dbe944a.1785152675.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU7P194CA0005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::32) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0322f2-b358-4e5e-7b53-08deec74b11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: MOpGlgbm/+wClwFxBAXjGxCdfbOsmMvm8ZGXaftbrs3KoT0kvr756iTmHJE2dVGkHp3Ct79O+bS92qo8Othu5ptC0mbV8HPpaPGrekZv+qKqOso9CDmraBeeFEMduGBfPj8r4d8udBK0zNNDt/KIbnw4zpODkMR0bgbsKOIZEqL4/tDrjkjBvNF3nYHEvm7o6aOzqS4+VNyBhxM/Qr9v586ZdI9aattUuzo1/W7WI5JOCom/yAyf1xTzJpcebPu7tHjk+s9Q3ZkGXEfaZzhSciL6oy3jYrl08DoAg5LMvi2eC8v4hmGViosvLhBL4tj4zlNssahTyjnTT2z6HXfkDyi4C9yXSQ4SsE5TuussZPZGyj7H3rqPdDzgkOaAj4gpsqOKNY2vzfs7GSD9sAqInxzAPxi9ThserqaXmJ6nXkyWKu8UjI2W7tA2imumeEaQMxhqCXgBbKKlMsmJvbl85mbkIsnh2lBjLVYyVfANohr07qjeKNIaAF13kMMjFs9ew2ebeNTiPaTNXkhtdxnqFQqG+LYtBjxX4d4uSyRgWxehgyoKGZpF0Wnwi/iEofcz3ElsO6HefuLfmyy6QU+VlDbkoG1CXX1oealfvBlxep0UtrnPr3Dwk/c54GZSyjatEgxWiT9oJBIjKorU2HNmHIquyPsTC8xUj8ZlpM/J9BM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lpOHl3SVN1UGVYZHhEWXRHNEdDRnVpL1pzTFA5TjhPLytjZzJ0VjhYTGRW?=
 =?utf-8?B?WWNPNTFwdmZOZFQxMzhaYkxqT2VRcERVTWlxbnRFK0l2ck1QY2I0NWRvdmxK?=
 =?utf-8?B?TXlCVm5CMWpUOVo5Z3VqYnY1a1lPQWk5NklxbXdQSDdjNjlIVk40d2s2SGJr?=
 =?utf-8?B?ZTQrM2FHMUF0alQrZ2N6c2czTEZvbkFKa3FLeTFRcmgreWlQL2NNZ2RmYkdn?=
 =?utf-8?B?c0RaTE8wdlBMZEplQXlMSXFTZUdXV1hPTXpkdlkvNHdvWTF6a1FMem5NWjBO?=
 =?utf-8?B?WVdRMFRVbnBnTGNtckNQSitQZXYxMGtHTmYxRHZUclk0T29OV0N2eGhRT2x1?=
 =?utf-8?B?dUYwL210Ykg1d2xFdll0UHdmSHNkNnVVVmRjdy91L2dSUmRXdDFRMGtOb08v?=
 =?utf-8?B?WUV3cllJUUJJdW84NE90UzdUdE12UjMwRDhIZHhEUjZvZHJsdk1lU2w1eU1Z?=
 =?utf-8?B?eUh5T0Nvd0I3aDk5UVZFSlFxQXZ2UkoxTXVOak5TSEtuaDQ3ZTJzNHJMeXNU?=
 =?utf-8?B?VHBJODdqR1QzZjFYREx6VitmZTVodzkvMnFMMjZaWnQvV3FvUVRoT1ZNbk85?=
 =?utf-8?B?S0lJa0hqRjVYcXFrRndnR2E0MEdRL05FSDVrUlV2YzRXZy9ZR3pSUWx6dXFU?=
 =?utf-8?B?bU81eE5NN0hQZnRibCt3LzUrT3E5WjJNbURuZkkvN1JWZjNjUmE5cU5SRDJk?=
 =?utf-8?B?Y2dVek92TUVScmpHQjBZRlJEVlJaQVhwYnR0L3lRaXZoZnlzRVMzMGRvbDBU?=
 =?utf-8?B?bVpiblJYWCtpd2oxMlBoVHc0M0pVOFY3S3JPbjdQODMxV3RtbnVBbE5wNzIx?=
 =?utf-8?B?R0VPZ1Zhc1Z2c21mRUZHRU5jTTJsY2M3M2pCUFJ5RndSVmZxaFR5MnJybXRU?=
 =?utf-8?B?QkFRWGhUUnRoTFdlOWUvUXY0U293eDZVZllBUjM4SDNxUE5Tdzkxd1lMRzZJ?=
 =?utf-8?B?ZzI4bXQ2RzNWaEtoMS8xaDhGd1NBM2FHTG5wVUZOdnpNTlQ0di9EOEhVdVAx?=
 =?utf-8?B?ME5aR1dQbDMyN2VFdHV5VUVEMEFNUWxHVjZDN1dWVGNEd0xzNlJIcFEyNEto?=
 =?utf-8?B?MHJWalpNVnpBSGVBS2sxTGE4LzF5Y05OT0VyVFBKQ3dPNGI5WkNKUlJyUk9w?=
 =?utf-8?B?SXhBZGtjWmZIYkZ5VUlaaWIrK2Z4VDJFQTZNRGZvUEhmWXJDSk5GdHUwTUlX?=
 =?utf-8?B?U3BLK0JxVXZobkdHMHZ5aEJzbVhvTXY3My9Ed0JVZG5FcXFGSHN2UTRLa1NJ?=
 =?utf-8?B?b1k5OXdEYzFuZGxxeGxWdVV6VjhCOFBRckJaN0pGOFFPUFNiYUdiZ0ZWcW1C?=
 =?utf-8?B?WVVjVE9sQThPOUtDcmU1L3BaWUtLVEpMUVlNWFdJVHZjc2diWlMxNzlwUjdi?=
 =?utf-8?B?d3V2MTdEN1ZVcEJ0N1EyU3FSNDR2SllaOTBJNHRja0RFc0EwR3kxQWJwVUlo?=
 =?utf-8?B?Q0JrWWxKZG1EZzI0TEU3M1cvQ3ZucFNBQ3JQWWVHTnp5Zm1zdEU4T29nY3N1?=
 =?utf-8?B?YWlFRnNUMVUyanVYa0dJUFlyRUFKUlE0Q2NvemRNd2hVSVhJUzVhNnErSEl6?=
 =?utf-8?B?TFBiQ3FwSE9vRFBNM05pbldWZTh6Yk1Xakx6S3VHVlB4VVEyTGZveGZuUUxE?=
 =?utf-8?B?QUpGN01Hc2dRSnhXcy9EQTU3ZnJyMnE2NE01Rmp2VjYzNkphRHZiZlk0N0dX?=
 =?utf-8?B?eERNVnJVSVdzQzdKenZhME1yVWUxb2dLL0pMRWdlTFJTeFhUNlFPZFVERHJk?=
 =?utf-8?B?MURMRDhZSThoL0YxcWlxVVNoZXcwK2ZlbzhTa0t6ajcyOGRHbGFINEZmeG1S?=
 =?utf-8?B?R1Q4bzlubGpQVDVMd29pbU15R2FVZC9DaFg4cmx5elhUS0JocjlhaFlxbVEv?=
 =?utf-8?B?T2dCWVpBMjl2YUo1QXRySUpSWnNta000QmhZa1BWcnM3akl2UUZ6WStZZ2sz?=
 =?utf-8?B?c2RUbkE2MWxtMnJFdi9vZHVWYUVnRWJIc0VxalJMbTlzQUloNVBRUmtHcGhU?=
 =?utf-8?B?OXhYZ3hZeUlBNWd6amdJczUwQzNBV0hHUExuTUJPVU91Qzh2eldIZktldmwx?=
 =?utf-8?B?bzk5OGZiWm55VjU3blFWK2QvVG9ndllCcDRvTmRWWUhERmMwY3NodjRodDQ4?=
 =?utf-8?B?dm1MQytVSHJOcjMzN3JzTVdzTXY0ejFHOWJnb3lUT2kyUm90alRNSkpIZDRK?=
 =?utf-8?B?ZlZJdUxiUlhtZnNIM3RRbTJHMTI5MlZtNFJNQ2hPeWRCenR3ajVuMFNXVURl?=
 =?utf-8?B?Nk1nNnk1aTlZTFRsZ04vbk82QUxocTI2VjNsZUJ6UlBpOXhmNCsxdmIybFkw?=
 =?utf-8?B?SnZTNXh5aGgvZDZGdlpXTHVWOGNIWEtsSnRJc3lFc21rOFNmMHhhWmYwQktn?=
 =?utf-8?Q?pVhU7cLhUA10pVe8=3D?=
X-Exchange-RoutingPolicyChecked: Psc7YvxRD1V9KfVUnklJoO0fOkrXvPNlwh3WG8ADsZdj9fON8ycEqQwL0rU4af4bSjv0FqyJxEoZYdTpjxlwcWB3DUaJ+i79rShqgSbbWWTxm8tYuTLyMEJ3gs55eFpsFeE+XdRhZWXNcevXa34Kr5w6OmIjrnOKTpNyBlYhTwKOyvF2Y2vSkuPEdveQU8A+MGs+9qpctH5prMev3e3TtYkNeMvCljtSDUvo8Js0xEtDNAMZIqcJ5lC60VBk05tzhrwr2t/Ebmz49mvAY9xmT84g2LLaF49vKmxFwSM0jJrqVeUdyKiMKbVblAhs8A6ws2yv7tCQyGyv+AfjZuy34g==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0322f2-b358-4e5e-7b53-08deec74b11c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:46.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9a78mLMJtjLwzV5HPaenYr3odEwChsqOtTQFM04iKNV7qLugveslxwlZ3IJVkOskR4zOBPXSRvVUWsZFrGd4GXzTRPckJpI+0hv4Z1P1Cbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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

Hi,

On 2026-07-27 at 15:22:30 +0200, Sebastian Brzezinka wrote:
> Add lib_igt_stats built from igt_stats.c. Tools that need the
> statistics helpers can link this without pulling in the full
> libigt.so stack.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  lib/meson.build | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index e95b29d49..a57c1eb8d 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -397,6 +397,13 @@ lib_igt_profiling_build = static_library('igt_profiling',
>  lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
>  				        include_directories : inc)
>  
> +lib_igt_stats_build = static_library('igt_stats_tools',
> +	['igt_stats.c'],
> +	include_directories : inc)
> +
> +lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
> +				   include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
