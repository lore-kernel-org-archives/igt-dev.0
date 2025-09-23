Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D95CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52C010E601;
	Tue, 23 Sep 2025 11:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5uy9u6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE8E10E5F8
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758628637; x=1790164637;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uMfYp4aPfdMT5kphwXe8hYY7f69gzU5UMK4Ot+DUHd8=;
 b=K5uy9u6h0kFabK8jkRDJvk/UlhuEprbHjMVAezyOVmZNFXar/MWeK8CT
 hed+S9pUGZOfwblZS2Yfdsu2A2WLU1Frgzkq5e4rTwhQH4+lstegDBm6P
 LM54DptEs2KX93tdYxj9dKmfKal52BSOYyrx82ixw6G9OSbkn1FQGoU/R
 Ep06e68lu8+KFGtYv+y7tCbAUyiPAQzu+2csP5sgowbUaZ0lX3/Wzorxv
 tCvEfCrBx/3lWckwkX1/EkA21D4HBJ3XaJA16nWUnBORn48UjzdskSAcJ
 B6/Koe8LXh8Q+N6sCZGFQBP40ZbfwKvY7q5ECyngEfRPH+OYX6Ncn6kKi A==;
X-CSE-ConnectionGUID: +TuaK/OBQbyBM0RHBwccfQ==
X-CSE-MsgGUID: f/4nIhKpR8Gozjxujh4YnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71577330"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="71577330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 04:57:16 -0700
X-CSE-ConnectionGUID: p562HJE0ReGZcXOBegT6gA==
X-CSE-MsgGUID: IUMWgcioQ6KbvVjkf13c5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="177196245"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 04:57:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 04:57:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 04:57:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 04:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZY3yZsbbmWcJoPLSKk3XPvZ2zATwmLwVIN4o876ST1KR3l0AGjXQSrtisFsSl1hkN3TtlAjkIXkobH7Bx3r1gPbIA7MD9rKQq7KUIDRnLhaJyU7NHVM0w+6fO2mMgDnBJK5y4rJ4GztVT+UU+2NHESX78U2RvPzQB5BBcSDfxE77RwrCjE+Vu5f1+oZC1949LrH8zkommedvqDX1pBtwmiRTqNRfwx6uTetTwtogZSXtBZ0f0VDQQyE182j+HNTtMOcTUmWbxl1KkymhmGj9WKfjPwzdqI96rJhN9twTITLubrHNkSJ1uEz2gDMF+B16wUBdS8honwTiXh48myIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU4Nk+Vm6IoO39vnrCXElHR7vJBkjX8/Ak+fj7x2zg0=;
 b=KUpTrekkr201KO0Qq8O59LASvZ/OFiFODxki2D74AjsKBJQeHyMtgkeXNi7gfFYSkNclAW/nVk1gzjVG0dd1Dn+euWk8m0tkPxb26r1/mobvHY4rVmvPrQekL6uo4v09Zz7KHFiv16m0GEP4gcrbZCO2ISpxAge/vM6wpxhWppThTJTXrp8Nt1KxFj+WqzZ+OLTLh8dgL1Llw5w6Ey5Kz6ix3wV5ryDmNZ9kU1QHTq+IIv82N5cjdbmtKtDnD3KZRsZyMA6uME8JNIVEIMzEW81qCnytf99XSstbAgj2TRIOHPnioGVhHIMHDsey/Sh0AaaqPzFnK3S7ONF0ckWh8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB6767.namprd11.prod.outlook.com (2603:10b6:a03:47e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 11:57:08 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 11:57:08 +0000
Date: Tue, 23 Sep 2025 13:57:00 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_mix_modes: Fix, refactor and cleanup
Message-ID: <aNKLBIiC_sAn1VpW@fdugast-desk>
References: <20250910123946.1144932-1-balasubramani.vivekanandan@intel.com>
 <20250910125257.vshhygh3iq3ir3rq@kamilkon-DESK.igk.intel.com>
 <aMF6g_jTDt40Zq6g@bvivekan-mob1> <aMGTIkO3PuK4UJ9y@fdugast-desk>
 <aMJwWZxXZodsVHHe@bvivekan-mob1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aMJwWZxXZodsVHHe@bvivekan-mob1>
Organization: Intel Corporation
X-ClientProxiedBy: VE1PR03CA0058.eurprd03.prod.outlook.com
 (2603:10a6:803:118::47) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ede15e-6978-43e5-f540-08ddfa985287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SjXF+W/sZImDnVipqDVmroz6pDPtBVt8FehVDIseuCkVRx4UdpDlIMMLa/RN?=
 =?us-ascii?Q?25WraqMyxNbqWqIf+9ozm7WMqH+n4c88eyfJxm+01rV/hDxJe5opaT6hy/J+?=
 =?us-ascii?Q?XOyj9u7g4L9D7roab0ro/vTxnZ/ADrDYVFpn5LlrHJL17MoQizgsjzNxC7Ao?=
 =?us-ascii?Q?32ZOP03bRbN6V5GR5rkrU1+zyG1w37FbqFj1lxApLMJ4x5KgmwpeKwh3qT9X?=
 =?us-ascii?Q?i/ETnrmJmDC3TLkK8ok/+elo+6rTkEGhROt+2kwELLIdhdSy0mPVSht6KSkr?=
 =?us-ascii?Q?8FovkuxOJSdesOTuZsnG/vIWOUJmBtUZlaqHfG2Q1fhOza0OSaOk90eIDfW5?=
 =?us-ascii?Q?/xCNSxjBBRTKRSGRis7+OwMbumU12PjcbTzb6AxqjpI3FNG4LzulbBZwwy1G?=
 =?us-ascii?Q?GbPSdsE8ciuBDgXZCky9jl+IAiznEALwRoiig5bFCgPBKoi8DeViPccrGj3Y?=
 =?us-ascii?Q?+gYL2gVE1hhbbliPb4wXTddCQuB0mPJ2L9U1beUJqcZ8cfYHCZNNBtnb24V8?=
 =?us-ascii?Q?wYVylv2yMk2sCIJXTIRXMJbF1Fzi2Tn1tKfnfUW4X7MIDU0YTPinlSAYHbOa?=
 =?us-ascii?Q?kkbZsR19kPHA83HphdfSLvizwHFXGsz5HxRI/uYJFJbSSdn7O9XE2max27Y8?=
 =?us-ascii?Q?bmwkiSwPtivRoHziuCPaHNwq3Gz85fUwqrIK38JkSTpnWiL3Tiz89kmPF6cT?=
 =?us-ascii?Q?hAkOj44nhAWEoLn83Du2yt4kd+2oe/8vxU1NL1HQbAjoqV+N1ot9C3kSc7Ms?=
 =?us-ascii?Q?LZ1cQcXcyugZv/jVorZrE6M1yHk5rMBQuCAdaSRt62JdHdSoIhVCswX879cf?=
 =?us-ascii?Q?iRC3wP7L+a1+7UBpck7u6PlBGXVh26BoGD6LmOekaqTjCYGuXvQmFyJyVo0o?=
 =?us-ascii?Q?RU04fv8YQo/9CLOAEVw6XPtoOlDmNJbMIckyxp5GJg2Ws4F43ChidNjYPKMN?=
 =?us-ascii?Q?1bnWJzMAIt8cxGT+X+6YoVDnUYospoG2+tRuSC2D1oEGLQxe7ORlil5Pd/hu?=
 =?us-ascii?Q?R01DZvwTckrEDC39XgGusc3frwh7PrTsFXeP2nbD2SkgNIOgbr9Oux3uZvuM?=
 =?us-ascii?Q?jXCQx3FjYTFyS2s49cNM8DSJ+/zLvwlQkNEH1JFtcmUc8pL0ZtRiyTUyiUy+?=
 =?us-ascii?Q?zwx0ItrC1Tw2GjP0k/yDInlsrMOop5mYNnYBPoY69+3gdbGnrejY+iyMlkQY?=
 =?us-ascii?Q?jr5Bmn0s9EAM5CkpeO7EGiC7NulNkf9IFXkiA4yhcym6ZeV7x3Ak/KjKCuHm?=
 =?us-ascii?Q?PFa7hjzVIV8yjW8109uFdNNQnPY4PwPEIN4dGrWWg0hrafrYmtJL0VlAQbgP?=
 =?us-ascii?Q?PoOe7AD7lWPeXH0yziZNeH2waJVQLfCie5szQ3Yiv+lDh/oB94Mu4PRQ4+Xu?=
 =?us-ascii?Q?3Xhg6SFrehgG75CLeCC941l7LXkSLVhb/f7G0gnEJmqWfPADVbsg8vj6F4UE?=
 =?us-ascii?Q?szS8QeQtRr8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AWQSrV8F6exFYGFomODARZJVuYRomJUz0lRlM/f1anBk960ZiSK5p598mGP/?=
 =?us-ascii?Q?jZXms6h0ZFDgaBtjMheHdNyq6O76Pfyql5HDrsPcUJBKom9wZO2KdcAa4NA1?=
 =?us-ascii?Q?U6lhuYTMA0u+tXJlUynAmkiuO7oKo5KvXOD794BQmi8Lbo7cUB5wDu+y2BN7?=
 =?us-ascii?Q?9ima2EpOzaR/clid3GQucZvnU84CwqJmmFjBcphxlBQmCrlx610X0cjjkseU?=
 =?us-ascii?Q?EyPdkHn+28qWQkM+Gq2KP/II+oYuELhiYAfxBxXhEQKaSXk+fHWhDdULWfeB?=
 =?us-ascii?Q?i1y5EcX+1HKIuJGULE8YsUPfSn4nBuDfa7PPx1qN0th0sWNSK481JTU4HYQH?=
 =?us-ascii?Q?F2L7JulEKCdVz3chhPzMkDgfzPfh7n4Yz12UZtGZr2yo/uRG4XhykYZbMZb9?=
 =?us-ascii?Q?BiwJ6sEK+jUhq83S9jER+AT/YZqRwZGFjm0xChaN3WwiHvimT9gnsvmQF67j?=
 =?us-ascii?Q?8SKZQwDG26Ko++YmLRoXpofL3eMjGFKFKedRz6+cHn2wsZZAaP2Z02EcK1UF?=
 =?us-ascii?Q?GgMOdEWgpaWG8+USStOQ6Nb0uNdjDpOhp1bGSsrfVhO36sQ0UswqnWj6yiFS?=
 =?us-ascii?Q?297G8p3jS18VAfFpyAJJnPGgfwXJ8lqsN3PR6MpL2BItKlgORvCD6zU0QhiQ?=
 =?us-ascii?Q?Dwod22rhIcF/OYQ1dm7uNp5/Ps5fB06VfmJY0nn6fDax+PRo91O3Mkv39b5U?=
 =?us-ascii?Q?YR8AYxYAh3Je7k6+4E7s0NF809LCMOLCxlCFYrDm2FuXrLW3+I5p198NWW+R?=
 =?us-ascii?Q?gN3MAf/YzC8Pjh9caoRKB9++UjS7FJQD2S6L2gc6oasDDIUhkDhYno98u2Fa?=
 =?us-ascii?Q?0Tmlf/+AWv2jky2Wb71rb6fsE01k/D4nuSFZwCVI+TujpkvcpufmYt+dvs0M?=
 =?us-ascii?Q?+2QP5a/ihnIP2IYsc+g46Pzh6lKz2FKLYeh4Qj/NSiv0M5LmqW4YcIHrUFdu?=
 =?us-ascii?Q?gBDNUTFl1eNvnHKc++6aDqM6mXCU1kJS12Rr0RVFiKCHognbGz1XEmUvbxOX?=
 =?us-ascii?Q?JtSVAC2zUUtVngu8dCjoSMzRciOXPM2Nvi/jUvIcTSDbVmPSfEc94XYbf3ay?=
 =?us-ascii?Q?r1ENlDu3Tg12xSi6f/tnuge/jqxNCWgEHg4qstVnJVK6koAH+u61dRMm4MFD?=
 =?us-ascii?Q?sIMXffXhxzLjk97To4gI35kM5PAEN9c9zitCrSRrPHdk2XIf3rNBYnknRSTP?=
 =?us-ascii?Q?jq0eZ0JGnkWt5dCT4eao7xmNjIqg3jjjZ5mp8FtcDADkFN1tG5ptw2H7UqGS?=
 =?us-ascii?Q?VazLhaySB4Id2h/4i9+SwD2ki3P1njRk6pFJyYVBQnE6M47nCb9fLjc2sYrp?=
 =?us-ascii?Q?OcPlMF5U1G2qwohin8bxAg/DGyMwnJxhahKYRDUoaKrJ91SG6EUW9dfEAL3j?=
 =?us-ascii?Q?kvFjq9n9J6JIxPRpGmNKe3h1aygJRGyLFsBADYY8tTR5z8WjmHYyX9Ceh8Vq?=
 =?us-ascii?Q?7WOyHB0CP5hF6hc5I6tk5EAIlIYz9QiJhkKmKdwN5aZXNSuXHKbzEoJevAIk?=
 =?us-ascii?Q?+p3Q6CmM6QqdQp9gx2rYjCUKpzJIal28b82AMyJaiCbxJAOJ6E53DruE9zvt?=
 =?us-ascii?Q?pLyW7L1A0xmMbQ0vjWtnT+eOxLiL8+9A09L+ujCxQRmAK5IeVRYKif7ie+By?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ede15e-6978-43e5-f540-08ddfa985287
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 11:57:08.7380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZoQ7T2CfqxoEA1KY/B/FuaUgEG6tQmOfa3iKPWZcX+gUaDbEf3a97Oo47RnX0ZlE3SSnuF5lple17WeJ5v8DdjdPucIt8okBpyFEMFGMhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
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

Hi Bala,

On Thu, Sep 11, 2025 at 12:16:49PM +0530, Vivekanandan, Balasubramani wrote:
> On 10.09.2025 17:02, Francois Dugast wrote:
> > Hi,
> > 
> > On Wed, Sep 10, 2025 at 06:47:55PM +0530, Vivekanandan, Balasubramani wrote:
> > > On 10.09.2025 14:52, Kamil Konieczny wrote:
> > > > Hi Balasubramani,
> > > > On 2025-09-10 at 18:09:46 +0530, Balasubramani Vivekanandan wrote:
> > > > > After the recent change of xe_exec_mix_modes, fixes were required for
> > > > > the following points
> > > > > - A local variable spin_arg was used uninitialized.
> > > > > - There were some variables and macros left unused.
> > > > > - There was an unnecessary loop.
> > > > > Along with these changes, also some refactoring done to simplify things.
> > > > 
> > > > Is it a revert of recent changes? If so, it would be better to make
> > > > it a revert + fixes, e.g. in two commits.
> > > 
> > > No, it is not a revert. It is an improvement on top of it plus a bugfix.
> > > 
> > 
> > Kamil is referring to the partial revert of commit
> > "tests/intel/xe_exec_mix_modes: Remove absolute duration value"
> > 
> > Your changes bring back absolute duration values which creates some
> > issues, please see that commit message.
> 
> The wait time you see in this patch is not used for the same purpose
> timeouts were used earlier. It is actally used in place of
> timeout_short.
> 
> timeout_short is defined as 1 nanosecond. It is very small to validate
> what is intended to. In the following code snippet it is expected to
> validate that the interrupting job is still not executed
> 
> --------------------------------------------------------------------
>    if (dma_fence_job_spin) {
>            igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
>                                               USER_FENCE_VALUE, 0, &timeout_short));
>            xe_spin_end(dma_fence_job_spin);
> --------------------------------------------------------------------
> 
> But a one nanosecond wait won't really validate it. We should be actually
> waiting for a long time to ensure interrupting job is never executed and
> waiting for spinner to end. So I have replaced it with 500ms wait.
> 
> This wait is always expected to end with timeout. So it doesn't affect
> execution on presilicon environments. It has been validated on both simulation
> and emulation.

Thanks for cleaning up the unused variable and missing initialization.

The loop was disabled with "#define NUM_INTERRUPTING_JOBS 1" but instead
of removing it, it could be interesting to enable it again and test more
corner cases by having multiple submissions of interrupting jobs.

As for the timeout value, if it is incorrect then it must be fixed indeed.
Do we have data showing that 1 ns is too small but 500 ms is enough? 1 ns
is used elsewhere, see for example "timeout_one_ns" in lib/intel_compute.c.

Francois

> 
> Regards,
> Bala
> 
> > 
> > Francois
> > 
> > > 
> > > > 
> > > > Please write all Cc before s-o-b:
> > > > 
> > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > Cc: Daniel Charles <daniel.charles@intel.com>
> > > > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > > 
> > > > Regards,
> > > > Kamil
> > > > 
> > > > > ---
> > > > >  tests/intel/xe_exec_mix_modes.c | 101 ++++++++++++++++----------------
> > > > >  1 file changed, 52 insertions(+), 49 deletions(-)
> > > > > 
> > > > > diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> > > > > index e65854d0d..b74247bc4 100644
> > > > > --- a/tests/intel/xe_exec_mix_modes.c
> > > > > +++ b/tests/intel/xe_exec_mix_modes.c
> > > > > @@ -28,7 +28,6 @@
> > > > >  #define FLAG_EXEC_MODE_LR	(0x1 << 0)
> > > > >  #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
> > > > >  
> > > > > -#define NUM_INTERRUPTING_JOBS	1
> > > > >  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > > >  #define VM_DATA			0
> > > > >  #define SPIN_DATA		1
> > > > > @@ -96,9 +95,12 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> > > > >  	uint32_t bo = 0;
> > > > >  	unsigned int vm_flags = 0;
> > > > >  	struct xe_spin_opts spin_opts = { .preempt = true };
> > > > > -	struct timespec tv;
> > > > >  	enum engine_execution_mode interrupting_engine_execution_mode;
> > > > > -	int64_t timeout_short = 1;
> > > > > +	/*
> > > > > +	 * This is amount of time the test will wait on interrupting job fence
> > > > > +	 * to confirm it wasn't scheduled. It is set to 500ms.
> > > > > +	 */
> > > > > +	int64_t job_wait = NSEC_PER_SEC / 2;
> > > > >  
> > > > >  	if (engine_execution_mode == EXEC_MODE_LR) {
> > > > >  		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> > > > > @@ -153,55 +155,56 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> > > > >  		interrupting_engine_execution_mode = engine_execution_mode;
> > > > >  	}
> > > > >  
> > > > > -	if (allow_recursion) {
> > > > > -		igt_gettime(&tv);
> > > > > -		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> > > > > -		{
> > > > > -			struct xe_spin *spin_arg;
> > > > > -
> > > > > -			if (job_type == SPINNER_INTERRUPTED &&
> > > > > -			    engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> > > > > -			    interrupting_engine_execution_mode == EXEC_MODE_LR)
> > > > > -				/**
> > > > > -				 * In this case, jobs in LR mode are submitted while a job in dma
> > > > > -				 * fence mode is running. It is expected that the KMD will wait
> > > > > -				 * for completion of the dma fence job before executing the jobs
> > > > > -				 * in LR mode. Provide a pointer to the spinner to the interrupting
> > > > > -				 * dma fence job so that it can check that it was blocked, then
> > > > > -				 * end the spinner, then check that it was unblocked and completed,
> > > > > -				 * see "if (dma_fence_job_spin) ... " below.
> > > > > -				 */
> > > > > -				spin_arg = &data[SPIN_DATA].spin;
> > > > > -
> > > > > -			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > > > > -				false, spin_arg);
> > > > > -
> > > > > -			if (job_type == SPINNER_INTERRUPTED &&
> > > > > -			    engine_execution_mode == EXEC_MODE_LR &&
> > > > > -			    interrupting_engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> > > > > -				/**
> > > > > -				 * In that case, jobs in dma fence mode are submitted while a job
> > > > > -				 * in LR mode is running. It is expected that the KMD will preempt
> > > > > -				 * the LR mode job to execute the dma fence mode jobs. At this
> > > > > -				 * point the dma fence job has completed, check that the LR mode
> > > > > -				 * job is still running, meaning was successfully preempted.
> > > > > -				 */
> > > > > -				igt_assert_neq(0, __xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> > > > > -								   USER_FENCE_VALUE,
> > > > > -								   0, &timeout_short));
> > > > > -			}
> > > > > +	if (allow_recursion) { /* Main job */
> > > > > +
> > > > > +		struct xe_spin *spin_arg = NULL;
> > > > > +
> > > > > +		if (job_type == SPINNER_INTERRUPTED &&
> > > > > +		    engine_execution_mode == EXEC_MODE_DMA_FENCE)
> > > > > +			/**
> > > > > +			 * In this case, jobs in LR mode are submitted while a job in dma
> > > > > +			 * fence mode is running. It is expected that the KMD will wait
> > > > > +			 * for completion of the dma fence job before executing the jobs
> > > > > +			 * in LR mode. Provide a pointer to the spinner to the interrupting
> > > > > +			 * dma fence job so that it can check that it was blocked, then
> > > > > +			 * end the spinner, then check that it was unblocked and completed,
> > > > > +			 * see "if (dma_fence_job_spin) ... " below.
> > > > > +			 */
> > > > > +			spin_arg = &data[SPIN_DATA].spin;
> > > > > +
> > > > > +		run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > > > > +			false, spin_arg);
> > > > > +
> > > > > +		if (job_type == SPINNER_INTERRUPTED &&
> > > > > +		    engine_execution_mode == EXEC_MODE_LR)
> > > > > +			/*
> > > > > +			 * When main job is executed in EXEC_MODE_LR,
> > > > > +			 * interrupting job won't end it, main job should take
> > > > > +			 * care to end the spinner
> > > > > +			 */
> > > > > +			xe_spin_end(&data[SPIN_DATA].spin);
> > > > > +
> > > > > +	} else { /* Interrupting job */
> > > > > +
> > > > > +		if (dma_fence_job_spin) {
> > > > > +			/*
> > > > > +			 * A spinner job is executing in the DMA fence mode as
> > > > > +			 * main job. Until we end the spinner explicitly, the
> > > > > +			 * interrupting job won't be scheduled.
> > > > > +			 * Make sure the interrupting job is still not completed by
> > > > > +			 * waiting for on its user fence with a long timeout.
> > > > > +			 * Wait is expected to end with a timeout.
> > > > > +			 * After that send signal to end the spinner job. Once the
> > > > > +			 * spinner exits it will make way for the execution of
> > > > > +			 * interrupting DMA fence job.
> > > > > +			*/
> > > > > +			igt_assert_neq(0, __xe_wait_ufence(fd,
> > > > > +				       &data[EXEC_DATA].exec_sync,
> > > > > +				       USER_FENCE_VALUE, 0, &job_wait));
> > > > > +			xe_spin_end(dma_fence_job_spin);
> > > > >  		}
> > > > >  	}
> > > > >  
> > > > > -	if (dma_fence_job_spin) {
> > > > > -		igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> > > > > -						   USER_FENCE_VALUE, 0, &timeout_short));
> > > > > -		xe_spin_end(dma_fence_job_spin);
> > > > > -	} else if (job_type == SPINNER_INTERRUPTED &&
> > > > > -		   engine_execution_mode == EXEC_MODE_LR) {
> > > > > -		xe_spin_end(&data[SPIN_DATA].spin);
> > > > > -	}
> > > > > -
> > > > >  	if (engine_execution_mode == EXEC_MODE_LR) {
> > > > >  		if (job_type == SPINNER_INTERRUPTED)
> > > > >  			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > > > > -- 
> > > > > 2.34.1
> > > > > 
