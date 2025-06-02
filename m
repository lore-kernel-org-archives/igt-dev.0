Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46BBC5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 17:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11A610E56D;
	Mon,  2 Jun 2025 17:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXvn56J8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0F910E56D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 17:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748886565; x=1780422565;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rqj99TwxPa2A3H1KK1n7IIoWQJr9epJKze/2uddmlqg=;
 b=PXvn56J8kouDQ+FZ2nTRtjQHjanNl+sIAOOA4XGcALIOOECakGMYXkuQ
 qEt1KX+pu7ga6alhC/z6jAxbi0LAlfn+IYjai0ssqqadAu366wN2a2QV4
 FiHjjSdtZasK6XBOanZo+UqOWn5ww8TSfYDlVP8itEcylpo9sFBf9xHyw
 AYmLuTMhc7cuvPFbHjbdelAtKi0qYvgIGwTUkRzdC83WC9D6Zs/+510yk
 RI7Z3v/DgAd5R7ICj/M5MccwQ42TpssRq2DIDGZVPxNAWc26elxRvsYCX
 eiKrgW2c0Wh9d0XhG5NTT3yBdJ0SBXKvA3/ZLwH0OKtrD49hmrKAMDVO4 Q==;
X-CSE-ConnectionGUID: 2la6gmhKTsm4Qyf05O1dGg==
X-CSE-MsgGUID: s89uUhmzT+ac9+lbn17jAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61566503"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="61566503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 10:49:25 -0700
X-CSE-ConnectionGUID: UNpC+YOdTRS8BgN8LDrmBw==
X-CSE-MsgGUID: zZFKwB2yQEanso23x+RG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="145544559"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 10:49:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 10:49:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 10:49:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 10:49:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrNCdO2sMns3955Vqu0jymn6DrjDc/kP9wPDVciccmaGXKVWyM0ohZhqxRwQmaOlU3MQYg2uxa47f0A7ZxjHI9QdF5QKJypnnwxLeN1IG9gPYbExgwTS7DM7quOOhs0nbMlUHutQB83dCIVROkjTvWLbr1S0ZUsr/NBcvi7BQ6gef7VWYiu8nUv29hiqakHqXkpjcE50eWNqx7qDpXJOV5WSQAN2j2abe/0GRBfBO95jsNql7kgSJrezkxZMRFYildG1s7c+Al8+/hetuHvnqfWQD9+IkrL5uMxcJkwSQOGUqCfUJBsVODTKeBL0A0VvBvjTpm7wA8rNIMpLyqNUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVpAJFlpwQu6BqtFeWyn+b1Fdfg8AZQBA1jkBG7zkqg=;
 b=jH7NKGEZvekLEnb4imqZ51zgZctZ8ahFoX6bN71dgY6eFoL78LewWdmc5IoTEaCgRHod4DKBHhwLuSzWHxdnJg8diZvhP71pCOPPJdHa342d8r3OdcXUeWzo/GnI7s1Wuam1j3Estgu0wxLsf/vf+GS3yXARy1q0fPMXVyzbsnH6H3UiPh4dL6cd9l2kQ7jAGfbESMG8SB+m12j4DkBG5eYtDOJo+u+Z51TXdcTJFuZqNelQnlC99MCwIkLqttJpd4+N+iANAASUTi+kh8LLNKy+F/T0wkb6i+Mou/vMoeycZXD20OA8VKXuJvNjsKIorguwCUtVHlaHD+mkSZE8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Mon, 2 Jun
 2025 17:48:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 17:48:41 +0000
Date: Mon, 2 Jun 2025 12:48:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t 1/4] tests/intel/xe_drm_fdinfo: Use end_cork helper
 to end the spinner
Message-ID: <cu34fsihyvcdn5vwttz2z2y6nws5jtzjr4hm2axzm3xzbujz6g@32jofhxm6ic6>
References: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
 <20250520232027.351497-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250520232027.351497-7-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: dc96d654-6d2e-42d6-dc40-08dda1fdb631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ist2YJKVUerRqlhuwoNbCoPy5OAAiVEPl1VrBh23rKNpzwuiJpz8F4aImZrU?=
 =?us-ascii?Q?TPnYg+M21WbqCWGApCDvN/CArWvqZp88J51lyCXbXP6ZZR42LBazqXaM/aAe?=
 =?us-ascii?Q?Wdfe8TCJMgxc2cMwEX7whBKBQVR2EJNZA5mwohswY+rGu25bw0RpgfFwAzgW?=
 =?us-ascii?Q?dqGQvcLTPseOA86VJ553V6iV5AJ3BtmyfEfKZ9Vt4KTPfEqIpCZ7t6l8N9BR?=
 =?us-ascii?Q?pY4pgwSHuR/NETQ+41OV+OM8Sh2F6RDZybF1pR12Z8J92MBOm/wvdiBBvG+2?=
 =?us-ascii?Q?MvUSDIqrB+MmpwJgMpaETflfyEKvxvYLKqWBvZVT6Mm/o9HXxIJf7h5oFOue?=
 =?us-ascii?Q?pxPx/noZw6yq9sCI+A7iuMk+4CajFOp5jbtXm7sA5AwV2Ng1+BcxlyfQpIc0?=
 =?us-ascii?Q?n5oQwcCmUeHad8Q6pbQkoxKlEfEmk5dREw+PQR6tcev1sNMYBoJUjYkib1AU?=
 =?us-ascii?Q?SXbWTIrV2oLtDbhU2xN5HCrwCnQvzsO33Dp62V8UXVgxQqhFZzlDTNzXuYql?=
 =?us-ascii?Q?+OjFCuLN2ROixejGYGkgmJTtkYx+1CrtoDx8FOm3274FRSun2/y8un+2LgRz?=
 =?us-ascii?Q?mg2pPRpgmmTZLLsy6brxUXU4Pbi3FVoF9f74x+MDBdOkw1Y55PFIpQQDP1cl?=
 =?us-ascii?Q?/Frs+kZHDGsJvtCSr9lj6Qu2LR4ThoM/VmFqKZOtnWTqmrYhmSKKhFYySLa7?=
 =?us-ascii?Q?X48dnIMOxGb6Tc5nPAxY5hjMSFNRrfQuyujZNXF5nM+uVxMCoor7qVrG3/lO?=
 =?us-ascii?Q?bEapTvWQAON7UnLhb3eKKPJ6CbNCbnz1At3jOsl+Mk/2q+NUXRrNVa/ZHHd/?=
 =?us-ascii?Q?0Lb1msbBCq9ayabALvGfp8rTO2nQAIzhroyjwIi1WavgOW2KxEs2pzK4hCgq?=
 =?us-ascii?Q?HR4iQYh2OltQxyk6Cqla05wNOU5/3tJhIYCZSg9Wfh4N8ceFrwlWh8eNz80M?=
 =?us-ascii?Q?NpWdneesVUwCAyKVscHpiif/41h5sYJGfZUiWJm7C2clNAAyv61Po5mGFnFk?=
 =?us-ascii?Q?p+k3dUrzDjD1HuFxP87VY3m5wBU3Rcf+BDbU1mxv2fXmSGCQ64jUVXWmIBi2?=
 =?us-ascii?Q?9hbIhEqoECde/3GAfVTJ9sn8D6xGzmku4LN60RSpN0kM36zAby2QlZL+GHbC?=
 =?us-ascii?Q?YwgNkXMS5eZMXgm2Fiz/O6Dy4kKwNoVAmxYzGgOBIsXnviiqXDSR54+uJGFz?=
 =?us-ascii?Q?/Fnxi5UibrJmUKLTwtg4YzZQVnXbTwNLX740aJFc3hWP9nbKWiDk6uQZ08so?=
 =?us-ascii?Q?ZjpPyLpcIbRSw6TfPx2/ANZNXyeWTD5+htX2dmGTirygFwwVImfnJ734GTu6?=
 =?us-ascii?Q?5i49DHsnxUOhrH408cGjwT5pJ0BlkR+/figbmJB08Uv6dDcsQqliPsdxbaI4?=
 =?us-ascii?Q?ssV8udy7bc2h/RAt84peGimurGoACF/1tiFSeihf0jhAqrMfEnETcjwgTrbs?=
 =?us-ascii?Q?J3Uy3dJhG9g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ssO3w674UUFkx/MvP837R6wEy667HowtjebpcNmusMO7snWHSF0HDZhabmpq?=
 =?us-ascii?Q?0QX4UkUNe8GLk+pCWG3cT7Z5RZuDCSGU5wLKHT6jQF/2K0w43rGQZaLq0C9g?=
 =?us-ascii?Q?8Hvm99omEBECN+rMHlMXfMCWTrMMIAJByDR1ALX+tbYSmVN3JQSAhvStDTuf?=
 =?us-ascii?Q?dVXSlyd6oQ5WJxm0C/a6F/wy/50erv+TdVXUIo9To8sfXsBBYh5xnMG08bEt?=
 =?us-ascii?Q?TPbM9NkxzXyQHrHrmJqcpZRAuBkiP0e7ptWIgHVm/N6OAwf93ixeX8h3gylr?=
 =?us-ascii?Q?0GOdgzyUQHGQWLiTNQpRtDS3//vLyoPtcV7G7yGSAcniKGpVlwEIKd4zPLkW?=
 =?us-ascii?Q?LRCk0It9RTJrlwWd56fQVvlztXWDBFSpdJ6Llwg2QiTP16Z04s5sxwIMeX02?=
 =?us-ascii?Q?2KprbcV8wN/OnuFgZB2fjoEkgplSmOEd3VZwim9ZdDMS+zE+ug1KMnRY3Hpn?=
 =?us-ascii?Q?HnzGF3zUR2NRCUlT2w1OZYlB5cS1a5nDgNyTWaw226rRSow+PznJKUh849++?=
 =?us-ascii?Q?XSmICZ7F6VqY5aiud1P/9FYdvjROW7TNKJS38kILnqXux+9rRJVsqh8WATwo?=
 =?us-ascii?Q?b/RbKM/X6qCiMzPk5f7o475wEJQJ0sJfIjvgaar0Tk4ZBaSyHKGWoqRiUxjZ?=
 =?us-ascii?Q?0nU8Pv6olvmLEvwsUaa9LYgf0onJ0riEBdUrtgy4XFbcvklcKEJ58ayf1yRp?=
 =?us-ascii?Q?dlJq7tcbCgl7aG6MVbsEW/K3DRlW0LOjqjG1cJ+EnbPO+/2TJ9n8xr46h+nC?=
 =?us-ascii?Q?JnU0XyYHp/Uq1/rcmtSjC/CvrHZX1/wXu0rcN2SptOyEgQ4KUAB0lUo02NTk?=
 =?us-ascii?Q?5529tvzf+1Pe9xBSg8b+WUEjReGFw7vy41Y12H994kq+cCs2qZLnPZkvQqoM?=
 =?us-ascii?Q?FNlJL7SH0foUm9/RSRkwDyx7I3p2F//NaBJ2VoCKnz6/sOd2DbYmV68K0gfa?=
 =?us-ascii?Q?IqLkjyTul3rH0H/OylVc2Z4s7toaCcInBxDa/zskdzgqwgw6SS/Qur5hZLX0?=
 =?us-ascii?Q?9LLOdi2f9sg6F5EJTwcYScw2uEWVio6THGbi9RzFYOXJOKrFZsj+lBoM68Xf?=
 =?us-ascii?Q?JgYOSB5Z6U+V5e3OvA/2dZHfRTYPh4FgyrEZ0RZP4HKYB7M5wr3XSWBzs1YO?=
 =?us-ascii?Q?CMgLMXmqPRUTbGgRU+YqcGWIwM8PQncOXgSSAYT4tFBmLQxZlmoG8IsOcnEH?=
 =?us-ascii?Q?8yORFfDtdzGnqdsyPe21s5m9kOyiHkL7XHuEg9+2bH1ZN1JQAMtGFfCGEQ1f?=
 =?us-ascii?Q?M5xeCsSgEgaqIgRhLdwFp672czmbR+5TE/1OpiHByrSAZpV6jMt4hH0EvpbH?=
 =?us-ascii?Q?YJNGqvaDp7lORQRz0f2PaNjYPX55yHsitavogOCfp1x017OzTH22BVC7O/1t?=
 =?us-ascii?Q?inLpjsVCQLVDlRTLqwyWrvD9jk45BeS0uGwK7xLFyz6MpsDCkNj5vugiyADt?=
 =?us-ascii?Q?Z3mmPC3RUvTRoKVKRIfqvDcJ22EK/tLzGrkSHCSIkDqN+c2ptbb+YfMQxFOK?=
 =?us-ascii?Q?4odkI194oyUKreDH+x57QpBmqB5f79sqzeFuf3/7jBcWAElFbv1EyCN6EQyr?=
 =?us-ascii?Q?CDON4oPBSq5aC6ZcfDpsdfHrGhpvxn6FAWCozMFxJGNAyODn44wP0kc83AKy?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc96d654-6d2e-42d6-dc40-08dda1fdb631
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 17:48:41.4582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BP1IvEHsTyE7Kv4Wj+2FGvMJ9bonUCNkAmZemCQJB7tBpWcEAzddahNWhjrTKQLMVaMRSbbDOsgMvUr4bX3jYmp1ZJWjY6LA3EKFCHBoS2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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

On Tue, May 20, 2025 at 04:20:29PM -0700, Umesh Nerlige Ramappa wrote:
>Some cases require checking if the cork is null before calling the
>library function. Wrap this into a helper.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 26 ++++++++++++++------------
> 1 file changed, 14 insertions(+), 12 deletions(-)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 9a8811b4cd2f..83b7cd617c34 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -423,6 +423,12 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
> 	}
> }
>
>+static void end_cork(int fd, struct xe_cork *cork)
>+{
>+	if (cork && !cork->ended)
>+		xe_cork_sync_end(fd, cork);
>+}

not really a fan of these local helpers that are later copy and pasted
everywhere. IMO we should make the lib/ side contain what's needed. But
I won't block it here and we can migrate it later.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
> static void
> utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
> {
>@@ -450,7 +456,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>
> 	usleep(batch_duration_usec);
> 	if (flags & TEST_TRAILING_IDLE)
>-		xe_cork_sync_end(fd, cork);
>+		end_cork(fd, cork);
>
> 	read_engine_cycles(fd, pceu2[0]);
> 	if (flags & TEST_ISOLATION)
>@@ -497,7 +503,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
> 	usleep(batch_duration_usec);
>
> 	/* destroy queue before sampling again */
>-	xe_cork_sync_end(fd, cork);
>+	end_cork(fd, cork);
> 	timestamp = cork->spin->timestamp;
> 	xe_cork_destroy(fd, cork);
>
>@@ -526,7 +532,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>
> 	read_engine_cycles(fd, pceu1);
> 	usleep(batch_duration_usec);
>-	xe_cork_sync_end(fd, cork);
>+	end_cork(fd, cork);
> 	read_engine_cycles(fd, pceu2);
>
> 	xe_for_each_engine_class(class) {
>@@ -568,10 +574,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>
> 	read_engine_cycles(fd, pceu1);
> 	usleep(batch_duration_usec);
>-	xe_for_each_engine_class(class) {
>-		if (cork[class])
>-			xe_cork_sync_end(fd, cork[class]);
>-	}
>+	xe_for_each_engine_class(class)
>+		end_cork(fd, cork[class]);
>
> 	read_engine_cycles(fd, pceu2);
>
>@@ -613,10 +617,8 @@ utilization_all_full_load(int fd)
>
> 	read_engine_cycles(fd, pceu1);
> 	usleep(batch_duration_usec);
>-	xe_for_each_engine_class(class) {
>-		if (cork[class])
>-			xe_cork_sync_end(fd, cork[class]);
>-	}
>+	xe_for_each_engine_class(class)
>+		end_cork(fd, cork[class]);
>
> 	read_engine_cycles(fd, pceu2);
>
>@@ -692,7 +694,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>
> 	usleep(batch_duration_usec);
> 	if (flags & TEST_TRAILING_IDLE)
>-		xe_cork_sync_end(fd, cork);
>+		end_cork(fd, cork);
>
> 	read_engine_cycles(fd, pceu[1]);
> 	if (flags & TEST_ISOLATION)
>-- 
>2.43.0
>
