Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8002C3600C
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 16:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3FE10E5B5;
	Tue, 25 Mar 2025 16:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYKncY7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A3A10E5B4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742920010; x=1774456010;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=DMA//ki/IlTSTcZGlPn6q95zPQs28tO3J1fIAHE7Xt8=;
 b=OYKncY7FVi60FE7sdY6pMveyv44kqLIcXP/DykM9+RI2eoTbKFpbf7Lw
 DTFh5GjJR/S0xu5AvdodJDD0TOnt0HN0EbSIFWLgqNyuC+A8nkvR1UTor
 bw++MDfwX+l+SmDpczSBmH3Wl6t/6hwGhjh5x9XlaapDoUbqv+ooHJfpm
 SzHwhtYBvsJqDwUrlwhy1eUtdjy/29Y0S1wmTbifEFs26ln29FAD4Wlpw
 7RFBN+0esNG7M/09Kp8FERgItPRDVO1kAcQbLeEzdWIuR1/rIkb9hd0r3
 UKDDQswVWkfRdZd2wYerlOzpRXULhGqLeNl//OfyWVHxdGhIXbh/ZjlhL Q==;
X-CSE-ConnectionGUID: 3GrmzCz4RxuTFgRrTFIlVA==
X-CSE-MsgGUID: TInVjCTDTk65CaxWcHdB/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="46913901"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="46913901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:26:50 -0700
X-CSE-ConnectionGUID: 0y2ueORgRpaRTeIDz49NmQ==
X-CSE-MsgGUID: D0crtLwhSmu5XnIVos8qDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129611525"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 09:26:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 09:26:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 09:26:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 09:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoeWwhdfxUTkP2M1BPczg3yfjJG0oPXoLdQ5m0mQkf4RWsGXvnoxhc/NUSa2PxsaecAhPTTFGSQpdyovgrPnGCJ34TQjdUcft8HkMA1sqbczrovQAPehqxpI0kPGu52X5ngfMkC8xNYXqt76hwNeII0+r+R8CpgfvdXvq3sxLqmtCwh6e0BQhG82kV63hGCQ1r5geb2TgrqRYijA2fj9WsOTI1jilF6I79q+fLE2u+UAzWo5/VjZKg+iY1Wz96nM0gnBB76lfqMVWG190yR/VdCMZt9CW5Y0fcFFGNeblZpZL5LRSq4J27BHEInL08W9b9P36dJebIR6pDgdrNSQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9s17RMP2DOthaOysgQrAK2lccTP/dx1rhI6zBRqgUE=;
 b=Uhv600D88lTERRuL6gGVs+9pZApKmKCP2rC/hrRAI4GDumjZHi0JfPnSa3ojnHsxukiySIbj47wqU8HwGW7fTt4qJD9eo3dJzl/JJSSXjOjGyGbdVc/b/Z9SaFe1vItnWsOiyKOWNBw3X3WcuU31nRbxJ4m6ERR/YQ6a/Qne6DpmIAUCK1Gk0zOo3/z6p05HlFSfQfF7c2+SJIJlsMvBsU+lyeh5IHuZPkAJ/A18eBaHR+yA2t80mIfRBluPRSoOvw6R7823EBRS4qgVKbx9o2tQsRsuTOV344hbD09WfJab7Aoac7HbiHBLYN+wSun/+L1p1/zlQzff5DjH4/5kZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW5PR11MB5785.namprd11.prod.outlook.com (2603:10b6:303:197::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 16:26:46 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 16:26:46 +0000
Date: Tue, 25 Mar 2025 18:26:46 +0200
From: Imre Deak <imre.deak@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Remove PKC10 dependecy
 to validate DC6
Message-ID: <Z-LZRvxk0ec3dA9y@ideak-desk.fi.intel.com>
References: <20250217170809.175276-1-mohammed.thasleem@intel.com>
 <20250312210437.7304-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250312210437.7304-1-mohammed.thasleem@intel.com>
X-ClientProxiedBy: AS8PR04CA0106.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::21) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW5PR11MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 8818b984-751f-4579-1847-08dd6bb9d60f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4PA2t6y7urWlzOF/iQbtQZMTUICU1VdQt2Jbhq9N3djgrKEuH75IfPwOzCp/?=
 =?us-ascii?Q?nJQ1H5rXErJBnuTCRWrl6XtIQsMIBlnG/EwgMZcxsK3JEBnumiC+irfFmYcw?=
 =?us-ascii?Q?S+r+Z3NTcbaoCmo5EW8Hwf64eWrnSG2i+axH7pDKI2AN4mtV6EibBDEvSI/O?=
 =?us-ascii?Q?QtzjvhTB3cQt+vjkHIIalAah6frt93KqvguZisSrPm5hiNGP9TEU4ZtLIrJW?=
 =?us-ascii?Q?kIcsN4YCCeRm6AnceaqAScKc+oRgZJ7bFT/My0Lsri9Zxx5wgEvtmTMbZIbA?=
 =?us-ascii?Q?cTTB7bcsy/1NMwOjvb94ceeCXI/gsLAHY46VO6QlcR2wGFrU3CGtGYObwSiN?=
 =?us-ascii?Q?t3TK+IHkxMjqOzjgvGa+EBbBjLvyNjJ1pFmOm+wODizhybb1J9a200KalkCI?=
 =?us-ascii?Q?0/A6+oY6XrDHdjbP2WjJMKZ/jein/aoL0fXrk1ZmgRKo94chR59K3GT1YEml?=
 =?us-ascii?Q?RVSpVySF5W4y9sxjECEHY1a1jtMebF8ihtFVUgWRU4IqbSMgrtZi+MbjGZxU?=
 =?us-ascii?Q?Ypxj2P+xzPqM+Szr9uszYobprdbfgG0xqWhZ52LpOSM4LhyF41Stk0F3z+wK?=
 =?us-ascii?Q?PQ54RMh7JeTfxI449bFesExOC+QYJfF4oJePUIC+39qlMa1OnLh1TrUrLDo8?=
 =?us-ascii?Q?tQxMD7KMk3z8XyaFV980KBwgNbuXsGpnPq/iqYclTr6kHGiNSkj32hYXLukA?=
 =?us-ascii?Q?OuKcRCkVMuKN3ugYAqeKPF6JtkHWB79KutGdI0E88OF5ctfsk7rFMl+UfV31?=
 =?us-ascii?Q?HjYDbqvcJAAuOHMkIHZTYnOSJNieX85iB32EMNEXIForKxQ5Ut9PhrT9ZcY9?=
 =?us-ascii?Q?V9opI8gzazZ9dsq9hOiMZ2dv8pDjqN8WN5AvJ7TQNqPzS5D94oGdeiQQQ0ra?=
 =?us-ascii?Q?QjhqaZHfEspCwogfGcPhoN+sMdz/3as8X3BvxBVRKX4dFq6R8DuivD5lJSDa?=
 =?us-ascii?Q?O9nX+HPJjZE0Q/wLIr/8h+GKZfkrGkrn8KGYI/xAwus5lU7OozJFTwtZyxAL?=
 =?us-ascii?Q?ejiWjIdjKGjcbOdsqfshqoIbtzmqmULOsjvIHBoETVWsGrcguCbx+2eKDOTa?=
 =?us-ascii?Q?3oerjSA2oGKB+QRiD9cI8XopFbM+JfeZmnjOyBja67BtebX83tilYGN2EOZk?=
 =?us-ascii?Q?xl2EWFId+UR8eyvHBnFz3MJpTMdPn8bHC3DWNSKQva3AUZCnk2p4kGDl6UPS?=
 =?us-ascii?Q?frtzU7WdRv45N1odWZY7f/EPdcOV8CdraRV5l8pLvdLvnxnw3kBwtZjSEvWM?=
 =?us-ascii?Q?c4w+ogREoKUXQWCBK8U6Fm5zp4zD7hae5QAl+a25ZtYUxz9ItMyIimc5zJT9?=
 =?us-ascii?Q?RqhdJfoDN8xRciPLwlXSaUP8fCt3M+Lw74VbniqkXFIjgtxFlwEB8DAKGm04?=
 =?us-ascii?Q?DgN5aXPIUdxwoe2KJJ5sFI3h6KtX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TIKAD9tYeRVXYQ8ruuKIjnHJS6NxgrjVOjL5Q6YGdvCfrdUwITOR7MVJc2kR?=
 =?us-ascii?Q?8XcruyQiJYPCVw7FmrR9OM+fXSgNamxPlR3BbWsbzf+Drs29O1t9CLlXF+hy?=
 =?us-ascii?Q?69MenUTYNI4s1HqE1Skj/kLHbyiY1s/ozdg0ECwmITCWmzOtvllL7oBF4Dy2?=
 =?us-ascii?Q?FdKkdwzfp/0P5vg/rUt/vr/Ygr7wVqmvwznZK+wwoZ03uRr3DDJdR9kNhn/B?=
 =?us-ascii?Q?paR5hEmsQT1WrFiB/WmEncT4dSW/N/4aYwO/cV9VhzzZ73vQYqz3NQDSEZBS?=
 =?us-ascii?Q?sEHm1rxJ+hgaxy4Gkshzz0aAZXt5MIn3RJjoNgnBaBb2R045ZlUf57FZNyIW?=
 =?us-ascii?Q?zWnsMRG6ROzjLbOOWJGZm3WTtPTfXbZsPBVj4Jge90rsyFio0GmP4Y+NUfz9?=
 =?us-ascii?Q?sQhlb7Pam6DtK/SZtLDVlmnNb26TDgvEu2NH1AQuo5GVJGCr8j3Hm5ex+ZLJ?=
 =?us-ascii?Q?nGGlOZO9jyDFW6orqE5qoXrsj/nscfsXJ6MqFnpKYH6bK/LCGu3h/H89ohBo?=
 =?us-ascii?Q?NE9E+T9biFjC6ifppDFW8eag/cmSk9YgC5eTcyCPfm2xfiuJ3wRWBxGfLN2/?=
 =?us-ascii?Q?ihNjYlFLwnALvziB0bUwCfkzwq9yjLYremHe9NQM0LCHQF8gp+kCHBKDbvQV?=
 =?us-ascii?Q?Jl9KrjuNgZnpW7B38gbuMl79/lS5+UG0wgG3SHXpxMClXUfftmudHubW0HaE?=
 =?us-ascii?Q?hjOjO5cFoteV0r2SbfObqF4Rn08fp5rSA6OJ0NtD//jnIsmvC/oQof15YYbA?=
 =?us-ascii?Q?1L23kbi7hyO46naxeSlAPYHx1S6/sboly53CPXLQgYwpF+7NDl8QCTaJdW1E?=
 =?us-ascii?Q?F6IiGreP7Pasr/WTkRWE07rhkqOhGxW3pGE+TRzfT+k/YmObESYg6yBWTSdd?=
 =?us-ascii?Q?GBRMn2QgDWq9WxOIIOgfrkAD1JWSeUjX9FB9Znclir11yumhVe86wX7uAequ?=
 =?us-ascii?Q?47VlzmsbbrtaWEFxs6haQamyWulFNZBNi7L+9tP+P4Tg+LCOlyPrwE8+CqAp?=
 =?us-ascii?Q?IJJ7CpF6sHHpfcnJOH0d/3755uuEyB24Dinel+7Zi4GiWsDdFk6m10kNI/xV?=
 =?us-ascii?Q?iMs4OUJaqmWCDC1n84v50fDXOqhLebNm3zmwrzhVfzDdgLY5dPLIUru7KShd?=
 =?us-ascii?Q?7LW7prPX5OSrpcmk6u+O3nd0vvxikcnQRF/S62arUsSSxBXypIv9YiJhBdPG?=
 =?us-ascii?Q?X2JA3WWGyNsMR0xwALo4XDKBxUUpLA0garnSvP+qsfGPmqVJwZQ7Wih+F61m?=
 =?us-ascii?Q?t6faacrHjMlByv0dXQ2iIkvlLE3+PtqKdmIkXpC6dh7dTw+3/bxLBuRgye2Y?=
 =?us-ascii?Q?nfMd3M3oG/Ei69qwRKorUTRX+MDMk6LGFgcT0b1aoBEiBU7nXp3RkAolb3bM?=
 =?us-ascii?Q?3xuTPHqBdOLJQvnWJHdghV0CNUfkzAw0ehGPfzc5ZZet17bEHuJOWHYcLcVh?=
 =?us-ascii?Q?HG3O9slY/rAUz2N1wn1LvNj6UgGswDwcVwi2ETh1mmy2d4SQMEwYGVA4jWoU?=
 =?us-ascii?Q?b43As7hZ4hFKFn3exhPQcC2V9vkzV2l1UcGhL7qbIriaGItIxP8C8T0KW5Y5?=
 =?us-ascii?Q?7AQX5h9cs9nui3F1K91V83I7FNH6qVPrCtpp+Qfz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8818b984-751f-4579-1847-08dd6bb9d60f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 16:26:46.7351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLQMzOaLgYJRfUOl+mEGU6YU1/ICQx5SbYP20JrcRrO1I9Nao0K6bNQ/Pt7n9NHwaVvHTkgxTblfiz3w4t/Kqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5785
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Mar 13, 2025 at 02:34:36AM +0530, Mohammed Thasleem wrote:
> DC6 counter was removed MTL onwards, so pkc10 counter is used
> to validated DC6 tests but with the new approach of kmd changes
> created DC6 debugfs entry counter to validated DC6 tests and
> removeing the existing pkc10 code.
> 
> v2: Update debugfs message.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 78 ++++++++++-------------------------------
>  1 file changed, 18 insertions(+), 60 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 1b10c7959..658ba0564 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -274,6 +274,7 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
>  {
>  	char buf[4096];
>  	char *str;
> +	data_t data = {};
>  
>  	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
>  
> @@ -281,8 +282,14 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
>  		str = strstr(buf, "DC3 -> DC5 count");
>  		igt_assert_f(str, "DC5 counter is not available\n");
>  	} else if (dc_flag & CHECK_DC6) {
> -		str = strstr(buf, "DC5 -> DC6 count");
> -		igt_assert_f(str, "DC6 counter is not available\n");
> +		if (intel_display_ver(data.devid) >= 14) {
> +			str = strstr(buf, "DC5 -> DC6 allowed count");
> +			igt_assert_f(str, "DC5 -> DC6 allowed count "
> +					   "is not available\n");
> +		} else {
> +			str = strstr(buf, "DC5 -> DC6 count");
> +			igt_assert_f(str, "DC6 counter is not available\n");
> +		}

Could the above not depend on the display device version? It could look
first for the real DC6 counter, fallback to the DC6-allowed counter and
fail if neither is found.

>  	} else if (dc_flag & CHECK_DC3CO) {
>  		str = strstr(buf, "DC3CO count");
>  		igt_assert_f(str, "DC3CO counter is not available\n");
> @@ -374,6 +381,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>  static void require_dc_counter(int debugfs_fd, int dc_flag)
>  {
>  	char buf[4096];
> +	data_t data = {};
>  
>  	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
>  				buf, sizeof(buf));
> @@ -388,8 +396,12 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
>  			      "DC5 counter is not available\n");
>  		break;
>  	case CHECK_DC6:
> -		igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
> -			      "DC6 counter is not available\n");
> +		if (intel_display_ver(data.devid) >= 14)
> +			igt_skip_on_f(!strstr(buf, "DC5 -> DC6 allowed count"),
> +				      "DC5 -> DC6 allowed count is not available\n");
> +		else
> +			igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
> +				      "DC6 counter is not available\n");

The same as above.

>  		break;
>  	default:
>  		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
> @@ -414,20 +426,6 @@ static void test_dc3co_vpb_simulation(data_t *data)
>  	cleanup_dc3co_fbs(data);
>  }
>  
> -static void psr_dpms(data_t *data, int mode)
> -{
> -	igt_output_t *output;
> -
> -	for_each_connected_output(&data->display, output) {
> -		drmModeConnectorPtr connector = output->config.connector;
> -
> -		if (connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> -			continue;
> -
> -		kmstest_set_connector_dpms(data->drm_fd, connector, mode);
> -	}
> -}
> -
>  static void test_dc5_retention_flops(data_t *data, int dc_flag)
>  {
>  	uint32_t dc_counter_before_psr;
> @@ -718,40 +716,6 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
>  }
>  
> -static void test_pkgc_state_dpms(data_t *data)
> -{
> -	unsigned int timeout_sec = 6;
> -	unsigned int prev_value = 0, cur_value = 0;
> -
> -	prev_value = read_pkgc_counter(data->debugfs_root_fd);
> -	setup_dc_dpms(data);
> -	dpms_off(data);
> -	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
> -		  timeout_sec * 1000, 100);
> -	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
> -	dpms_on(data);
> -	cleanup_dc_dpms(data);
> -}
> -
> -static void test_pkgc_state_psr(data_t *data)
> -{
> -	unsigned int timeout_sec = 6;
> -	unsigned int prev_value = 0, cur_value = 0;
> -
> -	prev_value = read_pkgc_counter(data->debugfs_root_fd);
> -	setup_output(data);
> -	setup_primary(data);
> -	igt_require(!psr_disabled_check(data->debugfs_fd));
> -	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
> -	psr_dpms(data, DRM_MODE_DPMS_OFF);
> -	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
> -		  timeout_sec * 1000, 100);
> -	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
> -	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
> -	psr_dpms(data, DRM_MODE_DPMS_ON);
> -	cleanup_dc_psr(data);
> -}
> -
>  static void kms_poll_state_restore(int sig)
>  {
>  	int sysfs_fd;
> @@ -815,10 +779,7 @@ igt_main
>  		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
> -		if (intel_display_ver(data.devid) >= 14)
> -			test_pkgc_state_psr(&data);
> -		else
> -			test_dc_state_psr(&data, CHECK_DC6);
> +		test_dc_state_psr(&data, CHECK_DC6);
>  	}
>  
>  	igt_describe("This test validates display engine entry to PKGC10 state "
> @@ -863,10 +824,7 @@ igt_main
>  	igt_subtest("dc6-dpms") {
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
> -		if (intel_display_ver(data.devid) >= 14)
> -			test_pkgc_state_dpms(&data);
> -		else
> -			test_dc_state_dpms(&data, CHECK_DC6);
> +		test_dc_state_dpms(&data, CHECK_DC6);
>  
>  	}
>  
> -- 
> 2.43.0
> 
