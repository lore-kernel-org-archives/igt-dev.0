Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B52BC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 04:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D259B10E06C;
	Mon, 12 Aug 2024 04:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agVLaXIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB5510E06C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 04:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723435437; x=1754971437;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CUdIfwirFAiRBNI6dT58zp0egfrDrP+2Ovc1rjQ7hm4=;
 b=agVLaXIrAYLvz4W0l3nGA4O5jhoutX0cEwEe6n6byNtOeXGyS22q38QI
 XycPodXx08Uxe28tNSTLOxWT1mc+v+DuLvvgFZGZKbg/ntfjAqOv4tsJo
 FuuSLxjIMzNLi107/2TXQGpwWBGRc/4HSlWsDmZ3yosjw8YdWEO92+z/7
 MlS08znu5O8nJJRIxQij5mxww77ujYIk7CbhMUa2WkrZxGNsazd0xJn1h
 iBOwDklcuhAI9SwBTPd5lxQyBd3ew1PTpftg8Thdov6GQQ+KPO18TPMDJ
 dNr2X+iT0LRmAEOAiintBuBKEpZw5XsTog8jW5Xh7n3hookB+mRlgQCQn Q==;
X-CSE-ConnectionGUID: OZiCkWuLRFmmruW99anCUg==
X-CSE-MsgGUID: GvEbBYnSSPmd6lsLX4JwbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21668297"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21668297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 21:03:57 -0700
X-CSE-ConnectionGUID: reWi+lY3SQSDTd7/iLp2lw==
X-CSE-MsgGUID: wkgaxmx9Sq6hZMrBIA1Cew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58031990"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Aug 2024 21:03:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 21:03:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 21:03:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 21:03:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 21:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NItZsLhoOKvhQBxSLo69l0LR4vj0cw0yt2H33X/Q/2vGw/kwCAEC5sFKo1S2PWHVKb8Rc2lSNyUUrG77Jzs0fGHAmqxFwQjUXIrO6kQLtyNMEcz27SSZAOjkwLjnl0HHGnX23CUSMjMK2DVON79Or2ZHOuSlpG6tsHpgJFeO0ZAqaxIvjQ+ibDGbLw9wOYPesA3AbsBeH4ThpMYnAqD3CvwFJw21yEac+vxrN3WdTc/z6MGeSTYOIwsNDFUxLggyEcZo8XxHTGMsCHbtU8lP6B58rt1K/V1z7fMu6wVihMFRNQmjDWurtICDmT/wwpePCF3sS5/MRC/t7cECYmT2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flc1U6ZPiODtMlAKbNQwwBZQpmc3WV5/5eZ9jCL+fl0=;
 b=ZwGJ1g19Kiqymv2lO9eMzqoJbPGBB/AHFUc2Q6AkCBU43SMvJsWxh+0CfutJEVLrIpLDhH+iFTxCglPbV+FXc+oc4tiRI+ovI+Z9p1D2CGy6HkiOwiyEB5jTs4R8eBAerx0GbT1cCYXujS9Jb3Cn9u23j+AWSOVSyfnm0BnXZZLz7wxGVx4T7N/oma1kbhQFKXARgPC3+a4lqV0fbnPfbUmGm070e3n8rDUkhI0utXeA8iC3URXbivom4/sU84jlzdZnbqXwofW3BcSizCI0WVGSFe8LHV9WiW27GkLxQRms6XqqzvcBxf6JwkZS2smLKL0AQM3l/W4DLb2QumnZ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5)
 by PH8PR11MB8016.namprd11.prod.outlook.com (2603:10b6:510:250::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 04:03:52 +0000
Received: from MW4PR11MB6761.namprd11.prod.outlook.com
 ([fe80::6b8e:aea1:6960:2430]) by MW4PR11MB6761.namprd11.prod.outlook.com
 ([fe80::6b8e:aea1:6960:2430%6]) with mapi id 15.20.7828.030; Mon, 12 Aug 2024
 04:03:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v4 0/4] Improvise-the-deep-pkgc
Thread-Topic: [PATCH i-g-t v4 0/4] Improvise-the-deep-pkgc
Thread-Index: AQHa7CmzVnp41qaIfU2stRfglW9oQbIjAM9A
Date: Mon, 12 Aug 2024 04:03:52 +0000
Message-ID: <MW4PR11MB676134BDE696E574FA1AA6FCE3852@MW4PR11MB6761.namprd11.prod.outlook.com>
References: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6761:EE_|PH8PR11MB8016:EE_
x-ms-office365-filtering-correlation-id: 90a8812c-890b-4508-f35c-08dcba83c73d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gKOiRx2x+8B0+qHca7nNGuxcbLnCUvtxUbPqtjpS93vrw3mgkBAENUDL4gwC?=
 =?us-ascii?Q?DYen0FS6KudBbLUt1y1Z6jUyW+/oXJDqntB+BBvMJLShOYlLCI4ZXF4XwSpN?=
 =?us-ascii?Q?3su6hAIgy92jCKZ3jDEf9ADKg3y8Vs6KMyULijdtqM377XLnYuOGT+nyrR0n?=
 =?us-ascii?Q?owhhf4lb67SoTugkCTq10LcitSymkwSEl8Q+m3kvlGSI6fwQirquxvjV8UsZ?=
 =?us-ascii?Q?8176pk5q2L5G183HzXpH/RnHejckCLMx7y1h69E6F+mjMMew4ydFsQBBeaTl?=
 =?us-ascii?Q?4MBE6HOiU46EDJxWtM8bVxWFREi3+Trc0pRpkKHTkAqq+e1f2LpoAgYDCWrH?=
 =?us-ascii?Q?6t856E1k7zOHQ328DBgPvPZ/K74WseYBKK21KAbaKCcJzbJfvRZpcfYcbYys?=
 =?us-ascii?Q?mvzwx2Z2LYWcPQ0QZtsMaFKvm32dyxOyogMcPl/xSHpnzEsLFNQCyJ/RAnHq?=
 =?us-ascii?Q?artpaxb4NcUlgq6rHG17c2RDMbjMdb8tsa2BkKYqRe9BsrbZ5w9EjKrbHY+Q?=
 =?us-ascii?Q?0EAsvMN5nL2xMrkoOIFGXIkKKecydOJRHFVWtD6IraYM9D/74JH30avjRB77?=
 =?us-ascii?Q?bfMnWhnHRmbPKx0GfMaCvWf+Gfa0NCWZBpscWLzNxYtvH8fULFScD3PwcmaE?=
 =?us-ascii?Q?lo99eLrwSP1koLIfp2nXYJAP3SMaLy4t2kCnp7ZBu9CDY7Dcz2Qb8mGVMq07?=
 =?us-ascii?Q?DcFDxmYNMYgX2epyo/xCpcBSUeIf6BofwameJT67bDcSG5WlycIXuXsh0qlU?=
 =?us-ascii?Q?wK4Pre3ZTrTl0LNEAiYurPdiqeRy/Wel1zx5fuF/cLzW6W8wQUIBoinfhqx7?=
 =?us-ascii?Q?e74jPvv2BrtJY5EbSBrKczmh+LnU/w2ytjQyCdDcTQcGVkgTjYFGZ9gEus/h?=
 =?us-ascii?Q?WLc1yQ65lhGOFmU0BXmxGgsrgNW2UkFK10Y4Y1Ak9CvLGoZexjFkUzz+P3ya?=
 =?us-ascii?Q?fJVubQ1RkhJdkP8XarmQt/JdH6FqdJEuU6C485TcGb7UpzxEDYqAasMvg12C?=
 =?us-ascii?Q?gpUE6dy1jLB4xnrcM9MEGCLyzh/fXZhpTOf2FG+HKfREGsFk6Zb0HmDm8hTh?=
 =?us-ascii?Q?X+LxOLDvKMUK4hMAvm4Nu001kJK31d8EDk+PC1pkE8gSnhyPS2kw/2IKmsVB?=
 =?us-ascii?Q?AGXmXSIRxXEqNzjkM/CfARGlXCKmLRhuOwwyoFmYox5pFZi2+yNiwQc4mIaC?=
 =?us-ascii?Q?veQTPGxF2YS+oGHQW9clV7PkdDgnXKlWsWJkTohbV44HIDzLdMsT87+M4Bcl?=
 =?us-ascii?Q?ZZzkk7SChtbDiWjH3lpn861bxA/nJAoCbH6s9JE4D0b50l9w4ieNkYM9lddk?=
 =?us-ascii?Q?t+aS6f+Q8ALt4m068uokI4a2u4gfH3YuDJK+3CWJ/5n52C+JjRvTjG1TK+yw?=
 =?us-ascii?Q?YBsRi6ZVHLVEc+xn6VWUuDj+eseDPB8jlEQd01Jsnw7RFfFmZw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6761.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TqLK9Vv9KGT8y01RtEIRRYxmNHqaTRw7GJnXekffFm7KUgIU8aKp8YPgsLVb?=
 =?us-ascii?Q?I9YpUWaRoeqnuN5ak7mrb36Sx0IvpdDMQ2uozi3AQfDxQqejPUvyRXeoD/aN?=
 =?us-ascii?Q?Ln1W1zNXC81puqlfI3GAL2HFgXn3FC8a9ZyP9GEDjMxpqqvx+xZJOU9TJ8xk?=
 =?us-ascii?Q?R67ld7kfqF/CEa1yrxFN+91ZMU/QR/5HI4ajoBOldVzHlgwFGzjrp0FPMcxR?=
 =?us-ascii?Q?fDkTtESoqBixh0/u6cldxTs+vxHeughoJfCjK43uSE3cs42d00hVWPpcXQzm?=
 =?us-ascii?Q?5rZoyXsljBpgEAbA0xpPHCt+YvtZiqIn7yazYdci+Xc32WMH0A6b18uX/ZqP?=
 =?us-ascii?Q?gxW9DIK+7S84z2yiIRromv2+s6gXwton432GRfRIsGVv8mljsHdVwxmLQzYO?=
 =?us-ascii?Q?pWE3vzKCg5u8uGACO+V6uBK6omqzAFituikOQs02jX2Rmrrz8kyUWAzwYhaI?=
 =?us-ascii?Q?3LTAtmjuXtzgbPo3g+qIRtH1T8Isv1zOwlK09zlkmYsBeU+lOu+Gc6o0GCJQ?=
 =?us-ascii?Q?/Y3giPurmNO0d2qBg2aCsKGA9zPWwr7sJNypPz9M+82IIV6M0X3TwX4wjdgE?=
 =?us-ascii?Q?LFuOp8iPWXnAKSFyTYPN7s/lGuZ42zRrkKfjiMllpKyN9xjeOc6xwRk4UyjF?=
 =?us-ascii?Q?i3TAJZTZOdMoSXa4LPSK1k3fScG5LNNtuDIWcQsWiThQTE0LQiOKRwuvtADS?=
 =?us-ascii?Q?k6WPGJIPX/EEATzL0smkb9FbQS/CXqukT8CHiCVIT7ypfm3aMz7jyMeeTWR1?=
 =?us-ascii?Q?WJtrLYfO1M+4roPxvavZydAqN7W4nmqLw5a4KZ9g+ID03A6M5ySfTTAywBiO?=
 =?us-ascii?Q?uOQEBr35VFbRV/9qZCTJOz87Wh1lYjynOSB650MZJkyyGbmAaY9ixvywMdSB?=
 =?us-ascii?Q?tBQKZNXOaJgwzLFYgvosvHHKJEh9ToL1osAHGSRmUJd8Nm2toGuwlFbpFqB9?=
 =?us-ascii?Q?SyLM+I9fz3axCchQSm0t1FlLMQuIBVa5mfCBeoYx6xqw8TYB3MfAVgGUpPRM?=
 =?us-ascii?Q?LT1EvwGszFA1KTiR5EC8Ep79IfCbStHyX2TeuFSmHTwkCrvJviAbZUqc25Uo?=
 =?us-ascii?Q?xvla9A6bnrFGDbUURmeIp0l5ns9lhqDN1i1/1XN7dlZZbnx/w33XqZfjjylP?=
 =?us-ascii?Q?SJph7jATwiMk324qfu7qHHHLBbKouFAbq2Lh6+73C3Dzdhp2Nakufp9OJ5Xt?=
 =?us-ascii?Q?JmJvvyUhIhkpTnHBzecXqhVA+TNwFsaP72Z0rzMmjjXG22FfRamgwqLl0XU7?=
 =?us-ascii?Q?4joHWOYqEOVHLy5mkz5Ab6QzQpIeU6RGIr2dnyAPXzph1bpfO43f2jq87ub+?=
 =?us-ascii?Q?osy+nrL+M0PJs0CRIN3DNFvu95U0G/LsIVursznkwYBflUjcKdm+6pYSFRWo?=
 =?us-ascii?Q?t9NXa24zafC73C/L1YdEhhNSS2FSJ1jFEpLjr4gcGoGEa6qzpKE4rvQdAdKc?=
 =?us-ascii?Q?eAXAvF1MGHVWDLoFxy2Wcyw3gsVwcu0nQhrL3tlLLDwsNglqTo6a8nBhe40M?=
 =?us-ascii?Q?ZY8GpU6V21A9crSgsHhWsBkLJiQaNugsG9+0IPDXlHK5dGPIo0mDQxZPSWWY?=
 =?us-ascii?Q?LcKbpruXywAIS9MdSY0mAMvas1LEa15dBoxahWXf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6761.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a8812c-890b-4508-f35c-08dcba83c73d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 04:03:52.5694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QwBPiVVBXC+QoWoB8pwM22Ylb3whwN5ClclvLkrloSB8G6gsnvU0na4RPgvPrExn0whDUJYITaVVkfWFDWPcNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8016
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



> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Monday, August 12, 2024 1:34 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v4 0/4] Improvise-the-deep-pkgc
>=20

Do you mean Improve Deep PKGC
Regards,
Suraj Kandpal

> Naladala Ramanaidu (4):
>   tests/intel/kms_pm_dc: Update VRR handling and eDP output check
>   tests/intel/kms_pm_dc: Update test duration to 4 seconds
>   tests/intel/kms_pm_dc: Add polling for deep-pkgc
>   HAX patch do not merge
>=20
>  tests/intel-ci/fast-feedback.testlist    | 164 +-------------
>  tests/intel-ci/xe-fast-feedback.testlist | 269 +----------------------
>  tests/intel/kms_pm_dc.c                  |  49 +++--
>  3 files changed, 37 insertions(+), 445 deletions(-)
>=20
> --
> 2.43.0

