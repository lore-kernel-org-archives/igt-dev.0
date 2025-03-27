Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C773DC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 22:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD9310E161;
	Thu, 27 Mar 2025 22:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwjAAauo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B25710E161
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743114155; x=1774650155;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l4XRylVtLM8ewWMAaDfOIiIWEDywDThuh9UNOSaIdy8=;
 b=CwjAAauosGDQkZNfcsIfYNXQPQJHReVEoDrAbu74asTQ448kEm2xr7Kx
 AkHn5AyDgfLF5JiRa1NOkvuHzZaI+2AKBTQ/ZJRknHMQDEqYstDXh8wrN
 eFg1iP8JqFFDjeE2seoHCwumgET628tqnA73tvtzOl2ShuTOoJS7nPBvq
 C3tWQkYupGIzfm3r4iR+uxwe4JZai7VkE9FvVdznaZoNVpu2wEC3ecW57
 rLksxEtkBEJ4BgI6iHwN4DNYGL1xal376KQiOmYsPU9OcF/7EkDax9s/n
 LRDKTDaPk83LsWeDVXerXqmo0574Vn/ih2s4TXf44bGIxf/xCVSFDj22f Q==;
X-CSE-ConnectionGUID: fA9fDsopRZOjVyRPZO0YyA==
X-CSE-MsgGUID: 2R6HFZipQ+WKqQweq6vC+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44483955"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44483955"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 15:22:32 -0700
X-CSE-ConnectionGUID: oDQrIpFlSsqQCk6yOo6GNg==
X-CSE-MsgGUID: dIpQqb7bReicV25ash/B/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="130135708"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 15:22:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 15:22:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 15:22:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 15:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAzPJx2P/1glAFFAqpdYpDaXhK1tV6Mrx5IlDdMhYJeYFC2exjv+s016homNyqjJONU33z8V5NAmyt8iM3vdyde/eeQozEdKXycRIsTVbw71rANiQpoiYuemJfnAdV6hzZ/v/NQAI1m+MTX0r0ERTtqJ2ntVmvbN4BMXx5odzPdV8RHbg+JOcgTMXmuTNYXsz2HHstRuPpjFp+rgxu/+FN3EOS8+G8KxEw1KT3Y1ac/ad5rfz37XCwO2mLSspLBwlQPYCFoZ85fjHS58OsxgOw8LJ5ogfry8sCE7HtR7kpVhIE818VqdYYZIhcQu7fQxQ2FptpvXK0JjtQ1aPEiE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+FsXf8m6mIxlGHC+8bX9fSS0LJOcfgpT1/2HAeIXyM=;
 b=Fh78Z7IP+dFPJY4BIMUFzVb+yyBPcA5WFnXYHsNy3E5vKPNoE6aMuvN1sJxW5P0oDEleH38rt9e9Uh809cBxuuZsTwDxjDLjEIQ/8ekfhYJ2EOrp6qp7i45WKqbYpvpr5UmA2w9ixdL+81VWv7Cao+5gNAz+RaEYHueQbshkxgMI4k5lmyKJ19L+37yNF7D/TJ1yPiicKe3ZblvwI2U2evsZ10wkMt7dYCKgnTCPjT0z8DJPh14CPM3tXfcotiRVv/t4/COYspuYTwId08j5mAcFfcpufgs/kllEPCh4ghl0jMPz5nPAVXLA8iTDRC21NHxRk2aYl7OngNK1pqfpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 22:22:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 22:22:27 +0000
Date: Thu, 27 Mar 2025 18:22:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/1] tests/intel/intel_kernelfs: Unify sysfs and
 debugfs testing
Message-ID: <Z-XPoLxOWgUpvIXK@intel.com>
References: <20250318213755.366638-1-peter.senna@linux.intel.com>
 <20250322130316.272087-1-peter.senna@linux.intel.com>
 <20250322130316.272087-2-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250322130316.272087-2-peter.senna@linux.intel.com>
X-ClientProxiedBy: MW3PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:303:2a::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 26bac2ef-b519-4eb0-629d-08dd6d7ddb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TQ/IWkHUfb8D1hbj4MHJL9Oeg15NbqmDoxEh1OOB7S/jLnjvZkhjAnNe9C?=
 =?iso-8859-1?Q?Xfnkg/xx61CnDayeEdAbjFUMMhqfSbBE7ZKBDQN1efxAMfswcjYWGf+esi?=
 =?iso-8859-1?Q?N3NUfrl+3KD1yNdIDbqZomnGhbbxE5r75VNNNrF6e1uSZ+9Fh1tazMOrOY?=
 =?iso-8859-1?Q?YD6XciRRsxWrGdnp3+a/MNyNJJaLwrRjdWYIhXxXDia23Fchw6Cg6eLw8E?=
 =?iso-8859-1?Q?Giv/18UTtOTmVEWJ8WGsZTakslnIr0XXm8+yxgjBNgR1h2GLyaHUa7/XtY?=
 =?iso-8859-1?Q?9fiGwNvBfmtSjg06eWTntWvdty5LbMXfr7a5qzert7W1oDlcMHiRV0azbQ?=
 =?iso-8859-1?Q?HtVJ5FixL9GPXJLZsOZCXXmailj956Fo0gBtsaiz20EDJgANrbGGGJb83e?=
 =?iso-8859-1?Q?gfr2giPk9cC26pEKmtcm2XBUE/qtiPnktdAkEvz2s0OzXXGHIxmhSS5aWl?=
 =?iso-8859-1?Q?B4mK8pNxUvO/CTJPwlTcgMM6UNFaWXZ4XRJtros8uge/EUe7ZmqvZY8oqV?=
 =?iso-8859-1?Q?dkWmnjBZFb/bVpYfgvwZO8gaiKA9cPxxMoF7IfpR5i/7xS/VLQrma5f0hP?=
 =?iso-8859-1?Q?y0rkMT71+wE31BM6fzRWFazLGdDLCDLycGES/elQJ6UAP6o4VzBkk2znCV?=
 =?iso-8859-1?Q?zcSY3xLYyQz2I2b/09a8eXNYyaeVuiwrnf3upZPY1kYzPDI7t7JgEB5fcJ?=
 =?iso-8859-1?Q?q/Eg2dteegM4TlWbJHOal1WwcQ5MS5tdNn3lB0gLUFQHo3jgju8FqGATbr?=
 =?iso-8859-1?Q?Fl+xU09x3Z6bfHT6BRlJsf9M2O9E4ng6S+Fr7rTWiF2VfwSbcHm8WHY7zL?=
 =?iso-8859-1?Q?e8GQ0imdUsV+a0bVO3PDQwXQ/PitI+0InB5nwkdtQLWdRVXz/z2dlvmN57?=
 =?iso-8859-1?Q?cyDkmhC4zpq+w3TeUh0wB2wA+UJ/IeK4A9FlpLaItLCpqp4uLNn8XeD6Wh?=
 =?iso-8859-1?Q?Kxu9Vf2Iyv+3BvMm12BMccbRXP9Nc4CGgTF6S80BEDwhCpcYsxrEnS9067?=
 =?iso-8859-1?Q?/nqQE90/wtui0lT2n3pNsixmFedmQ4Sr9UWUj561VCAiJUDPNik75I9nOg?=
 =?iso-8859-1?Q?dFiBKsfulT/Uyly8XYyp7lYNVkyDlWgpBbekebcOvwUaGrRwqdnVi38UUD?=
 =?iso-8859-1?Q?Zg8YSuFFkue8fgMkHaJtV/QJCMGFriFnFRlu6hmDucwwALGnviGo7Dac7r?=
 =?iso-8859-1?Q?+gLXjqXCk4p9QD82iZCNb4O/3NENm+8dlLca9oiMPPYVpfxXie6rxiacO2?=
 =?iso-8859-1?Q?MhHpbZ81PDewdaTpVOicXxmFbVod+GtXSLYxqqp12hAPOjgZ1A6Dyks3ve?=
 =?iso-8859-1?Q?ymfiT/4YxaBLaYDm6mwd+E6TtMC73Di1n6RiVYU5sVtUmC96cS2xnvy+En?=
 =?iso-8859-1?Q?jwVMxFYmx4yQ1a+d/CFjQyjVjtgGwjl7RSPVirvKcx+9PPRjsr/u0QwxHo?=
 =?iso-8859-1?Q?hHu9LjlDXOkqy02m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UMZ7+sNt1KaddhSS7L0zD2wFSncznZdP9q+4hpaExxkaFNkdcGcB8oG4b7?=
 =?iso-8859-1?Q?327yhrpOFp0sFwEtQ0G9hxFbEFh6SmjH3eJqvoWL1W8H/IMbilqUy0S+zu?=
 =?iso-8859-1?Q?qCw6GHrPQj+2hwCg5el5fPQloa/pd6/yoOO9Q07mgqM3Ly4XvSwNpRd2ya?=
 =?iso-8859-1?Q?RQj3Z+LtxrNRK/z29Ylyr4VQqUIonxX1I7maypP5tY/euTgMF7B1aLJ/9/?=
 =?iso-8859-1?Q?Ikby1R/CrPERvaXV9WujCB1ehbeRe243iyC+XRRSDr3K1SYqLwFRHSXos1?=
 =?iso-8859-1?Q?UMcShV5vBzL3kW7BQHBm60IYHZk96fs+M7Cz1jIkmLyt9wzXXfJd52WrEB?=
 =?iso-8859-1?Q?MJhz7CGZ+JAO6Wj10Ci4D93CGh6ghJXtCyDwLS8ebyrZhTyMBhZDTmOFA1?=
 =?iso-8859-1?Q?9i8Tp85Vqy+F07nJr5PPe5tIxDdVTmMDLWYiBIkV+o7Oc5c0WTvFzkkZtI?=
 =?iso-8859-1?Q?ngxes3Kc+xA3XXzADfQerVNCQVl0jAlfIR45chCsxlPr35QJnk8ItwEb/p?=
 =?iso-8859-1?Q?hwlecpL+YOavih/jfSTB9Dav3mP3jkQKtQbQw/OP+VFLQnhWqg5QahKfQA?=
 =?iso-8859-1?Q?ZuAcaUWL3A/H29vsrFSqyXPYcqvl0LyIYYP4ezvUpj5gTKc7gGzFxzcNtB?=
 =?iso-8859-1?Q?Fkt5aFhqcATyfplOG1XpQZBwqqx2hMeqxtsKKz6m526gZFYbAozHg90M0c?=
 =?iso-8859-1?Q?zVy4flCKpa/2YIyl8UQ4BCjwVD9YzjAeXUoJSMpm/I2f0gk04etmb0WXaz?=
 =?iso-8859-1?Q?qFGeWGxuYiK+brh2p/wSrhBSpKtLp1hGKZrCJ78efjRjVR8vQXfbEnTvCH?=
 =?iso-8859-1?Q?MTmVOXN+FjP+okvyrfesibmOpfaVeuMF33KHCapRt8hzZzyHaVwFjDLCok?=
 =?iso-8859-1?Q?JzfemEpxPISBADbIiFxsobBZlI5sA6ByMY21Sn2OGGZ6qOs/utgFi2KmQM?=
 =?iso-8859-1?Q?m9STSafkKkYeFIjCeQboCbWcY1Yi1BwVoGEe1wU4NpNZjPu1PEXC+OHYMj?=
 =?iso-8859-1?Q?Wpm96yOHWslt+e90FB8o9Yk3z/I8aAvtcGVrA5R8B/VXjY1teKXed0vTep?=
 =?iso-8859-1?Q?05GkxS6+368+c9JsXlPX1TXBbkRNXiNkdjj93zh7elX3araHEekVLMWFXr?=
 =?iso-8859-1?Q?HyRrI0rI6iaBjrCML50DjIr+Sa3rdZR7DDfVP5v0B+MwtRxj7pOfgtlZSO?=
 =?iso-8859-1?Q?PJGEo90S5LijFm87IfmkEYo9S3Jw5jO76CE2eP/IRs5nO/5W5xARq+g2n7?=
 =?iso-8859-1?Q?pToLIelcGvITQswOYwTY55Spq9JEvZCn0Tv4ddK9b9q0RAm9EnKM1MXnwL?=
 =?iso-8859-1?Q?EJkBU8Sh3BcA2LOF8RpyqNElXbM7KzuM17NHL1ErrArbhfCNDWHrfg0snp?=
 =?iso-8859-1?Q?sTetFY4kwDqDxAfi7h82kkifRYO3fliX4NofXCRFi9FZTCsgewjg6At9zm?=
 =?iso-8859-1?Q?o9yUPMuC6l/vRuwRunpNuBlPEyBkR0v78Qofp67DZp15PyBV/IqBksXSff?=
 =?iso-8859-1?Q?JqC1PkVoEnOU9noXU5snlhmfNSzhoXCpPahNX/nr0MQBb/t7KzAQiKITfy?=
 =?iso-8859-1?Q?uhe9GvhPHs1FtsUGfPPS393KptOqYRAXufTyEnIKiD2KaBpr9qVGAr39P/?=
 =?iso-8859-1?Q?g4ZV91IM9UY6fw9HpCe7nzKQZtzYN2TwosBfxaXzAgju4SfwL1IKuRkg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bac2ef-b519-4eb0-629d-08dd6d7ddb33
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 22:22:27.5423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2Z9StHxck6RR6ZurHdgZJTDYdqMt4zG51/MMx1+URBwZ+uylv04be9lO1GUABcOwa+dsl5u4ui3wXXQbyyWmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

On Sat, Mar 22, 2025 at 02:03:16PM +0100, Peter Senna Tschudin wrote:
> Introduces intel_kernelfs, replacing debugfs_test and xe_debugfs. It
> organizes tests into separate subgroups for i915 and xe, ensuring only
> the relevant tests run for each driver.
> 
> i915 test list:
>  - i915-sysfs-read-all-entries
>  - i915-debugfs-read-all-entries
>  - i915-debugfs-read-all-entries-display-on
>  - i915-debugfs-read-all-entries-display-off
> 
> Xe test list:
>  - xe-sysfs-read-all-entries
>  - xe-debugfs-read-all-entries
>  - xe-debugfs-read-all-entries-display-on
>  - xe-debugfs-read-all-entries-display-off
>  - xe-debugfs-read-all-entries-display-off
>  - xe-base
>  - xe-gt
>  - xe-forcewake
> 
> This unification closes testing gaps between i915 and Xe while
> simplifying code maintenance.
> 
> Cc: kamil.konieczny@linux.intel.com
> Cc: rodrigo.vivi@intel.com
> Cc: katarzyna.piecielska@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> 
> v2:
>  - renamed xe-specific functions with the xe_ prefix
>  - created two igt_subtest_groups: one for i915 and another for Xe
>  - prefixed each test with either i915 or xe
> 
>  tests/intel/intel_kernelfs.c | 500 +++++++++++++++++++++++++++++++++++
>  tests/meson.build            |   1 +
>  2 files changed, 501 insertions(+)
>  create mode 100644 tests/intel/intel_kernelfs.c
> 
> diff --git a/tests/intel/intel_kernelfs.c b/tests/intel/intel_kernelfs.c
> new file mode 100644
> index 000000000..55c83a48a
> --- /dev/null
> +++ b/tests/intel/intel_kernelfs.c
> @@ -0,0 +1,500 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +
> +#include "i915/gem.h"
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_query.h"
> +
> +struct {
> +	bool warn_on_not_hit;
> +} opt = { 0 };
> +
> +/**
> + * TEST: debugfs test
> + * Description: Read entries from debugfs, and sysfs paths.
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: i915-debugfs-read-all-entries
> + * Description: Read all entries from debugfs path validating debugfs entries
> + *
> + * SUBTEST: i915-debugfs-read-all-entries-display-off
> + * Description: Read all debugfs entries with display off.
> + *
> + * SUBTEST: i915-debugfs-read-all-entries-display-on
> + * Description: Read all debugfs entries with display on.
> + *
> + * SUBTEST: i915-sysfs-read-all-entries
> + * Description: Read all entries from sysfs path validating debugfs entries
> + *
> + * SUBTEST: xe-debugfs-read-all-entries
> + * Description: Read all entries from debugfs path validating debugfs entries
> + *
> + * SUBTEST: xe-debugfs-read-all-entries-display-off
> + * Description: Read all debugfs entries with display off.
> + *
> + * SUBTEST: xe-debugfs-read-all-entries-display-on
> + * Description: Read all debugfs entries with display on.
> + *
> + * SUBTEST: xe-sysfs-read-all-entries
> + * Description: Read all entries from sysfs path validating debugfs entries
> + *
> + */
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
> +
> +static void read_and_discard_sysfs_entries(int path_fd, int indent)
> +{
> +	struct dirent *dirent;
> +	DIR *dir;
> +	char tabs[8];
> +	int i;
> +
> +	igt_assert(indent < sizeof(tabs) - 1);
> +
> +	for (i = 0; i < indent; i++)
> +		tabs[i] = '\t';
> +	tabs[i] = '\0';
> +
> +	dir = fdopendir(path_fd);
> +	if (!dir)
> +		return;
> +
> +	while ((dirent = readdir(dir))) {
> +		if (!strcmp(dirent->d_name, ".") ||
> +		    !strcmp(dirent->d_name, ".."))
> +			continue;
> +
> +		if (dirent->d_type == DT_DIR) {
> +			int sub_fd;
> +
> +			sub_fd = openat(path_fd, dirent->d_name,
> +					O_RDONLY | O_DIRECTORY);
> +			if (sub_fd < 0)
> +				continue;
> +
> +			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
> +			read_and_discard_sysfs_entries(sub_fd, indent + 1);
> +			close(sub_fd);
> +		} else if (dirent->d_type == DT_REG) {
> +			char buf[512];
> +			int sub_fd;
> +			ssize_t ret;
> +
> +			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
> +			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
> +			igt_set_timeout(5, "reading sysfs entry");
> +
> +			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
> +			if (sub_fd == -1) {
> +				igt_debug("%sCould not open file \"%s\" with error: %m\n",
> +					  tabs, dirent->d_name);
> +				continue;
> +			}
> +
> +			do {
> +				ret = read(sub_fd, buf, sizeof(buf));
> +			} while (ret == sizeof(buf));
> +
> +			if (ret == -1)
> +				igt_debug("%sCould not read file \"%s\" with error: %m\n",
> +					  tabs, dirent->d_name);
> +
> +			igt_reset_timeout();
> +			close(sub_fd);
> +		}
> +	}
> +	closedir(dir);
> +}
> +
> +static void kms_tests(int fd, int debugfs, const char *card_name)
> +{
> +	igt_display_t display;
> +	struct igt_fb fb[IGT_MAX_PIPES];
> +	enum pipe pipe;
> +	int ret;
> +	char test_name[64];
> +
> +	igt_fixture
> +		igt_display_require(&display, fd);
> +
> +	snprintf(test_name, sizeof(test_name),
> +		 "%s-debugfs-read-all-entries-display-on", card_name);
> +
> +	igt_subtest(test_name) {
> +		/* try to light all pipes */
> +retry:
> +		for_each_pipe(&display, pipe) {
> +			igt_output_t *output;
> +
> +			for_each_valid_output_on_pipe(&display, pipe, output) {
> +				igt_plane_t *primary;
> +				drmModeModeInfo *mode;
> +
> +				if (output->pending_pipe != PIPE_NONE)
> +					continue;
> +
> +				igt_output_set_pipe(output, pipe);
> +				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +				mode = igt_output_get_mode(output);
> +				igt_create_pattern_fb(display.drm_fd,
> +						      mode->hdisplay, mode->vdisplay,
> +						      DRM_FORMAT_XRGB8888,
> +						      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> +
> +				/* Set a valid fb as some debugfs like to
> +				 * inspect it on a active pipe
> +				 */
> +				igt_plane_set_fb(primary, &fb[pipe]);
> +				break;
> +			}
> +		}
> +
> +		if (display.is_atomic)
> +			ret = igt_display_try_commit_atomic(&display,
> +					DRM_MODE_ATOMIC_TEST_ONLY |
> +					DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					NULL);
> +		else
> +			ret = igt_display_try_commit2(&display, COMMIT_LEGACY);
> +
> +		if (ret) {
> +			igt_output_t *output;
> +			bool found = igt_override_all_active_output_modes_to_fit_bw(&display);
> +
> +			igt_require_f(found, "No valid mode combo found.\n");
> +
> +			for_each_connected_output(&display, output)
> +				igt_output_set_pipe(output, PIPE_NONE);
> +
> +			goto retry;
> +		}
> +
> +		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +		read_and_discard_sysfs_entries(debugfs, 0);
> +	}
> +
> +	snprintf(test_name, sizeof(test_name),
> +		 "%s-debugfs-read-all-entries-display-off", card_name);
> +
> +	igt_subtest(test_name) {
> +		igt_output_t *output;
> +		igt_plane_t *plane;
> +
> +		for_each_connected_output(&display, output)
> +			igt_output_set_pipe(output, PIPE_NONE);
> +
> +		for_each_pipe(&display, pipe)
> +			for_each_plane_on_pipe(&display, pipe, plane)
> +				igt_plane_set_fb(plane, NULL);
> +
> +		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +		read_and_discard_sysfs_entries(debugfs, 0);
> +	}
> +
> +	igt_fixture
> +		igt_display_fini(&display);
> +}
> +
> +static int xe_validate_entries(int fd, const char *add_path,
> +			       const char * const str_val[], int str_cnt)
> +{
> +	int i;
> +	int hit;
> +	int found = 0;
> +	int not_found = 0;
> +	DIR *dir;
> +	struct dirent *de;
> +	char path[PATH_MAX];
> +
> +	if (!igt_debugfs_path(fd, path, sizeof(path)))
> +		return -1;
> +
> +	strcat(path, add_path);
> +	dir = opendir(path);
> +	if (!dir)
> +		return -1;
> +
> +	while ((de = readdir(dir))) {
> +		if (de->d_name[0] == '.')
> +			continue;
> +		hit = 0;
> +		for (i = 0; i < str_cnt; i++) {
> +			if (!strcmp(str_val[i], de->d_name)) {
> +				hit = 1;
> +				break;
> +			}
> +		}
> +		if (hit) {
> +			found++;
> +		} else if (opt.warn_on_not_hit) {
> +			not_found++;
> +			igt_warn("no test for: %s/%s\n", path, de->d_name);
> +		}
> +	}
> +	closedir(dir);
> +	return 0;
> +}
> +
> +/**
> + * SUBTEST: xe-base
> + * Description: Check if various debugfs devnodes exist and test reading them
> + */
> +static void
> +xe_test_base(int fd, struct drm_xe_query_config *config)
> +{
> +	uint16_t devid = intel_get_drm_devid(fd);
> +	static const char * const expected_files[] = {
> +		"gt0",
> +		"gt1",
> +		"stolen_mm",
> +		"gtt_mm",
> +		"vram0_mm",
> +		"forcewake_all",
> +		"info",
> +		"gem_names",
> +		"clients",
> +		"name"
> +	};
> +	char reference[4096];
> +	int val = 0;
> +
> +	igt_assert(config);
> +	sprintf(reference, "devid 0x%llx",
> +			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
> +	sprintf(reference, "revid %lld",
> +			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
> +	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
> +
> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
> +	if (intel_gen(devid) < 20) {
> +		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
> +		case 48:
> +			val = 3;
> +			break;
> +		case 57:
> +			val = 4;
> +			break;
> +		}
> +
> +		sprintf(reference, "vm_max_level %d", val);
> +		igt_assert(igt_debugfs_search(fd, "info", reference));
> +	}
> +
> +	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
> +	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
> +
> +	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
> +	igt_debugfs_dump(fd, "gtt_mm");
> +
> +	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
> +		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
> +		igt_debugfs_dump(fd, "vram0_mm");
> +	}
> +
> +	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
> +		igt_debugfs_dump(fd, "stolen_mm");
> +
> +	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
> +	igt_debugfs_dump(fd, "clients");
> +
> +	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
> +	igt_debugfs_dump(fd, "gem_names");
> +
> +	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
> +}
> +
> +/**
> + * SUBTEST: xe-gt
> + * Description: Check all gt debugfs devnodes
> + * TODO: add support for ``force_reset`` entries
> + */
> +static void
> +xe_test_gt(int fd, int gt_id)
> +{
> +	char name[256];
> +	static const char * const expected_files[] = {
> +		"uc",
> +		"steering",
> +		"topology",
> +		"sa_info",
> +		"hw_engines",
> +		"pat",
> +		"mocs",
> +//		"force_reset"
> +		"ggtt",
> +		"register-save-restore",
> +		"workarounds",
> +		"default_lrc_rcs",
> +		"default_lrc_ccs",
> +		"default_lrc_bcs",
> +		"default_lrc_vcs",
> +		"default_lrc_vecs",
> +		"hwconfig"
> +
> +	};
> +	static const char * const expected_files_uc[] = {
> +		"huc_info",
> +		"guc_log",
> +		"guc_info",
> +//		"guc_ct_selftest"
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
> +		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
> +			continue;
> +		igt_debugfs_dump(fd, name);
> +	}
> +
> +	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
> +		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
> +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +		igt_debugfs_dump(fd, name);
> +	}
> +
> +	sprintf(name, "/gt%d", gt_id);
> +	xe_validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
> +
> +	sprintf(name, "/gt%d/uc", gt_id);
> +	xe_validate_entries(fd, name, expected_files_uc, ARRAY_SIZE(expected_files_uc));
> +}
> +
> +/**
> + * SUBTEST: xe-forcewake
> + * Description: Check forcewake debugfs devnode
> + */
> +static void
> +xe_test_forcewake(int fd)
> +{
> +	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
> +
> +	igt_assert_neq(handle, -1);
> +	close(handle);
> +}
> +
> +const char *help_str =
> +	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
> +
> +struct option long_options[] = {
> +	{ "--warn-not-hit", no_argument, NULL, 'w'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +static int opt_handler(int option, int option_index, void *input)
> +{
> +	switch (option) {
> +	case 'w':
> +		opt.warn_on_not_hit = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +	int debugfs = -1;
> +	char devnode[PATH_MAX];
> +	int fd = -1;
> +	int gt;
> +	int sysfs = -1;
> +
> +	igt_subtest_group {
> +		igt_fixture {
> +			fd = drm_open_driver_master(DRIVER_INTEL);
> +			igt_require_gem(fd);
> +			debugfs = igt_debugfs_dir(fd);
> +			sysfs = igt_sysfs_open(fd);
> +
> +			kmstest_set_vt_graphics_mode();
> +		}
> +
> +		igt_describe("Read all entries from sysfs path.");
> +		igt_subtest("i915-sysfs-read-all-entries")
> +			read_and_discard_sysfs_entries(sysfs, 0);
> +		igt_describe("Read all entries from debugfs path.");
> +		igt_subtest("i915-debugfs-read-all-entries")
> +			read_and_discard_sysfs_entries(debugfs, 0);
> +
> +		igt_describe("Read all debugfs entries with display on/off.");
> +		igt_subtest_group
> +			kms_tests(fd, debugfs, "i915");
> +
> +		igt_fixture {
> +			close(sysfs);
> +			close(debugfs);
> +			drm_close_driver(fd);
> +		}
> +	}
> +
> +	igt_subtest_group {
> +		igt_fixture {
> +			fd = drm_open_driver_master(DRIVER_XE);
> +			__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
> +			debugfs = igt_debugfs_dir(fd);
> +			sysfs = igt_sysfs_open(fd);
> +
> +			kmstest_set_vt_graphics_mode();
> +		}
> +
> +		igt_describe("Read all entries from sysfs path.");
> +		igt_subtest("xe-sysfs-read-all-entries")
> +			read_and_discard_sysfs_entries(sysfs, 0);
> +		igt_describe("Read all entries from debugfs path.");
> +		igt_subtest("xe-debugfs-read-all-entries")
> +			read_and_discard_sysfs_entries(debugfs, 0);
> +
> +		igt_describe("Read all debugfs entries with display on/off.");
> +		igt_subtest_group
> +			kms_tests(fd, debugfs, "xe");
> +
> +		igt_describe("Check if various debugfs devnodes exist and test reading them.");
> +		igt_subtest("xe-base") {
> +			xe_test_base(fd, xe_config(fd));
> +		}
> +
> +		igt_describe("Check all gt debugfs devnodes");
> +		igt_subtest("xe-gt") {
> +			xe_for_each_gt(fd, gt) {
> +				snprintf(devnode, sizeof(devnode), "gt%d", gt);
> +				igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
> +				xe_test_gt(fd, gt);
> +			}
> +		}
> +
> +		igt_describe("Check forcewake debugfs devnode");
> +		igt_subtest("xe-forcewake") {
> +			xe_test_forcewake(fd);
> +		}
> +
> +		igt_fixture {
> +			close(sysfs);
> +			close(debugfs);
> +			drm_close_driver(fd);
> +		}
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2f5406523..c98bd45ff 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -83,6 +83,7 @@ test_progs = [
>  intel_i915_xe_progs = [
>  	'api_intel_allocator',
>  	'intel_hwmon',
> +	'intel_kernelfs',

The patch looks great, thank you. The only thing that I'm not 100% comfortable with
is its name, since kernelfs is not a real thing. perhaps intel_sysfs_debugfs?
But I'm also terrible with name so not a blocker.

Another thing, perhaps we should delete the other tests that this one here is
currently replacing?

>  ]
>  
>  intel_i915_progs = [
> -- 
> 2.34.1
> 
