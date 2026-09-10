Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187FFC79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 16:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAE510E29F;
	Thu, 10 Sep 2026 16:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HdSv/btr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425C189BAE
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789056230; x=1820592230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OS7Ekyz0E6e34NqTvA0oDfEebiWfgcIb0RHOVp9g/DI=;
 b=HdSv/btrq4wImVQRdXKwKr/2aRgIHJ0SdK/efSq9DO6sTljh7WXErrpO
 1aF9VG1J++aIuEH2ajXT6Qif44x+XEJ3ixnjgWOr6PtHu8eJmZJD9/bw0
 /A8W7QxWYI3Rqle1VXoCFxNwWAhuTgki5K6oXC4SX4j1KcicCDA+3o0XP
 54PhpLS5bHJFxMEa7roZFWV+c0OC9i5/BxVLmzv0qAO6dPAgfWxtvnSam
 /bmqX0M6+92Tx28Lcv0GuIrZjm8nTtRRvWpD8EjRNFIl3GVIgUhUHux0b
 bN+/fGkHB9mjA3+tblbdloY/FtaG1Y4RnyoECRaKwdUsWqZvbwSHC1ACg w==;
X-CSE-ConnectionGUID: pKhzIfPrSfG1qBZfGAmFmA==
X-CSE-MsgGUID: Tmfxl5BiTFuh8apVIL5qgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101030294"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="101030294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 09:03:49 -0700
X-CSE-ConnectionGUID: fEwGpvRvQXqq1/5ax8JQGA==
X-CSE-MsgGUID: sMTHe67nRk+hBbttXiE91g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="270322887"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 09:03:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 09:03:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 09:03:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 09:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBnbDV+NWhDWLOf2CIFuuXf2it4ZkoSWCLBmt4V/bmDjnPEi6kWnzDv+fp5KUO6GiTSEBOvWyEGBFoodmxHt5li29XrcItsuIw86XrzE4shL2dEAVQLpUK8dKQXeoZHaRNZCVeaHHu+QWnLjYaU2+sOo0GA9av2zoA8JsCUgWmFzpHC1klnzaDaofNB/NoZsnyf6gHRb8jDR0pwuzVP9/0xoPJ2rbdWMTx1qbbjXEwUIbuOembAxLSWI95SwQCLxkW1bwHQIK9J5Q4wryNbHtCzqjV6IhN7ocO8BOPSgXm49BZ09uxkj7KF/DCxpCg6ywrl3z6S8uzCGNPV0ISAmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScjdZ2jygRknxyQkdPobtguoZu4tg+HNphOGp/JjFiE=;
 b=Jupcwpqfu7FRMtwm5RAN+fT7VzqIUhvyaFg4jeXQOltOoWq9iKEPFQa9EDhkwXyi5HRCGr42Di2W4Ny2/WC9HrWevA6aL0nCuDx4jyTTFO8k8yKE/j7oOaQWeczu3Xkh9TurUCOmyVehUV5ZwXo/k3U7ieujudwDsdFhgrO+g0KBchYb55fGQzIvv7vSOHSYKzUd5BwVJWKD5GpYH/dDSPUb9Zl/Z64i+Zl2LeJ1FXgR2JhKo9JQrxw+Cw4jYWtU/1+NTXhLk3xjHUeS38Zr8fYo4yrI+MEqrXwKeYke7EHGI3q6kr9gly8ErdJLkDo0b58QF1SYtqCYwqmLRf2cxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:03:45 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 16:03:44 +0000
Date: Thu, 10 Sep 2026 18:03:39 +0200
From: Jan Maslak <jan.maslak@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 1/1] lib/rendercopy: Use the Xe2+ depth buffer packet
Message-ID: <aqLU2yLfbzFD6p5U@ART-DEV-395>
References: <20260910123935.4183522-1-jan.maslak@intel.com>
 <20260910123935.4183522-2-jan.maslak@intel.com>
 <2999bd00-ef43-4f51-881b-81545e827a2d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2999bd00-ef43-4f51-881b-81545e827a2d@intel.com>
X-ClientProxiedBy: VIVP296CA0120.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::8) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: 95642bd2-b58a-4a04-45bf-08df0f551725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eFky87rBN9/tprx5wvlNMyKlCmSxi4DA4bkeVJC6sr5KzEJ6Rp1pt6ZqKtSlrB6xrJGEuZKo5IaVjh9VkTn44Xy4vmbN9gNDaFWmVHIx9oQ4h70cBMF+kDVV6xmsShGuwq6JBLOkVkT6HK7cHcrXLEB8H4EKoDXtsc6ALKyuceESL7EJ+EkDgzMxPBQ6alQ74jHub2e5x5uRswp9H5Dn4CQ9e8qPKMD2WAjEryAZkW+xHl9CRnKQH1aMTBeDkCq6Qm+aSRoN6Dkl+fvYWQastdc9M1TJDP0AKNhFi7hGVcZXES75VJpKFiC39SBZwtiLGuB1oPNK/YNE8v7bJhSp7+01jMoxhsni8V63SzNqoSiAB6mhXSTipEmygQs1S5N2RYNpk+ntd/SO1q6x808HK2T0p0U+rK4rOYWUghoeo6yQbUu/nePP4V0LQbgFgu8fmrrgSSDI6VScbKTWe4vb5KFfEhT00EJUWH3lWYN3vbhM5FFJLbJOT/1K5CTIb6qnXQZkGmu4Kut8CuMeJLbqAObWzofKrb+9grSAiKxSC4KKWAMeiJ/XV91iyDbVWd7qnPfq+SgWQansoUS0xSKM7PL1v4fSE8adn7apIaqGfMoknqnIO4p2FSwVJEvhmjsGI9ywHV9lssCiHucgDunbRupepOnyEfaAnjKGL7+i7YA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lCYOUYyd0fN0eRQ+YVD639txhEPWa5MnW4H9eYK1dnRiQRM59mVm3o70Dd2M?=
 =?us-ascii?Q?z6ykMFiZ/q0QzrdHbD4dw70b9oHmKko6IszP7redCn2zvYXjws6HjKLfifDm?=
 =?us-ascii?Q?izJ3wztQ/N7xn8iF0VRwilT8r6/4IY86KCbQVJ6TT3P2KQiQdeyRl00mgIJX?=
 =?us-ascii?Q?1BEHv95jQbArwmlQaw9QuQ3QN+duTeuOrBllb4GWlzsRSyKKGSwlORVQrkTT?=
 =?us-ascii?Q?bMTHzLWw4kWwCxyEwct0z/MTqQKFdr5URIa7BHPsvq/FYLKxJGfAsYJXcvNQ?=
 =?us-ascii?Q?A+rLvHsyTR/kFFYf+Gaivaxo0gkUTuBj88Fx1xFcpXjW4tUQKerWBP9cqN1t?=
 =?us-ascii?Q?nd3TC5Qw90NjTxeW5OvaO9krPrLRrIcmlN4T6tnWjGM4jQnjK3+w7FCjdIGL?=
 =?us-ascii?Q?1SBX8RleWLnRxK+9Pw+A1j+PX9jfJUYFPyZ3bX1ysWtoxo56Tww2h+YP2Kon?=
 =?us-ascii?Q?x20Jx8hGkx9UI4aPLGhXHPRz7d+7t43+rpbtRTaq75N66EDSKmCgtKYnuHDb?=
 =?us-ascii?Q?m/qojlYCFaCkwvhPl6WYflcb2QZCwMeFNyZKDbIAX6KxdQ3U0W0mmE/6hZys?=
 =?us-ascii?Q?+iWmmKk85hbzTRIHAeWCpvqk/wNL6KgCkw+jS30O7OnEqBGWBCaov3B5Ngfo?=
 =?us-ascii?Q?LzPggoU/GsVoFLOC4qlZLkPJTnpmaSgDvAKklw2j9UxBkIHBg47yb3CfS9VH?=
 =?us-ascii?Q?aJdUh3mfahzAHjhDMRfAY1J01KBI0ApZZufcqjgzU+dl/t0L16OH6SmNW6Fs?=
 =?us-ascii?Q?9cbiXkA1HMI8MFxozajveS/xdCV6CbPZhAJ7qk8o7HfzoGbDx8OS9eri5s9S?=
 =?us-ascii?Q?kzSbQtCFjGHho2d58QSqAam63XOw4mkzmq/bNmrDF2+opXq1YslH32iW6sq5?=
 =?us-ascii?Q?HG0L8Oox+ODyHZCChc1EQMwa0B3GabCbGX62a735Dgu1mLyPtLJfRRYNjSpI?=
 =?us-ascii?Q?j15nkbZBk3vxHe9xZeOpXs95361D9picnl9SvTytpsA0plCl2FvXteNWc/GP?=
 =?us-ascii?Q?cLMmUPQiMY1jQ3KH8xzyfkcAZP7kS9yjDT6C+vVdZzXDojPT5IrW00DqyOSJ?=
 =?us-ascii?Q?C9VOd5xhvdk27qUOmjlFQ+vvosnWKjlvUEDJbvF80utZ/hBSIyZt/zVhARFS?=
 =?us-ascii?Q?EJRkegGgPMfoTs3Thimfob22YIpH1NDfp6qe7dCYlZQpGL5IsrYHWw1KKetz?=
 =?us-ascii?Q?kgcd8l7eAQnz/+F8JU6+quvlyOrV5RJkmHyLQ/pHSl0Q81BPQe0De6JaQ4sf?=
 =?us-ascii?Q?7KKO0QEFOjHqCKCPoYGZIwvRj/Jvf0XD+k1II+vrJLPsMwrGUI95pLwNUjas?=
 =?us-ascii?Q?OoDQhvpeNNhYW6LUr8OzjgUKhIzunq66/VQrZYfA9NCSomRvZ8G9kAnoQXcD?=
 =?us-ascii?Q?uAxUhvj/QvmgMB1+kSnZSl2gb8zdWMskiY+q7tshO401JlnM1U8OTvuoGN6R?=
 =?us-ascii?Q?gEJNTbY/t/MCtDKFK4hyqnigBEAJnhFKDLdPSGp6kW7jkj3a6HWXo4oYSyUo?=
 =?us-ascii?Q?VPFvsr5y0atog+jQX9cyil/pELW+uHpFjaMaVOvd9o1MOg5rSvpy/HH/UwNc?=
 =?us-ascii?Q?jJVhQvtTCGMocCc/zL+gMot9PIVrdloKS2/OVBipaHUNkCJKeOCTFjUOBVII?=
 =?us-ascii?Q?hELVPrSwFUjf3MP6tfaKvNEFRwaryGvWN7f/PSREQT0YQUhXOUljVYy03urG?=
 =?us-ascii?Q?grX1qMVKGP4KMRulHoJQdSKQV/XpBbDtwfoGdH79CJRt3Fj14Z49aeIUeLGO?=
 =?us-ascii?Q?hzrMaFihVQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: wEv1NdNRPIhJJrrN7+j3Xkz7DDcNj1AF6ULANbMbtS8/IJ3DvfjcrkBatUP15k0KpolphLzwBGpY8bQoYQsAHOutc7hn/UYSdm7zQg0habGWOPf4osJqlz4uHHoyuvOlPL2vU30lR1HR/Mk8stgKL8KX9hk/XMQ8iKWYCLORDTpwlJ77Ui7bcO/f206wf2jtnAzgxC0EYCW5pEd8Q+RpgkH3pQMmwgvaW7MVZ4Yd9T7WU096BKChGcQ8xGVWrMLl0oGqIlNT2pxodMGk79rbOAwKx028rxhQki62yj3JIvCQ3imjvKStiGIJ+Z2tlgSNR+05gIvrMqAi03NAB2KTyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95642bd2-b58a-4a04-45bf-08df0f551725
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:03:44.7331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taX9LTE9sA9T5AGPtbwa3OmKwYHU3MUx6e8gt+8NOcS+xQFxTXPC40uTY4Go0w+owbJWg+zaKoNEOXsDkvAKqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
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

On Thu, Sep 10, 2026 at 03:33:07PM +0200, Hajda, Andrzej wrote:
 
> Hmm, you have dropper 4tile check for xe2+, is it intentional?
> If yes, please document it somewhere (commit message).
 
Yes, this is intentional. Xe2+ platforms also have HAS_4TILE set, but they
require the eight-dword GFX20 depth-buffer packet rather than the ten-dword
GFX125 packet. Therefore, the generation check needs to take precedence.
The HAS_4TILE check remains unchanged for older platforms, where it
distinguishes the relevant Gen12 variants. I'll clarify this in the commit
message.

Regards
Jan
