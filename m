Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCCCC83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 20:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC7F10E1CF;
	Thu,  3 Jul 2025 20:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbBEPguI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28F910E1CF
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751575163; x=1783111163;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P9ZKJgXn2ZgT7Dv5ANWiNLc7ZQuAJoo2JZJmaqHtYE8=;
 b=YbBEPguISJ5nXURtWCchsUwlwWJxGn1IRp3r/f0TcL+Xg0ldFwp7v1p7
 WIoRCHHv158UQmUOt9Jcz775DdCMBRmAL3aY1y/K2Odg248Y9kGhc4mOV
 To3Qy/GUMFOaVaZA/yh+sfEXZ2OVUGZbhcgRjJ2uGSmbUvQX/Gu712Lsh
 oDCQCB1sbXEBa6DbgEu59RXfYl3a6NeSj1HFMF8t/eCvK34QW6Xz1vOJz
 nra1dBXQNXpM8sD2cZoQ9q1jZ4lea/J7UFILw0nbotgnMbMAlxkZqfz1a
 Ghv64b1CgFp95CXdxRsRnRcnFtURD7s8oW9FFu3IICOPJ69bo6Gxn1Moi g==;
X-CSE-ConnectionGUID: lM0sNu2aTNW/zvtye3HRHQ==
X-CSE-MsgGUID: F1rc9paEQWidDguZmVyHGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54056386"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="54056386"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 13:39:23 -0700
X-CSE-ConnectionGUID: DS9emD5QSl6tftHOrVR/Gg==
X-CSE-MsgGUID: oF80R71ZQ3mb7y1DvplWKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159024835"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 13:39:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 13:39:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 13:39:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 13:39:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCodIZs5h/kNd4yeMZWo1LmaweT1vetZCqFFLIZIF624/GalwISYbpqfNusNj89FY/63OZOCFgQZs6699MrBYZGTrcOQMnWsF9X2hdYnOcS/VMbqncFzO5GabRLzJmydif5vy4WOITCe6N1XuGWpo3wcA3ZFAgIlBHVFfR565VjjwQu/vQPDtO0fUnznMKzYe5Q3IZG4ruR4ZaOfkCvj+3RlLlnOZFnAy6oSpb+P6sLSwi26gXyMNq+36m2ttrKOgRGNmhThQ+owewa5nbuQJWzMDTihChuGafTnJX7tPKSh1s/oCYMEsIe9Mg2uNDQ2l3f/5ZC+IFp/OPxTUFEhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz4z7nyUFw3NOtEjVDVXATok35X3k18Rj8hFU/+sfIw=;
 b=YviWY0TlbHsrCRnUg3JGWcUieojwkwgRyaCSBRMtRObWlpEfgvCjVbcvJYQ9H/fWNG3mYhyQqlbjq218WB1/tnLt8uydh2ZcT3AILMVxZb6rP7wGNsfedBx8MwwggkEtnszp0Xmj78gFu5UrUBi1DckyfrT2kocTRKVjgp5oWGdGvZDflUgkdtKgfj5xmE4woRtmHKWU32ZUOe2Rod/NKlj7R5H03fQUMZSS+i40FYxMb+lxl/vzvcQqa4+YxymMYvURCNEFEJp12Q31l8GwFoblOxbSGURV8J9agZKizRz9pAqN1tXKHO8oc+pyObxfMdoSLZjIZweR/kZsO/eqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB6038.namprd11.prod.outlook.com (2603:10b6:8:75::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.21; Thu, 3 Jul 2025 20:39:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.034; Thu, 3 Jul 2025
 20:39:05 +0000
Date: Thu, 3 Jul 2025 16:39:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 <michal.wajdeczko@intel.com>, <marcin.bernatowicz@intel.com>,
 <kamil.konieczny@linux.intel.com>, <katarzyna.piecielska@intel.com>,
 <zbigniew.kempczynski@intel.com>, <ewelina.musial@intel.com>
Subject: Re: [PATCH v3 resend i-g-t 3/6] tests: Add core_debugfs_heads_power
Message-ID: <aGbqZTPOpf79Xxx7@intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-4-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616074240.45818-4-peter.senna@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::44) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 888ff7b1-9b0e-45ec-5c38-08ddba71a71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?f9lRlcVkEWlV8SkgkaCxtKqwLKdmyz1dKyaU+uSfYibnTyC7u/E0/CXFez?=
 =?iso-8859-1?Q?IX5vy793Svpnbn/gvDj3+L07b5p3ikTXuTCSwDR1PbC0bUGpQXMtP9jLjY?=
 =?iso-8859-1?Q?QEroub5TFrLu76cNrBlwo9it3Rg77FzlUYeCfvrkSVqxHYPXjhv3AHh41b?=
 =?iso-8859-1?Q?BxsB2MgBqHA74JvnqcTvFpfR5HGwKngdCFOIjOfALcUDicn+dxj2dIi/ad?=
 =?iso-8859-1?Q?TsHWPteKJR1clzBYuYOqA/nP4orieqvDCuCxcxh9FRt/z6At/lMLVEL7Ho?=
 =?iso-8859-1?Q?jtWDUXXZvdkCSjkz4YFjBjW5lBWc2Hu832QeLKVz4Ygeyaet62oB09ptpQ?=
 =?iso-8859-1?Q?FcMSUC95gLh/0zMWmJWU4k40w5qHxapbIo4ACMjE/6LRobIJ4AgqvZ9HGd?=
 =?iso-8859-1?Q?MU+eBHsosIsiBi4a6xZOte0sctUJFnPIDBxgrcv6cBkviop8YwFk3gWckL?=
 =?iso-8859-1?Q?Z936risYov0wn7T1VLsklNa3bb5V9sEbXCuQ8TmBz8vt+3Eqlrrpsvmcg7?=
 =?iso-8859-1?Q?tTsvSUKNbTzNKy3adgJx7h9Rb2NEqCjAY7mJyWoWABrFishp8Xqsiy6gcF?=
 =?iso-8859-1?Q?EHFlBnQSqBi4a/qQUBPjmKoOJvN2mJCtW533nTaHyDt13Z6whizLhfI+vH?=
 =?iso-8859-1?Q?xLy922ycSYf9XKjF9OSbeqUZ5LrORjvcZ7BUxbCY4tjmkJX0mVAXTP1ShS?=
 =?iso-8859-1?Q?1kAnCqpYBqYyRevmsW3W2Q2NSr7DBmpl09IVKX6vRi7RulqtcOx1kip4WT?=
 =?iso-8859-1?Q?FhOjVq2tTK3GkG4p6wA9R5RZ/z9iNvT0ZzuPkOyunbR+SEa/A4dxRQz5sQ?=
 =?iso-8859-1?Q?GZhBUzM8entUsUbb8nlkErNno1uTqC014y79UU14/tVCST2HUXMmq1TeUz?=
 =?iso-8859-1?Q?9NaGLe8KpnhM0O0zDbIUR2Eq36aBoY9eAsTKtRH/wzc42ePYHmuryrM03f?=
 =?iso-8859-1?Q?rSLqsDqMdSCZJybH4cfzX6P8j8RrydGgCSfS4gELWGOoEjLPVCbcPPh+63?=
 =?iso-8859-1?Q?/YwoeFgpamGt9Zu/JAPelVnneed3Tma7x5l7ZR0PlHNhCfJ4ZHhD7MNw3K?=
 =?iso-8859-1?Q?7PBC9SdLKn3AT9HJLiONsl5gcOZEW16NaP18jOcTP+hm1+bsgp+cuGN6pF?=
 =?iso-8859-1?Q?OHWnjkkNxdTC/JM4ZgwnD1s+5ND1gMObyyESUYWCF2f7HcnONv2emhFW+d?=
 =?iso-8859-1?Q?DcwNoxV1Fo0oQ2R29MGh5AbX99XH9GDRW7P0E8MIvr5QRHWPyOK74emcaP?=
 =?iso-8859-1?Q?1nmw+YO8x/d1Edw55lAF1YwfX1wL9HSuvCJFb0fC+T/+2oG9e4n57InE8U?=
 =?iso-8859-1?Q?YPQh1Fou/Inh3fOXendOE3Yq3qi1wPLedEKZgRPg/oZuUd/tam316v1fDI?=
 =?iso-8859-1?Q?QuQieJEPS1XlFAMERFBRtglvqu4+etePUgvdcFDAalTLxwrApM1AqUtMM5?=
 =?iso-8859-1?Q?jmzYMrvxxgqJt4hshQptSwe2ewXpuIgIRKX7y43ciORO/f0viq/2Gsp3M0?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?W/6EdYy1r9/osX3HGEtoUxrfjTkCb6aY+AQR/Ulk5leS22hcV0lIKmeJ5c?=
 =?iso-8859-1?Q?NIanZewFLn5ubi6AOs9CtuGrDDnSp7h6mtqj67Dmss2V/Mvi9D8cAw6qfc?=
 =?iso-8859-1?Q?bPD2YrvmjUiB/3n5MqJ5kusp4FvOY89IgJVY+h421/l+Ett0iocLi25Ba5?=
 =?iso-8859-1?Q?efjYlqcoAU86tqAUx+K4ViRrPKF9hGAxcAYvtA7R00sq7GYOfREiGJVUfC?=
 =?iso-8859-1?Q?c7JtcrR5MHS+l0dUa1U0jffCU7WHiQbod+Vokd4GJ6Sx2F21E526+YKd5r?=
 =?iso-8859-1?Q?UYkEtfKIJU4aX2LJ3HPmMDmvcOhJYiIHJySBH6w3HWLVZgPI6Xgn4WMoVn?=
 =?iso-8859-1?Q?dKThaJwj+pgH/m5VSzeq1RaH/swm6Zo1dkFCQVi6lOliBNzZTke1rxwwI5?=
 =?iso-8859-1?Q?CiB+VpnsOylAWAOBiSAlkTK7VC8fU6eOJDqD2i7PRiWp382nuC6WeGofrF?=
 =?iso-8859-1?Q?bvFkn5sIT9yZEk0nEfxX0gaj72LdMGVPYh2q3Ng74hBA6bfYqPrBhk0AaS?=
 =?iso-8859-1?Q?OoJ1gjQ5K5z+xtBG6BH/RIKjDTnBcQXgNauZ0BmHH0lXkWPdjg4m/4c/kt?=
 =?iso-8859-1?Q?bHhRLRF/8ucuDJZXJZjTtV/FXyybD3REkuWNk3orNyFSFsh4E9k7d///Ut?=
 =?iso-8859-1?Q?fWKJo11sgQPrzgOOiCcDg/fLlNkcxxS8LNNSceJ9s5JLbzbhrJ7zAVQ2gF?=
 =?iso-8859-1?Q?aiHnK0qNxtb/OJA4J9gXl03zWdiFz9Tiabyx7O7JIBDlSyp/iaWO3Ru+De?=
 =?iso-8859-1?Q?1AoIs2DmCRW2DHcA8VuimlHtGeGrpwGq2dCtfnAgHXTlbzP1Wjkw1QZfH8?=
 =?iso-8859-1?Q?9HniDyYRp0FPnDeVAvuX62uFU2GvJvHBMh4cxpYh+UGz1ATSfzv2ip71Lx?=
 =?iso-8859-1?Q?k1oMOh61uafE+7bDFmyplg3VICfCIxSH4kAtkSDBTx/uFh4On3SsQs3NHw?=
 =?iso-8859-1?Q?5XyobY4+BKTmsdc5km34KqFVRx986JMQjZPAG8u82TNo0LKebd0/cibxPt?=
 =?iso-8859-1?Q?G9Zfs07LBeB/uFlf7K30C51REhEWSVXZB4+eXiCJcJxYfya4QZHxafmvB0?=
 =?iso-8859-1?Q?Q3kKy5NDFiykcfu2Kh6xMsOikgNajQxe+BXpYamjnuKeP1+NXUAFxX+mJW?=
 =?iso-8859-1?Q?bMZg0OZvobkwvsjTeBSTgJQ5SwNyexMHw4hFsCuqiyoaJIJRnFJXKVFleI?=
 =?iso-8859-1?Q?S22T2zEBhbkBlrBkVDfPlccWv6hUS+l9emY/4W4WBGXRGXdP3Je30bONeX?=
 =?iso-8859-1?Q?p9RvMvw4xiBWcqpx9C1fge8vLWqhu640jqf3zpmduAZUnmv2fjUYr8veFf?=
 =?iso-8859-1?Q?WDHUoNb/q3wsh65AuladtqwXuG/XdN/9eBjzjSz2n73xJH+6Flxs9QctC7?=
 =?iso-8859-1?Q?xCgCP+TMBBqrFaRrvDYKV9UOO/AY6v+I9VFwlhTY1BonF3Xip4W5Hw3vMA?=
 =?iso-8859-1?Q?Fv9eB+fHjq3hSt9QwYRQSpVOus3322/NNwlithrQkLs1eqfCUJim7OqlsT?=
 =?iso-8859-1?Q?Jb+5Zbo18nt77ab35IiOExqUWnoqpDZfDLer+BS6MM+eepiX0T13298aUL?=
 =?iso-8859-1?Q?+jIU9G3CfG+SwQePhn8Nmyc+MKmY080JrRAzzgT5kx2SX8SDhVod1ziO94?=
 =?iso-8859-1?Q?fmgYrmyMQSD6SJvze1AmjHKl/fBpRbog/sB7MiUSC9JtTnPCw2c17ciQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 888ff7b1-9b0e-45ec-5c38-08ddba71a71e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 20:39:05.6639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMzmlfItxmin/ZmIlauuDzIcyH2YMS3TcyO8cHERI1NKCjcq9UonPZoh2cnHMppkBBv9/sOKIfdWxIOyQA8scw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6038
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

On Mon, Jun 16, 2025 at 09:42:35AM +0200, Peter Senna Tschudin wrote:
> Introduce core_debugfs_heads_power that is expected to work with any
> GPU, not limited to i915 and Xe. The test powers off all available
> heads before reading debugfs files, and then powers on all heads
> before reading the files again.
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: michal.wajdeczko@intel.com
> Cc: marcin.bernatowicz@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: ewelina.musial@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
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
>  tests/core_debugfs_heads_power.c | 156 +++++++++++++++++++++++++++++++
>  tests/meson.build                |   1 +
>  2 files changed, 157 insertions(+)
>  create mode 100644 tests/core_debugfs_heads_power.c
> 
> diff --git a/tests/core_debugfs_heads_power.c b/tests/core_debugfs_heads_power.c
> new file mode 100644
> index 000000000..1813986d8
> --- /dev/null
> +++ b/tests/core_debugfs_heads_power.c
> @@ -0,0 +1,156 @@
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
> + * TEST: debugfs heads power test

Could we please use display instead of heads here?
From display folks perspective heads might be indeed more clear because we will
only use display if any 'head' is attached, but from folks outside of display
world, heads will be a confusing term to be in the name of the test.

Or perhaps we name kms_debugfs 

> + * Description: Read entries from debugfs with all heads on and with all heads
> + *		off.
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: off-read-all
> + * Description: Read all debugfs entries with heads off.
> + *
> + * SUBTEST: on-read-all
> + * Description: Read all debugfs entries with heads on.
> + */
> +
> +/**
> + * bool igt_kms_all_displays_on: Try to turn on all heads
> + * @display: pointer to the igt_display structure
> + *
> + * Returns: void
> + */
> +static void igt_display_all_on(igt_display_t *display)
> +{
> +	struct igt_fb fb[IGT_MAX_PIPES];
> +	enum pipe pipe;
> +	int ret;
> +
> +	/* try to light all pipes */
> +retry:
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
> +						mode->hdisplay, mode->vdisplay,
> +						DRM_FORMAT_XRGB8888,
> +						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> +
> +			/* Set a valid fb as some debugfs like to
> +			 * inspect it on a active pipe
> +			 */
> +			igt_plane_set_fb(primary, &fb[pipe]);
> +			break;
> +		}
> +	}
> +
> +	if (display->is_atomic)
> +		ret = igt_display_try_commit_atomic(display,
> +				DRM_MODE_ATOMIC_TEST_ONLY |
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	else
> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
> +
> +	if (ret) {
> +		igt_output_t *output;
> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
> +
> +		igt_require_f(found, "No valid mode combo found.\n");
> +
> +		for_each_connected_output(display, output)
> +			igt_output_set_pipe(output, PIPE_NONE);
> +
> +		goto retry;
> +	}
> +
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
> +/**
> + * bool igt_kms_all_displays_off: Try to turn off all heads
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
> +}
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
> +
> +igt_main
> +{
> +	int debugfs = -1;
> +	igt_display_t *display;
> +	int fd = -1;
> +	igt_dir_t *igt_dir = NULL;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_ANY);
> +		debugfs = igt_debugfs_dir(fd);
> +		igt_require(debugfs >= 0);
> +
> +		igt_dir = igt_dir_create(debugfs);
> +		igt_require(igt_dir);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		display = calloc(1, sizeof(*display));
> +		igt_display_require(display, fd);
> +	}
> +
> +	igt_subtest("off-read-all") {
> +		igt_display_all_off(display);
> +
> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	igt_subtest("on-read-all") {
> +		/* try to light all pipes */
> +		igt_display_all_on(display);
> +
> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(display);
> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index fa62cbeb9..99dbd4feb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -1,6 +1,7 @@
>  test_progs = [
>  	'core_auth',
>  	'core_debugfs',
> +	'core_debugfs_heads_power',
>  	'core_getclient',
>  	'core_getstats',
>  	'core_getversion',
> -- 
> 2.43.0
> 
