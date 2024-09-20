Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0507ECF9C5E
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 17:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EEE10E069;
	Fri, 20 Sep 2024 17:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZyeiD/1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A278910E069
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726853270; x=1758389270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aiaoWGjBdaFR1u6AuJYZlu51fxK0u72gQVyzxIiF5Tk=;
 b=QZyeiD/1604ybJippyZ1a/tkfs65l4EWmG5d4LSr6073LZEaLODY3k1G
 EKR0ZByzMiKQj2mMQPgv9u31cxkSGqw7FP4KgBZFUlgfXaz7Q9of2/868
 3R1IAC9k70CCYoviWTXCq1QpRN51ANVCSn/Uo5erhNdZ6n3P3Yu0O44j2
 w/5LtzO3ljKRqiSUocyKph6BhmsdjAgD6hm9Yu8jNo7ffqyzrMBOmqb8I
 N4UINFVTACU4vq0ODFIYVph5FqScGr8vFxcQxTvKe+iSGQ+ujk6u8CjGP
 SHlAYlhD7oE0V4glKw4Az1u7b6TD7nQbISprm0f6vkOXAFRdEKaCmVpTu Q==;
X-CSE-ConnectionGUID: p3IWepU4RIGnvPTJxZssSA==
X-CSE-MsgGUID: ahqazvqfQuSiXZcx+g4VpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29765444"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29765444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:27:49 -0700
X-CSE-ConnectionGUID: zs7CK9YLQjaTe/EXWuO5ag==
X-CSE-MsgGUID: hzM3stRgSb+B0YL1ZQFR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70424478"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 10:27:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:27:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:27:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:27:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 10:27:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 10:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJBGdJuNiJQ1xYz2fKrG0//ANSk+q1gutqSALChhVQ4+WhNrwAl1eoZPl2O8Zb9C47he1DDWQEzTwIKhbLm0quTqdBKMRf+S17X1PQRIGPKQ4SNrRa/FQOMJ1Sy+geRqrmcbxHuFgIuhrjXwTKsT9ulgNo4KWjGy/NN3aB9R80fOC7Glr5E8UkPD+CT1ERVj+YbrhCgC8G6FNJ7zR4c0fjH4tj6elUW+elvUtjw/P0MOOIsNBqeUYeFl670OZVsZEciH4hlYvaL2FoLa4CWOswvPaQtHNYvkwfwQMgTFKG+EKA/YIv8xs2jd6EDjmPnpw/CiVWbHDPpxFZeF2z5ElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gegv6LG4dN7K89Ar1TKq3xjxfY7062we+HZIjWwxGCA=;
 b=xqaQ9sJ+7aTF7EY4OJGk38YK6jhnw6VHwjx8KICBPYimFvhkXkM2FNzJ+O5kqMPJPxXVWW+/Ux0uY9twY1Noblj0taFVqyNHpzkGppczkFapgf49hLNoCPvVpyUyoFITgI2U1Vnm0Ar5GFXBrHZPtrSnifN3SQtfIkvKxHn80s/s99MF85be8pFNSsLyzZmkmrGYpX8H+wSHWCerEwg8/Zz77hkGgUxqtXVcpot5TtvJkmNRrk+2XJ1H1Dm2Vv2nUvEWsVcc4fgy4/lsy7fF0sg0chYkLU7grBiMSEtUFxz7uRfzaQ8dBQuLB5Z7hzEwBpIb18dazQrAkYkwSsA4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.23; Fri, 20 Sep 2024 17:27:45 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 17:27:45 +0000
Date: Fri, 20 Sep 2024 10:27:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v1.1] lib/igt_gt: Fallback on filenames in
 igt_open_forcewake_handle()
Message-ID: <20240920172743.GP5774@mdroper-desk1.amr.corp.intel.com>
References: <20240918163629.1186314-5-lucas.demarchi@intel.com>
 <20240918191626.1194763-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918191626.1194763-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DM3PR11MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 39529e31-1345-4979-d708-08dcd9998a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6UwytjBghAs8+MBvSlooLU4NYZaUsPR4X/RXrYK9nhKGN7uJsrO9U5hlKwFr?=
 =?us-ascii?Q?Z2b341LrKUNxGSrGQg9Jf1uFul67f0gg1oTzIL8poZli+lEALStJl2PXfh7f?=
 =?us-ascii?Q?y4lwg1u+5Qk8YWuiQqmFp8FeyNT5aoViUv9Rl6MpQTV0IH8D8sPgEhJ5f4EU?=
 =?us-ascii?Q?LqAwMdiUuR3A93QMgZS5FG7zOqZKqKhT+H5HRuBesrYExd+JabZOJhGODsg2?=
 =?us-ascii?Q?XCSm0poqFyJXCCu3K2635x7M9gSXEq6UqVRHHeexN39XsWVDYgBaWcKlLOqZ?=
 =?us-ascii?Q?09Xgeh8vm298TE/5KLwcalP6GM98HFs/WaJISWlc/wV9TcnJBxzOt0mlw72O?=
 =?us-ascii?Q?M+gQjPww+ZwCwH8JB74gYn6wkneL836ru83w+QlsQTF4VrUeQ5pzhrvLx0qQ?=
 =?us-ascii?Q?Ty2rb80UjszXNXRsAjfoSWPBT9FO1QdUm5xdGIbQTPq4z/fSNiVplEOmReF3?=
 =?us-ascii?Q?WSUHFGI6y9olEy0QDbzOgiyH/irZNEhIFsIYqtbLr2S4XmDvMuEI1N2pkvOU?=
 =?us-ascii?Q?iVvXEJNKy/koFUVHHwxMtYMwbkNJbJZuF3S8gJGR3QFh42OHloFyN89LwMqS?=
 =?us-ascii?Q?FJMACPrwkB/S5TVhl7dllE6HNVQ7bUeHnC+NPlp2QMqLF9r70XssAgXKuW0Q?=
 =?us-ascii?Q?5okfFYw7aUfn3P7SNtIHi89joU3pR3r5Z9UnsQZJpYVD6udOg5o6BioH6vvt?=
 =?us-ascii?Q?tJdClsd8xjPZBoiKbuz3UNvETZxYn4ztYwV/Kbu6jHtmo/ahSadzp/SdL8+Z?=
 =?us-ascii?Q?5DzfgOfRhLZM9pR8drMKbrod4cbPsaFRQORnIzibw0rC6bfL2xt8CaZEWtaf?=
 =?us-ascii?Q?/OXxljF91IdwKCRhFxYW7DHAGJy9/3VdE6/f5G6XIbHnxRB5+TwNkKhQPyaU?=
 =?us-ascii?Q?nre8yCXI8Kf3R7gv8XbrWwwdTw4aorPjecqge9p4XQy5UCHMjI9QkESHvE5D?=
 =?us-ascii?Q?B86jrk+NBf6XhnCeNuCQH+KbQmu1TVFvAvuk7KBRcMtreNbHCq/Kq3ROJ2p2?=
 =?us-ascii?Q?jiTH7k/xwKapvZMDAie6PTeDOyEEChaqMpmrRwXEjITw46mqjE3r2cuo23Vi?=
 =?us-ascii?Q?hOGAasWVP0xUHnBaBRriSnibURprDwrDsNCzx1I7U8BRvRgvjcuE3itYTFUP?=
 =?us-ascii?Q?ZhHZp5ckAiIoTDXltVS4q/mwnTrqEXx3lXA6V540O0LZKtfW0/lDuvjfxNLB?=
 =?us-ascii?Q?H+gAKPZXRLJmQCWIrxLW/ZPSp/o5P/TLLQ1y6hTq4znILhLhrF4gTk8Y3IkG?=
 =?us-ascii?Q?T9CGVw6Z9f+5wW3FcBPi3sBSKefkedPwHAOpUsjBFqdoggh2lyPYbEbweuqX?=
 =?us-ascii?Q?VSmbkPIqisWhwdJzHOdjS59GdbsPbqS88hQou8HSnC0+fw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AHu5lqXw1X/jwedtQ5qQu3jTnhXACpuAYb0celsuPrWMAqOlpB817j4qhsJo?=
 =?us-ascii?Q?YODgAjsUYxJWXcqM+IJay4j3MSzCatx9Y+dY0ZZVEX/QSiINf420N/pZVuWL?=
 =?us-ascii?Q?gkU8vz889S3vIz3miSAlSsdtA74NPrvf6GE/Bk/62FmB2qXrvq3EdYcqOnDp?=
 =?us-ascii?Q?/FDHAy9BmnBNlAiRtYszBnYVE5hwEWxA4ko7odGVNg3oKvvXD4ajU5wjlKKo?=
 =?us-ascii?Q?vJyyUK0hu8G6yM5XZ4QHRt6vP2MlEst1plJ6fN0dr6S9nso1LMUsNvEAVhfn?=
 =?us-ascii?Q?ti6G7KCqhkOuGZqzZxlO8yPEP06hwDSw3b2v0cWvv6Ty6DtdN+0Tlta2AALh?=
 =?us-ascii?Q?vXGYndxWqFukua5pAbk94JVdpQn7YCUb9osuqdE2SPZab2EqR9HlaGdJ1FBF?=
 =?us-ascii?Q?vEDrgAQFjMXn1btn6wDU9/aMp0hX6BbfBzLdx2y918R1ts+U15Eo3b5/ABq0?=
 =?us-ascii?Q?CZYQo7kTgjmetWVGtS8mFbsqlnP2r2W39QNPC03AJu05wo2pjNkSlW9e3ydW?=
 =?us-ascii?Q?tlsaE83WkpZvvtgTjf+8llt3YQrSJ9uCJzt4quyC1d5hZ3dqPKd1rwPlkUXd?=
 =?us-ascii?Q?L0R35U6HrHKWRUZ8yb00UllIc3vsYlcpav7/Qhtpt+5t8HrxNr/PF42Rwgxg?=
 =?us-ascii?Q?ZEK5IHOnMyNqmoVqwESrMx8R0egKlZcBrEX0U2G5bJWXoua27+URNbo/DCAU?=
 =?us-ascii?Q?Pfw8midXrVa6aFkRcRJwfhWAcQAwaSAxtQHUNSKaAdJcXMOIFI0dxlnFcVzD?=
 =?us-ascii?Q?mbSGzBFKkjWKYIplIenK8zhKl1p3Aw441XtGrs3cC1BIdZoBuIkBMeYKT92p?=
 =?us-ascii?Q?n3AehboKZNNSOm4+NTxr6VCJkL9vrCw+t/ndl02tLQ0InwgqsyfpD73Hmbon?=
 =?us-ascii?Q?hXld34k/9WZCDF7IJJgcF9fDe87MBHY0bRdhXsFaIur1gu2tInJx+6PBjQnY?=
 =?us-ascii?Q?q1u+YxcDv7fSPx5t045w2c4rmsbRg0rkz8Lh9+7wZKUuvFtfMj/N7pjabNWC?=
 =?us-ascii?Q?bVzCqE8lFWpDA1A2CrwyOPFgXqYHCmutPTL6bSm94NRjoCx4zWmJD6y12MrW?=
 =?us-ascii?Q?SB3uTDW3c4P2e5PEN5l136NKTSoW1jlm0GGGL+26wC83dTMh7kz8gtfUfxWv?=
 =?us-ascii?Q?DPA+hRCB03oYqmwFNhbp97RUZxPbLZJzd0RtFE5P+b+mNUhW0cMBc0CkT0I6?=
 =?us-ascii?Q?0bu+UfIsS4ziiE3sjLodVqLNZQnGiEovZhvxGRnT+lULpft5Bn3S2+jLifzr?=
 =?us-ascii?Q?qZZ6AsqM5T5LtPfW5PDsBLMPOLfVMqGTlbrCy5Cs028Sc1poasx5MQXEvd7c?=
 =?us-ascii?Q?voSIn6Pz8eWE8gJnUjQXwkGECLD0SCEia+PvaUjb0aTLy5I+C+sRCs+cA8US?=
 =?us-ascii?Q?3iAVYLLOyZY2mmc+XYbXRz5SbxgsLc3Y0la5Rpqpaf/9zYArz+cOKNEC/Zzp?=
 =?us-ascii?Q?yp98u+ws5epALiMkTJQS+uPEYhlvWFjZdoZUJSDQic8ie/b51tPmZFj5QBCh?=
 =?us-ascii?Q?mQSrfiAwWpdNW5C5sa+AIZSCdgx8NPCUE6g6fvbcLLuBi7RSarWzn3zhZls+?=
 =?us-ascii?Q?Ow4Bs05iyALmbrm8scUIb7qnPSkMmqTGYwe9mjndJLTBlDVYPvSH58uW4CoA?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39529e31-1345-4979-d708-08dcd9998a43
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 17:27:45.4557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNQttROi6M3C2QTT11E4qx0S2nmnVmXb1zmf2vomlHtrmiCaxIF80BF7YtR+Zr7Vkdz4Hki6DxSjVJ30ou+XuajawmU0w8VuU11BTfqgGrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
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

On Wed, Sep 18, 2024 at 12:16:26PM -0700, Lucas De Marchi wrote:
> If fd is -1, we don't know what file should be used for forcewake.
> We could open the debugfs dir and figure out from there, but it's also
> cheap to just handle a fallback approach. Ideally fd == -1 wouldn't be
> passed and eventually this could be removed.
> 
> v2: Fix copy-and-paste error s/XE/I915/
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_gt.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index c84368fbd..4b096768f 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -502,17 +502,31 @@ void igt_stop_hang_helper(void)
>   */
>  int igt_open_forcewake_handle(int fd)
>  {
> -	const char *fn;
> +	enum {
> +		I915,
> +		XE,
> +	};
> +	const char *fn[] = {
> +		[I915] = "i915_forcewake_user",
> +		[XE] = "forcewake_all",
> +	};
>  
>  	if (getenv("IGT_NO_FORCEWAKE"))
>  		return -1;
>  
>  	if (is_xe_device(fd))
> -		fn = "forcewake_all";
> -	else
> -		fn = "i915_forcewake_user";
> +		return igt_debugfs_open(fd, fn[XE], O_RDONLY);
> +	if (is_i915_device(fd))
> +		return igt_debugfs_open(fd, fn[I915], O_RDONLY);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(fn); i++) {
> +		int ret = igt_debugfs_open(fd, fn[i], O_RDONLY);
> +
> +		if (ret >= 0)
> +			return ret;
> +	}
>  
> -	return igt_debugfs_open(fd, fn, O_RDONLY);
> +	return -ENOENT;
>  }
>  
>  #if defined(__x86_64__) || defined(__i386__)
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
