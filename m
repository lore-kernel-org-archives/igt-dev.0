Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7696EC9833F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 12:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A9010E5F1;
	Mon, 28 Sep 2026 12:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJfaSdHk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1231210E71D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790599585; x=1822135585;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vIYNXde675gtXrWXacwTAcJAJraFJeaPPeXu1O0pyaw=;
 b=jJfaSdHkTfBYyj9eL7mEmqUbeJdr+woeMFSy2v0PEzJ3uNJtd7MyA2WB
 mNRT75u2RSLSqgO19G/3K4up5cX8px/usMqyUicpWE8qzp+mc7ORWeiIg
 A+GrBTPKS+wiQPVVuxtjYFA4IZtkFwRhC1GwoS0WLy/PS+fYMYPkkI6XP
 s2+DMRQILXP6kLcA0UUrRIC32Uw0QAmPlzFbvy6P1MjOSWr7KdDUakuR7
 lWNBUuj/wpIqk3dMue8LNaXfYUm1VeF+S+pFm/m+v6CLGe+AApjEjN5Aj
 WoKBZvaTeC7AtQrGjMP0kCwYbpR81Chk0jPRED56xnSXa214hkaPEfd4I Q==;
X-CSE-ConnectionGUID: mTA6a9qxRYWpqY9n8drYZg==
X-CSE-MsgGUID: h4j+d1krSBO1480kHQQEtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="107676207"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="107676207"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:46:25 -0700
X-CSE-ConnectionGUID: BOnSxFHeSLy4YakW9xmuGQ==
X-CSE-MsgGUID: c8a1NFYiQDy6cqaqdcUgVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278857551"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:46:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:46:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 05:46:24 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:46:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sb/QZMLDtbSDfpVxSBYtqc9pIbWgiC2N1EMqF0jcFqtVDNVn8uP1nw1r0lIDqxgM0fOxE46RoXB2Yf3UH+CY38W8CRk2TbM3n2D5rvgk502/oMhu6lW+tWMTyaDaNtfIx8FG/xs1ng5ujlM8TdiVUoUabmC1aXia3w5smQE8k60PuvT7iBVslMtplq7IySwNSRe+y6QCioYf3R9oVJ6PGFLul16EDYTKDFjLws7vt/gVZH7i3RYQ1Yp/AqxYZcK76X6nf+/QtOBMeBWqE01YdLWuGJOOZo1ArC1Z6pRzevAETVnooE/RzF1hfcjoIgqQBnZ/r+gygK/gyYbNT8lSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mt/9UytfJO9VZwjiAK8zvd+VHAGGdWTyjNnt16rp6M=;
 b=I6SbVLCG7fvYceaTi2XyRTwGFet/DKMVBbgO3odew4DoK5GBLZ/F7zl+75ccHC0cGtodzCNs46juEGsEMe7A+ScVFFQsz99EkW0mJ07qSkwZxMiAYjVfArcQ7HNXFnHKtRoxoWwspsqltsc6MO326mOWuFK7Zzrj6XPilvhjUsEKz374ftfena29BGyzwyf0JpjO3WKzSTzEMcLw/vVXPzaFHSF+Jb7CnTa9sXnb/YyWr5r+Prm0ehYGj1bbBviDt0LW/DHJEAtSGqH3fTQBLZET2ppx1IEr0RLFzHROIzYKtjxKtZDJBNPQD6KHREIYr6vgV4ShHasEHFhwrV5VpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 12:46:22 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 12:46:22 +0000
Message-ID: <87c844c0-5862-4cab-92bc-5933b8c94a3e@intel.com>
Date: Mon, 28 Sep 2026 14:46:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,2/4] tests/sriov_pci_config: Add VF core config checks
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260921143707.2117970-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260921143707.2117970-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0003.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::9) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: ff39ebf8-4201-45b2-4e7c-08df1d5e7ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|260925022911599003|260925021911599003|260925021311599003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: hNRddktNe1ZJoilIqCxndAcViOIBx9v4oJxjQwI9kwBWMwaY7xiEt5r96Pep5RsF6l7tYrJW4jS6cTXs/+V72AB0ny+2zTlK/7I5C4ShvW8zxyvAhHNTh38VcuKq04BQYkLBFsxlgIbagzUe2GCIwal/J8np7A8uQSaqVhq71psEC7UhoU9la4/isAnS0SM6+xrt1bq7VLNKn5oE8W+731g+wxV5c2s8OaPY4EdwZO12RhgqOqwbyJ9Y7ihikiSc3rtGv8JpDWAbOeCenTDKqBFacZV+DSked73bTF4jJJF4bgt3Sp++mYF6Ti8yh417o981mdBUsgkqJwZNK00+CkXE277ZZZJG3VQacgcoEb5fJ69L/s8Dh4TIQPVhPo8r3lftJBzczalfmAl64rzd9nOKi2o+WwX1G2gRa/l7mXoPGBStya5oyHVCBO/Yom/LbEFpKKqKMwpua1YPp1VDfIHuV14dfEAI0ttqFHERwyYzJhwEKy82VIDCkkbuSHlSOG5FVAMETama/5tLgl0jX5oRfF5KSlrUcF1JwaxNwQ0VJs+kuj18fSV6NzyRecKUIPhPU2TftnPKN+UMK7IITTkG2euasePhOcovD0LgljWqBfrVQky0FFqjC1ImVXMKeL3ffKq023P1kKkivwdPY1gpvCl8hRnIc0QPJDi2fb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(6133799003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWVtVUxkMVlsODV0aEUyazFrR1lwWm4wZWNhcHROdFpKejdKaEJLQURJWm5C?=
 =?utf-8?B?REpac3lEWitteXVRc3lGTW9CUTB1M20ySTBmMVhuZ0JTbmw2cmZ1c1F5UlNK?=
 =?utf-8?B?eEJaQS9UeEFiNmYyZWc1SW40WEV1UTV6Q1JRYWR3c2NERUxiL1puWmJQUmdY?=
 =?utf-8?B?Q2NBNGtodkM4eFY5YmpNeS9UL2tpTGhKWDlmbklHdkxuRVU3RjJrUnkwN1k0?=
 =?utf-8?B?NzFLRjRObk5QN09SNlcvbWtEMGU5VEtrWlptKzBucU9WbEMrQVJGbGdRbVpZ?=
 =?utf-8?B?SmxVMlE5M1NMZVovSFBmam1SMGJaalIxQ3piOEFrcGtXdEM2RndhNFBqQ1Zi?=
 =?utf-8?B?VXJlVFZCZk5JcExSR0piUGlJUEJNenZzekRLMzQ2WFJmSnRQWlI1enpzMFZn?=
 =?utf-8?B?bWVlMzR4TFlOeVVZamtnWGlhSkJzcDdUVmlxM1NwN0FLNktBeTZLR0lveFBN?=
 =?utf-8?B?Nkk1N1Axblh3OFZKc29BZjMyNThqaWZoSDVCeHdDazh3TFFxTlBPcWQ1a290?=
 =?utf-8?B?a1ZSall0UHdoR2NYd29oOHR0S0l1ZGZuWWNZQkU4bTV6VEVQWDdiaG1IeUZa?=
 =?utf-8?B?SFIvZkMvZmFMay9sS2NMaWNzQXptWkVZamZLQ3BuQk1SZFdxUlpOUVMrL2Iw?=
 =?utf-8?B?M2E4UnV5SkZJWlRKYXNBcFEyV0pWV3VjcEtWNzIxMmlLeldJOHo0SnVlejZm?=
 =?utf-8?B?Y0Y5QXd5VU5MTUcxbXVKb1RLRDVtVnc1RlRmY2Q0NzB3eXpTNHdYKzZ3enls?=
 =?utf-8?B?eFAwc1VDYWhjNFlLWmU2bUNpZk5jczZnZ0ZsaWtaM0txMzZyQmR3ZG5qTENG?=
 =?utf-8?B?TDBUUS9qTHhHakhvcThwODZUeFZDdmxDNnZWb29yY0EwZlQ4OUI3UGVpN1cw?=
 =?utf-8?B?WXNGTFlJTEgvc1crVlVsTUdmcmZKN01DeVlkYmluYkpYY0wzM1R0c3Rsd3Y1?=
 =?utf-8?B?aXJaa2lLMTRyUmVxNVRiandHNGZZVUdyQzdPcmhwa0hFZFRvclBobnlPRGVh?=
 =?utf-8?B?ZGV6V09zVFp2amtCTDdnSFNPR0xObUx2MStnZFVuRTA2L2IzdXU3d1dqYkdm?=
 =?utf-8?B?Wi9sSjQyaGVqWTU3eE5vLzBoWFlyRStTekIrRUFBK09RWVBkK2lxK3dycW1v?=
 =?utf-8?B?QUlRak9WQ1V0Z1JHQ0xoK2diL0Q2YlZoR3k3K2oyNDdrcFZTUkZvRlBtZG1K?=
 =?utf-8?B?LzBTUjBuL1JPclBHUlYvY1EzMkZ2NnBjc1cvRENPSElPVTEzaENIUVJEWkVM?=
 =?utf-8?B?VHYwTmk2UHpaY0J4R0hXRUU1ckxSOGQ1UmNnKzJyWkI5VzFtWmN3YU1TRk5F?=
 =?utf-8?B?aU50Z0ZJK1JkV29rZTRXT3RrYkJ5aE9sdlVpMDlDeUlTK3k1QjZhdHVJWlRX?=
 =?utf-8?B?TE1pNGtKZTBSQ245RFZEUnJVRUw1dldLVWFHUnJUQXFhaHpocjk1N2czT3Bs?=
 =?utf-8?B?cDBrNFdsdTFmaXpFd2J0eGU4ZklrNFBQRG1LVzhhSGg4WHRwdUFyeE1EczRU?=
 =?utf-8?B?STVFaUJOZTRaK1pNVCtLNkc5TTVIV3M3L3VDS252bXJNZ2cycWlsNzZiYjZY?=
 =?utf-8?B?SGFPbHVSTWpBRDlucjlRYllWaUF0cW95RzZFS0N5bGpuajlvTXJwSmZjcUVR?=
 =?utf-8?B?L2pQQTVpcitTdTlRT2xVenBqcE9QYUEvNElpTXh2ek9VN3J6WVpaemc2VjJC?=
 =?utf-8?B?c29iTzRqRDlvRW51cy9yYmRlbG9YN2dYNTZWZm9adzJ6RGdiMDhGRm4yR1Vx?=
 =?utf-8?B?WXBWOEsvMXkrdzY2elcwSGVVV3JhdFVVMThvUERXS05kRldJdCsvM01GRDZK?=
 =?utf-8?B?dEsvOHV6U2NsTk5BMWRhMUU4RzdsU2ZQNVRlT09RcUpGczZscERKVHRTaXVj?=
 =?utf-8?B?bHFWUHkzUitpVldxbnZSMTRwTjR5K3BmTTM4azdwY256RUhKWTFoa2E2UVFW?=
 =?utf-8?B?YnhFNFFNS1diR0VWVUhaT2J0S1ZKdDJuRnl3Vk1RZEVDY1JLbnoyVXRZdjdt?=
 =?utf-8?B?TmRRWjVoQWJIeG1WV0FOdlBtekJsWUIwNWpKS2hodk14eHZldEJ0bzRCRkVn?=
 =?utf-8?B?ZEs4WE51ZUY1dnJ3ZGhxMnducmJPTnR1R3J0b2JZZytUbEZSTFNFdHNONFRZ?=
 =?utf-8?B?dkI4SUE3cGJFeDB4bXE2VnF6aVFCNUxXdmZJdTI5MUNTdnRDbUU1bm5zVVZF?=
 =?utf-8?B?U0N3dzhHZzYwM1pNdjBOLzFKS3U5VHhLVGQydm1IekUrc3RUamtFRWZ4L041?=
 =?utf-8?B?TXlzN1kvYWVvMFJ0STBFQjZkUTh6dUplemdjbFE2dDdIZkM0bmYzUkJhWC9J?=
 =?utf-8?B?Uk9SZTNqVVlWaDRvZWx4OWNic3BDMUdkbVo1bHRNeVNOUEZuR0IvUT09?=
X-Exchange-RoutingPolicyChecked: J/RmGPX+kozBju0/kIaCkdzRP66sJTvhIg3tTJuWweFIECqPy9zoUgeq0BjHzJ/PlIaJUkosN5VZluNuXCAuCxXVRrOU4giuwC0JvndAmvJpJ21xhDqwHvhVNuras2Xhf0q+BfxGxR+rosIUOymJZyI8YjzdWyMj/32OwocSVN+2edGLH222VIRweJ2zf5PXQMhEsFjEvLeODhFtyt8KuSUwrjGxHcGJL+ULGDnEvnSXQRsTUdaBIAZIfuyrfmfjDneu2bwioGkHCQs8fnptLbI7WHX4j8MVnJLOffAllMd5GQMdrrB6h3RShkZyy8XzAIQXTB8bCbLltDKiMwlO7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff39ebf8-4201-45b2-4e7c-08df1d5e7ff8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:46:22.2369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/hePEbFk5yvMmrOxjeHnhgjgqWIDaL6Xl+oiI7Tvd+aSSjvViHfeM1TdMoeI+44piji9ZmPsj8gMyrsNBnI+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
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


On 9/21/2026 16:37, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add checks for PCI configuration fields required by SR-IOV VFs.
> Cover the common header, BARs, and PCI Express capability fields.
>
> v2:
> - Enable the VF and read its configuration once in the fixture.
> - Restore driver autoprobe state and disable the VF during cleanup.
> - Clarify test documentation and shorten runtime descriptions.
> - Remove redundant informational messages.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GPT-5.6 Luna
> ---
>   tests/meson.build        |   1 +
>   tests/sriov_pci_config.c | 210 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 211 insertions(+)
>   create mode 100644 tests/sriov_pci_config.c
>
> diff --git a/tests/meson.build b/tests/meson.build
> index bee2b94224..51c84c99f0 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -74,6 +74,7 @@ test_progs = [
>   	'meta_test',
>   	'prime_vgem',
>   	'sriov_basic',
> +	'sriov_pci_config',
>   	'syncobj_basic',
>   	'syncobj_eventfd',
>   	'syncobj_wait',
> diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
> new file mode 100644
> index 0000000000..9f410ef23a
> --- /dev/null
> +++ b/tests/sriov_pci_config.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2026 Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/pci_regs.h>
> +
> +#include "drmtest.h"
> +#include "igt.h"
> +#include "igt_pci.h"
> +#include "igt_sriov_device.h"
> +
> +#define VF_PCI_EXP_DEVSTA_EPRD		(1 << 6)
> +#define VF_PCI_EXP_LNKSTA2_DEEMPHASIS	(1 << 0)
> +
> +/**
> + * TEST: SR-IOV PCI configuration
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: PCI configuration
> + * Functionality: SR-IOV-related PCI configuration space
> + * Description: Validate PCI configuration fields required for SR-IOV,
> + * including Virtual Functions.
> + *
> + * SUBTEST: vf-common-header
> + * Description: Validate that the VF Vendor ID and Device ID read as 0xffff,
> + * and that the I/O, Memory, and INTx Disable bits in Command, the Immediate
> + * Readiness and Interrupt Status bits in Status, the Header Layout bits in
> + * Header Type, and the BIST Completion Code are all zero.
> + *
> + * SUBTEST: vf-bars
> + * Description: Validate that VF BAR address bits read as zero. The BAR type
> + * and attribute bits are static and may remain set; the upper dword of a
> + * 64-bit BAR must read as zero.
> + *
> + * SUBTEST: vf-pcie-capabilities
> + * Description: Validate that FLR is supported, and Phantom Functions Supported,
> + * Auxiliary Power Detected, Emergency Power Reduction Detected, Current Link
> + * Speed, Negotiated Link Width, and Link Autonomous Bandwidth Status are all
> + * zero.
> + *
> + * SUBTEST: vf-pcie-capabilities-2
> + * Description: Validate that the Current De-emphasis Level field in Link
> + * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
> + * and later.
> + */
> +
> +IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
> +		     "including Virtual Functions");
> +
> +static int pf_fd = -1;
> +static bool autoprobe;
> +static uint8_t vf_config[PCI_EXT_CFG_SPACE_SIZE];

What reason for not defining them in main?

> +
> +static void read_vf_config(uint8_t *config)
> +{
> +	char *vf_slot;
> +	int ret;
> +
> +	vf_slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, 1);
> +	igt_assert(vf_slot);
> +	ret = igt_pci_config_raw_read(vf_slot, config, PCI_EXT_CFG_SPACE_SIZE);
> +	free(vf_slot);
> +	igt_assert_f(!ret, "Failed to read VF config space (%d)\n", ret);
> +}
> +
> +static void check_vf_common_header(const uint8_t *config)
> +{
> +	uint16_t command = igt_pci_config_raw_read_u16(config, PCI_COMMAND);
> +	uint16_t status = igt_pci_config_raw_read_u16(config, PCI_STATUS);
> +	uint16_t vendor_id = igt_pci_config_raw_read_u16(config, PCI_VENDOR_ID);
> +	uint16_t device_id = igt_pci_config_raw_read_u16(config, PCI_DEVICE_ID);
> +
> +	igt_assert_f(vendor_id == 0xffff, "Vendor ID: expected 0xffff, got 0x%04x\n", vendor_id);
> +	igt_assert_f(device_id == 0xffff, "Device ID: expected 0xffff, got 0x%04x\n", device_id);
> +	igt_assert_f(!(command & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
> +				  PCI_COMMAND_INTX_DISABLE)),
> +		     "Command: expected I/O, Memory, and INTx Disable bits clear, got 0x%04x\n",
> +		     command);
> +	igt_assert_f(!(status & (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT)),
> +		     "Status: expected Immediate Readiness and Interrupt Status bits clear, got 0x%04x\n",
> +		     status);
> +	igt_assert_f(!(config[PCI_HEADER_TYPE] & PCI_HEADER_TYPE_MASK),
> +		     "Header Type: expected Header Layout 0, got 0x%02x\n",
> +		     config[PCI_HEADER_TYPE]);
> +	igt_assert_f(!(config[PCI_BIST] & PCI_BIST_CODE_MASK),
> +		     "BIST: expected Completion Code 0, got 0x%02x\n", config[PCI_BIST]);
> +}
> +
> +static void check_vf_bars(const uint8_t *config)
> +{
> +	for (int bar = 0; bar < 6; bar++) {
> +		uint32_t value =
> +			igt_pci_config_raw_read_u32(config,
> +						    PCI_BASE_ADDRESS_0 + bar * sizeof(uint32_t));
> +		bool is_mem64 = !(value & PCI_BASE_ADDRESS_SPACE) &&
> +				(value & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
> +				PCI_BASE_ADDRESS_MEM_TYPE_64;
> +
> +		/* Only the address bits are hardwired to zero; type/attribute bits are static. */
> +		igt_assert_f(!(value & ~0xfu), "BAR%d: expected address 0x00000000, got 0x%08x\n",
> +			     bar, value);
> +
> +		/* The upper dword of a 64-bit BAR holds pure address bits, no type bits. */
> +		if (is_mem64) {
> +			unsigned int upper_offset = PCI_BASE_ADDRESS_0 +
> +						    (bar + 1) * sizeof(uint32_t);
> +			uint32_t upper =
> +				igt_pci_config_raw_read_u32(config, upper_offset);
> +
> +			igt_assert_f(!upper, "BAR%d (upper): expected 0x00000000, got 0x%08x\n",
> +				     bar + 1, upper);
> +			bar++;
> +		}
> +	}
> +}
> +
> +static int get_pcie_cap(const uint8_t *config)
> +{
> +	int pcie_cap = igt_pci_config_raw_find_cap_offset(config, PCI_CAP_ID_EXP);
> +
> +	igt_assert_f(pcie_cap > 0, "VF has no PCI Express capability (%d)\n", pcie_cap);
> +
> +	return pcie_cap;
> +}
> +
> +static void check_vf_pcie_capabilities(const uint8_t *config)
> +{
> +	int pcie_cap = get_pcie_cap(config);
> +	uint32_t pcie_devcap = igt_pci_config_raw_read_u32(config, pcie_cap + PCI_EXP_DEVCAP);
> +	uint16_t pcie_devsta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_DEVSTA);
> +	uint16_t pcie_lnksta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA);
> +
> +	igt_assert_f(pcie_devcap & PCI_EXP_DEVCAP_FLR,
> +		     "Device Capabilities: FLR bit is clear (0x%08x)\n", pcie_devcap);
> +	igt_assert_f(!(pcie_devcap & PCI_EXP_DEVCAP_PHANTOM),
> +		     "Device Capabilities: Phantom Functions Supported must be zero (0x%08x)\n",
> +		     pcie_devcap);
> +	igt_assert_f(!(pcie_devsta & (PCI_EXP_DEVSTA_AUXPD |
> +					  VF_PCI_EXP_DEVSTA_EPRD)),
> +		     "Device Status: Aux Power Detected or Emergency Power Reduction Detected is set (0x%04x)\n",
> +		     pcie_devsta);
> +	igt_assert_f(!(pcie_lnksta & (PCI_EXP_LNKSTA_CLS | PCI_EXP_LNKSTA_NLW |
> +					 PCI_EXP_LNKSTA_LABS)),
> +		     "Link Status: Current Link Speed, Negotiated Link Width, or Link Autonomous Bandwidth Status is set (0x%04x)\n",
> +		     pcie_lnksta);
> +}
> +
> +static void check_vf_pcie_capabilities_2(const uint8_t *config)
> +{
> +	int pcie_cap = get_pcie_cap(config);
> +	uint16_t flags = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_FLAGS);
> +	uint16_t lnksta2;
> +
> +	if ((flags & PCI_EXP_FLAGS_VERS) < 2)
> +		igt_skip("PCI Express Capability Version 2 is not present\n");
> +
> +	lnksta2 = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA2);
> +	igt_assert_f(!(lnksta2 & VF_PCI_EXP_LNKSTA2_DEEMPHASIS),
> +		     "Link Status 2: Current De-emphasis Level must be zero (0x%04x)\n",
> +		     lnksta2);
> +}
> +
> +int igt_main()
> +{
> +	igt_fixture() {
> +		pf_fd = drm_open_driver(DRIVER_ANY);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_vfs_supported(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);

Can you add a new line here?

> +		igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, 1);
> +		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
> +		read_vf_config(vf_config);
> +	}
> +
> +	igt_describe("Validate the VF PCI common header");
> +	igt_subtest("vf-common-header") {
> +		check_vf_common_header(vf_config);
> +	}
> +
> +	igt_describe("Validate the VF BARs");
> +	igt_subtest("vf-bars") {
> +		check_vf_bars(vf_config);
> +	}
> +
> +	igt_describe("Validate the VF PCI Express capability");
> +	igt_subtest("vf-pcie-capabilities") {
> +		check_vf_pcie_capabilities(vf_config);
> +	}
> +
> +	igt_describe("Validate the VF PCI Express Capability Version 2 fields");
> +	igt_subtest("vf-pcie-capabilities-2") {
> +		check_vf_pcie_capabilities_2(vf_config);
> +	}
> +	igt_fixture() {
> +		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
> +		igt_sriov_disable_vfs(pf_fd);
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> +			       "Failed to disable VF(s)\n");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		igt_sriov_clear_exit_handler();
> +		close(pf_fd);
> +	}
> +}
