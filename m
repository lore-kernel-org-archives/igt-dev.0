Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764DBC83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 15:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E3A10E7CB;
	Wed, 16 Jul 2025 15:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgvkAF9d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF4110E7CB
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752678033; x=1784214033;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E43YxWWYm9fx/2QGkGAO8aa9JxEntwR+0eA/wiTIHpg=;
 b=MgvkAF9dw+0Xe7jJSGlW/0XR90SBRe4wm86DJ2l1h9nWMeZ/c5Fb79SG
 LRYo41nPnoWdBYFQnZHy74EyFtgsmfhoS1yJaBFo/ksmdnG4QS60FhdXP
 gIUSd3MijmL4bIKYFx8NyUmpZ97jHAqjN3GhmD1NyaZ/5uBlr5P2VigfA
 JUMoxWfcwRrj6WSGFekGnPrJ/TlMg4Lrl0pzp/bdL3G74tkaz/HJNnIcR
 HgFWyEU5zkIkfkS1bicY9/Lw7MSaMkSigqMUbSq+r1EfQsQt9OBum9pYP
 RsaIwsIDWaO61HK+kmhyZfs21t/W57B9Qci7B9wh2KVfw4LpbDnsWWaEs g==;
X-CSE-ConnectionGUID: Cl2F6ad1SDWQBrCRYcu1rw==
X-CSE-MsgGUID: Qd2yp/5RStGZ+MX/wu+1zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="77464046"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="77464046"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:00:32 -0700
X-CSE-ConnectionGUID: J4xB2BpUSXmXx4XFVabw4g==
X-CSE-MsgGUID: O+/8uvCJQNWL3XWpra//Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="194669641"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:00:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 08:00:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 08:00:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 08:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbVWswECc9umlyQHHw1/D2nZnct3hJV7XA+21Ube81KsZ59T/T1mflNFFKoZxrLTHShjSpOl1ErsI5BZnjZwlCk0IGPN0pKOH5T0VFhU+jLsEk+D+5IewU+Vm92RSSkj3dFhJMtxV4iRmgRha3KLJh8SUd3+Gg/GiKuWXJHaLjpIbunRihzCrmoyOu/nv3+46ma2UnXyr7qaHjK2HsK61IEGgvcOcTUeoWwPCe9ONX3mLT4+E5P0J/qOTD/5fKquh/KGUobNb/N1TBuRCHgSf22wOuX4q7bovuolUXpqQUnCdOXVreDY4Cqacid8L0x4Sh6T11Nm/YhBHpTVgHrdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEdZv2kQVRhe0OVAyrA9Ux9B3jz98YxEfEXME32rRZM=;
 b=hZVAZ0hdazJ77eLHB52HoYtRE3bvxvl8l2bAAloXoWu3Bhyrr8V5FCGKa7Jeu8jtW98uGmteEhWQHgDM5plp26YKkMYglxy0cjNI4pCR5lzGaOUwlKGXlzKP9/EWGh+o3ifVxNSlRIYMOaFZLudSo7h5n0mZHgpFkyaIrAKlVdwQKS8x9LU55B9QmpDmwprTfPmQECOZ5E5jf3gcBNJBahVESrce6OR/Z4VNZJDIdBuQ8GCzNZTmCaSQ2ah7oK+rio36BLKyjGaUtsrsHCN5x4nuS72Pfo+iQvhSWw/i/Rid1DG9Az07axNsL0DSyS73kFoTke+ac9Z9gqUA3E9keg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 16 Jul
 2025 15:00:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.023; Wed, 16 Jul 2025
 15:00:18 +0000
Date: Wed, 16 Jul 2025 11:00:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>, <zbigniew.kempczynski@intel.com>,
 <michal.wajdeczko@intel.com>, <karthik.b.s@intel.com>,
 <ewelina.musial@intel.com>
Subject: Re: [PATCH v6 i-g-t 3/6] tests: Add kms_debugfs
Message-ID: <aHe-fuc9x7paL9K6@intel.com>
References: <20250716093656.169619-1-peter.senna@linux.intel.com>
 <20250716093656.169619-4-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716093656.169619-4-peter.senna@linux.intel.com>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8868c2-fb95-4281-33cb-08ddc4797aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rFIkK8eI+SLcKfCmo7weoztRsOarTFnlFYHAiBtga4dxufAogTBPzxaVpv?=
 =?iso-8859-1?Q?hAmCtP+Iu5uY3efHBaedGoXnHrLkOZLIfn+9cVWzlWXFlvfh9ev9t8Qlcg?=
 =?iso-8859-1?Q?EblMSrBnf2h4pMaakKl96bw66cscAwqPZ8JaoXiyMksazkx0GymLeyr8PT?=
 =?iso-8859-1?Q?EGjdLvSH7P8/1Ibb2ASnlDrRlS+h1uvPqx6CpiwX3Nt3uphtD0llZy6vQR?=
 =?iso-8859-1?Q?llKrBfHd9KztQiy5xSwLqkKuQVjgAaNS5RWsAGmT75ibKuC7ZQBNOcva+C?=
 =?iso-8859-1?Q?VpK5/WlQZ8u+TEle8FoZGg5wOn2j31IP/dF9vIAzkNwVyNuLydLJqBR5n/?=
 =?iso-8859-1?Q?DaLurLvgzUtK58IxNTD+g4vBgTANQsKOrvrYnHQsoK/MBfYvGbL5/JMfa6?=
 =?iso-8859-1?Q?Au08/oFKIddXf4Pen2buMHXKUf07iNlsghZlyiZ5daQScGDMdp4f4Au+LO?=
 =?iso-8859-1?Q?Su2srP2/EkUuTW7pjzjpGaW56RmQjPE7viJn0XQ8l9LFsM9gM5ETIbPAgp?=
 =?iso-8859-1?Q?xbsMVjGn/GTOX8A0uwKw1ClRfJBVw5mH1cf1ktyP/2TvcTJT3Lv5w2H/RC?=
 =?iso-8859-1?Q?md2dvIh0IU3uS1NdQtnvSkeV5TtlcvpVo44R8qJbSdiiZTyKBur2rJCAXV?=
 =?iso-8859-1?Q?AHguCHM55lYcn2o/ajyV0LIFHVcrza+KY/Eh/52jeuHcetGmNBH/+oGZfE?=
 =?iso-8859-1?Q?Aa80YYyB5EarnPVMXloihSCSoDvFEMy2s1jKpge+sud5Aj70PG/ZWi5Fqw?=
 =?iso-8859-1?Q?LvSiEwPKxa1mVZnelc2qsboTObyes3Zvdk8NEvn+MtetaARKqQjoxtyA9N?=
 =?iso-8859-1?Q?r/H2Ue0/NrikTnGEgsWPp2By6pkdiSvZaLvIuELRPSRGmKIXUT9S10YT17?=
 =?iso-8859-1?Q?cDbTpNgcI9VPDPC9rGQ4/14/q/a6EmA84in7DH+DcWR6nm1NoJSS7OOa8J?=
 =?iso-8859-1?Q?hPoXwr8LrfeT5FTx7Q4uVaVe5ANUAtGWkZZuowDDbG0t0fKQWc2lHofVbe?=
 =?iso-8859-1?Q?duPlpHgCXMtBRNRvXRW62T9TQOqxixoFlshrwwJpakKKL3+v1O3zp8KR1j?=
 =?iso-8859-1?Q?cB2BG7yL29qssl3JOrf8Bh3bJ3p2lQl3i1pg8TSi6XjxYY7m/hUqPx+Jcl?=
 =?iso-8859-1?Q?/PosjfZYvZVlHLsZJitZzpQnyxNRvDQy4FE5pyoNTqOgTx7CvBbfj8Mzf9?=
 =?iso-8859-1?Q?DQFe+CD+S5d8hNjGYoIK1qwDpjqXv0tdbhWFlspnSVdCP8ol2BaMmzkDYZ?=
 =?iso-8859-1?Q?Y4gVB32o9pZkyt5FFzDHCheLsVrPC70xy7s+ylTmHZnjhJ931Cbp92rtMS?=
 =?iso-8859-1?Q?ALDQx9WTYdT2GcJ2EO2k8SC4mrtq75qOGZhHMBzV0uOTNBZn2QSOou3zdS?=
 =?iso-8859-1?Q?UQrDvcdqCJWLeve9Ae42kopNX8aV0YG+Nm8XiK5NXO10lA9cbvsWGSubIs?=
 =?iso-8859-1?Q?udmrk3/P+sigMR69wTkD1N7Gy1WlnYBOnKKCUP6r6Pdlsv12WJhfhzKMih?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o0UF4dyvLd6iviekiAOQf1KEhcm78hCLnaTFkAGU1V7hUF9dNTY4Aj6zub?=
 =?iso-8859-1?Q?nxINjYXDG6AvKG4pMQdWxZV/6PdMJYm+3oYUxBzFxsCnL/GuSh/iaZ84FW?=
 =?iso-8859-1?Q?d16uRYjHB8bxFl5G6qvZzuQEwEdMN+8UeNbdqzXlHvG7N4dd8gYRF2IRSR?=
 =?iso-8859-1?Q?jkPpqPxjulCItZPfUrA1I8zeKNmXfB2Rscp8JKhLBMvGgUELOHSxAv7asR?=
 =?iso-8859-1?Q?HSsx6uDFJXZCYCZh2z+euudRSxURgobNGOvI3mIreJyLNyX38awlQ/ytFf?=
 =?iso-8859-1?Q?shR+uDRnYiuv1W4CVTBA6HPm1m0EObfeeN35mu36ZdMK4sto3kOMq+G7FP?=
 =?iso-8859-1?Q?H3GaPq2HJxUlNjTsjj1hFrwhWj1syZLNl6gw8eTD3nJd3WAxG87mK+6Udm?=
 =?iso-8859-1?Q?bGmdICcAu2htudwcfqnBdCLirRVqcjCbfl8QE04lZihvJaAfGvHNT2c26k?=
 =?iso-8859-1?Q?8wrYxesM0jlrYYV0IMcDs1WflubIgmib2c4AwGjHAdH7KH9iBKvJGTJVI+?=
 =?iso-8859-1?Q?eI1gEZ7u+7RkqlYNSgiYMuiRGEdGtXNCN/G2lj0AAXhgumTwmLQXh8gfXH?=
 =?iso-8859-1?Q?oQKMC5eL/LHNW91RIQPb4iOddhNE0ovVHo8UpvBXNjT5HiO4ywZrMddEZ4?=
 =?iso-8859-1?Q?Kh5/8Y0cX701YepjcKKIzCSzMOwvQq7LCToBWALiJLN+1XvpWUFSKS60h4?=
 =?iso-8859-1?Q?u0o7qL+6toasSJQa2BPspbaqW2GIMi3UBsy8Wi+U3nTiPC9ae6uZBsdbmI?=
 =?iso-8859-1?Q?ncFOi0/ilanJQKljRO7n+7S4umD3P2czmE2xmd2vbFQ8+Q6XEL2ghh7sBe?=
 =?iso-8859-1?Q?FjLXf7+OfikKqhRZ+jwVBihrgENMGBCCU+jnvOf/730gch5ISMLU3lSLLT?=
 =?iso-8859-1?Q?lkvWMMYWAh+S/PgBuxkRC3SIF7HhODWocm4Cn31rwLIpsk5JORaXrhfK5E?=
 =?iso-8859-1?Q?XLpvnnAB9unQv4XfzLU9eKvMPFqwYaOGBjYFT1XtIflcD/Fs/b6OYqRpxy?=
 =?iso-8859-1?Q?Rfx9xg5HDzKBjAfgyOqG30xl87X4mELeck1h302URwDS9YINkVa54zXOC3?=
 =?iso-8859-1?Q?zCERf4PNBCpRWE7CSXJRZSR4b7kQ8gYJwJSiIyvDw4lCJpGNgT/IpiiWBJ?=
 =?iso-8859-1?Q?kwFtoyuvKKSeULBw8FVwCd/HBntj/W1Xz9wsFTbSeSsNHbfCUUvLIBJYfq?=
 =?iso-8859-1?Q?vl3ZP2eJYIj1DTQYpFNpnM1eZKV3dw3cGVhQ3ki4Y9/d4fQviP637kwKCF?=
 =?iso-8859-1?Q?4MxE68Y7rPAoObsc/gcTTOX+MLmzCctafKfB7ujfFjEJOiEsM+/6ETD7AM?=
 =?iso-8859-1?Q?zTvkHtAw4IBZQ33a/kFX3u5X61rnawJvUeH1VgfXgIwh0RUMX3xLs1pwTW?=
 =?iso-8859-1?Q?uE/H2erQXSxeloS3sdDktv/uoVa7HCjTbVSsdP0ZW0XwFiJBlhpU353WRY?=
 =?iso-8859-1?Q?SgTGLPpuhXD6W7tesz95ceBbJCROkOJ7EjnZCAf74l7duthwMjrwnffRw0?=
 =?iso-8859-1?Q?OzFGPo/lxyZZfq3BKyqwro4WEl46dYGkuxGu9bnKUruLcyCquOp9fDtt7z?=
 =?iso-8859-1?Q?cUnnH6pvyy4Y8fxfpLwzEsHeInnwmjkYeft94DXeOFkKjzcdyasWNAjf54?=
 =?iso-8859-1?Q?zVn8HJSrsFrMYin8lUQl1+Pggrz+dh47JSX9ygVdNVc5t87jCfrIJWyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8868c2-fb95-4281-33cb-08ddc4797aaf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 15:00:18.7093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGxcl1pZ6BnADAhX20DxHNca+WFKDm5Nuz6FwAQ71YpNeC7KVJKCjPjalnHUAH7nwaZU79A/HqMiNooFe0Wo6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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

On Wed, Jul 16, 2025 at 11:36:51AM +0200, Peter Senna Tschudin wrote:
> Introduce kms_debugfs that is expected to work with any GPU, not limited
> to i915 and Xe. The test powers off all available displays before
> reading debugfs files, and then powers on all displays before reading
> the files again.
> 
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: michal.wajdeczko@intel.com
> Cc: karthik.b.s@intel.com
> Cc: ewelina.musial@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v6:
>  - use the new igt_fit_modes_in_bw()
> 
> v5:
>  - use igt_dir_process_files_simple()
> 
> v4:
>  - change test name to kms_debugfs
>  - use the wrapper function igt_fit_modes_in_bw()
>  - use igt_display_require_output() to ensure there is at least one display
> 
> v3:
>  - renamed the test
>  - Removed reference to sysfs from comments  (thanks Kamil)
>  - Updated description to match the display part (thanks Kamil)
>  - Moved from "display" to "heads". Our CI uses "headless" to refer
>    to a DUT without display and it is shorter
>  - renamed subtests for shorter names (thanks Kamil)
>  - fixed comments style (thanks Kamil)
>  - updated CC list
>  - changed the order to test first with all heads off then with all heads on
>    to prevent the need from powering on the heads at the end of the test
>    (thanks Kamil)
>  - removed snprintf from test names (thanks Kamil)
>  - removed subtest group (thanks Kamil)
>  - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
> 
> v2:
>  - changed style of comparison to NULL
>  - moved to a separate patch
> 
>  tests/kms_debugfs.c | 133 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build   |   1 +
>  2 files changed, 134 insertions(+)
>  create mode 100644 tests/kms_debugfs.c
> 
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> new file mode 100644
> index 000000000..f8a3360e6
> --- /dev/null
> +++ b/tests/kms_debugfs.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_debugfs.h"
> +#include "igt_dir.h"
> +
> +/**
> + * TEST: kms debugfs test
> + * Description: Read entries from debugfs with all displays on and with
> + *		all displays off.
> + *
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: display-off-read-all
> + * Description: Read all debugfs entries with display off.
> + *
> + * SUBTEST: display-on-read-all
> + * Description: Read all debugfs entries with display on.
> + */
> +
> +/**
> + * igt_display_all_on: Try to turn on all displays
> + * @display: pointer to the igt_display structure
> + *
> + * Returns: void
> + */
> +static void igt_display_all_on(igt_display_t *display)
> +{
> +	struct igt_fb fb[IGT_MAX_PIPES];
> +	enum pipe pipe;
> +
> +	/* try to light all pipes */
> +	for_each_pipe(display, pipe) {
> +		igt_output_t *output;
> +
> +		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_plane_t *primary;
> +			drmModeModeInfo *mode;
> +
> +			if (output->pending_pipe != PIPE_NONE)
> +				continue;
> +
> +			igt_output_set_pipe(output, pipe);
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			mode = igt_output_get_mode(output);
> +			igt_create_pattern_fb(display->drm_fd,
> +					      mode->hdisplay, mode->vdisplay,
> +					      DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> +
> +			/* Set a valid fb as some debugfs like to
> +			 * inspect it on a active pipe
> +			 */
> +			igt_plane_set_fb(primary, &fb[pipe]);
> +			break;
> +		}
> +	}
> +
> +	/* Skip if bandwidth is insufficient for all simultaneous displays */
> +	igt_require(igt_fit_modes_in_bw(display));
> +}
> +
> +/**
> + * igt_display_all_off: Try to turn off all displays
> + * @display: pointer to the igt_display structure
> + *
> + * Returns: void
> + */
> +static void igt_display_all_off(igt_display_t *display)
> +{
> +	enum pipe pipe;
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +
> +	for_each_connected_output(display, output)
> +		igt_output_set_pipe(output, PIPE_NONE);
> +
> +	for_each_pipe(display, pipe)
> +		for_each_plane_on_pipe(display, pipe, plane)
> +			igt_plane_set_fb(plane, NULL);
> +
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);

I wonder if something here would be different then doing dpms off like xe_pm does...
perhaps we need 2 different cases?

anyway, this patch looks correct to me:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

since series is entirely reviewed now, I'm about to push this as is and if we find out
that this and dpms off are worth exploring we can add as a follow up.

> +}
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
> +
> +igt_main
> +{
> +	int debugfs = -1;
> +	igt_display_t *display;
> +	int fd = -1;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_ANY);
> +		debugfs = igt_debugfs_dir(fd);
> +		igt_require(debugfs >= 0);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		display = calloc(1, sizeof(*display));
> +		igt_display_require(display, fd);
> +
> +		/* Make sure we have at least one output connected */
> +		igt_display_require_output(display);
> +	}
> +
> +	igt_subtest("display-off-read-all") {
> +		igt_display_all_off(display);
> +
> +		igt_dir_process_files_simple(debugfs);
> +	}
> +
> +	igt_subtest("display-on-read-all") {
> +		/* try to light all pipes */
> +		igt_display_all_on(display);
> +
> +		igt_dir_process_files_simple(debugfs);
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(display);
> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 16c699bba..568e7db00 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -29,6 +29,7 @@ test_progs = [
>  	'kms_cursor_crc',
>  	'kms_cursor_edge_walk',
>  	'kms_cursor_legacy',
> +	'kms_debugfs',
>  	'kms_dither',
>  	'kms_display_modes',
>  	'kms_dp_aux_dev',
> -- 
> 2.43.0
> 
