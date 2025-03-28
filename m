Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCCCC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 15:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0026D10EA4B;
	Fri, 28 Mar 2025 15:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fn1N/YOG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCF010EA4B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743176313; x=1774712313;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p0m/8hvp53gvHw61abXATbpmaEgYvR9sPE/dtzZTXvA=;
 b=Fn1N/YOG7lDABgcOdjz1gbWzQnJPo7WiMkvw4aHAgmE3+b3DnbNdGETz
 4WSOH2efn2oDwJ8infAnojrydx6DStQJiazLIkXoKPoap7IyTgoHIQ7l7
 wWSbcu0rUKN9bWK0wYjoEQVFhdKCc5qW5LYnXJtyG0L2dJ0sVBCNw07Zl
 F7+GS64yq3moIyJYcEEba77/HPpCoebqOpENuqT3r8UvYk9N2LTMv09ce
 FW/ctX7tLNcwhSkzvON0KDgfTm4YdU9BYcZ98smSJsbJLxShybmQc9/Bl
 HTfHBkGRE/q4zYkNwxZClCXBBqeCKTrTeNWoCl93r/DCAidD6/n++22G+ A==;
X-CSE-ConnectionGUID: Q6EEEAA1QxqNM7FZmEs7Kg==
X-CSE-MsgGUID: rW2FOUuzSoC5GXwZfZ6s/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="61937126"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="61937126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 08:38:32 -0700
X-CSE-ConnectionGUID: Nk24rvS1Sl6ud5O8mtaP9A==
X-CSE-MsgGUID: y5lx6vcrSW6tiwoCQno32w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="126290437"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 08:38:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 08:38:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 08:38:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 08:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyHwyJtigaqjIKCSjXlitkdpX3CaQh8u2wU+KOjGmkGBcdpFRvEqiZ3mbZB7rgdUBoTCBwYFXw/util32WMoXo/0g5v7k07fz/OT7Okn4zHtxokR3v6fyj7S7xwxcQ11sNgPrac1bDmkRYHNBMO7uuarmctkmJKyecKeiJugPEtRtKpBuLwlpTFB9XqQtYuNoWvlJlvbyEFFSn0QKkX5YgGxhegxWbMvel67MOJz8qELY1DxEbE0NguZASUzJxxc+joJnDACA6QLlqZC34+e6AAr5YzKCnk4ZTOV4KrE0acmpe//9kNIJKTnPBwdsTTujXFq7lyqb+KgrbA/gBswIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzRHrprQhpjQ4qxFrpWdUbSediHVk6/At4ICtzGvAOE=;
 b=Z7mLifYkwYtK+k03Lm5tKz2A7YBJ/xrMc5IKB8FiUaNesSstxGLE0lVPy7/V6jDkJOvkIL+/vItg/HGxTMCXHO4d0AAFHDtugLvUN5RgWnKsXFpgxwp9ThLBtqCGRI9e1E8DVKA0erVX/JUY5WTb9xMCmGSU0Aa0Cc9zxOlMORpbogeD/qGeV6r75NNN8E5Fe6agzQjX06ox4YpogbksCMd8nOs9uAGnByGQWZfzq1cSlaDscqDrkcuiAiu7jj464vEhWYSS0R8o+YXu7qyEVSJnBaSLBmDig3fuMdCtwXVWssBeHr0bJRNYSQ483NzTQYPTImvWBuz2gOMRj1k5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 15:38:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:38:06 +0000
Date: Fri, 28 Mar 2025 11:37:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himanshu.girotra@intel.com>,
 <aditya.chauhan@intel.com>, <pravalika.gurram@intel.com>,
 <sai.gowtham.ch@intel.com>, <ramadevi.gandi@intel.com>,
 <lucas.demarchi@intel.com>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH v3 i-g-t 1/1] tests/intel/intel_sysfs_debugfs Unify sysfs
 and debugfs testing
Message-ID: <Z-bCV4RGgSLhq6zU@intel.com>
References: <20250328101930.231985-1-peter.senna@linux.intel.com>
 <20250328101930.231985-2-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328101930.231985-2-peter.senna@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:303:6b::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: cce3c870-e032-465d-89c4-08dd6e0e88d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?aObXmk6PQf5c3LxdGB8Ok0sZmxcwQW/WTOTy88vUY0aDiiWe/PvrG2EFKU?=
 =?iso-8859-1?Q?UtdibPx1b7qKlhoZSOKN9YiDEWxCmKSM87LHvQJIlbdiGsE77uBOhL0qWc?=
 =?iso-8859-1?Q?ED/QeDt5++b5XKCHzGoYGBlOhyfI9m+JCblKsfetQIUcOBlRzj+FTvai/e?=
 =?iso-8859-1?Q?yf3roW406xW4lVyxstmf4/Z2Al6loChGo0ujgMDm6f2XF6Uuq3ty7GLkMu?=
 =?iso-8859-1?Q?vmJtpqUxHZz2BPubXkfLUe5EB6s77LABR4Z2M0u46BN0ZS2YA+kWZtGdwT?=
 =?iso-8859-1?Q?ux8Nq2ozHSG9qoEYzaqoTN0H3hYkjkgGl2u5HwzwWyx0xwPfoxBWgUjIAs?=
 =?iso-8859-1?Q?x31LaXByPQpQe0t1InQlL8RP1GK8+Rcx0asn3c+sQjBvHm+2pWs22mclDO?=
 =?iso-8859-1?Q?/4Jbj6VeUleHtQFHJlueMLY4qnzZGtjw61M/YGW2Z6tmPAgnr30dBNL4QB?=
 =?iso-8859-1?Q?tjcNr5FX9yOOnR57JBPF3wD364V+oOaYW1pXmixWCWawIVxeg5FOPw/GDB?=
 =?iso-8859-1?Q?UhRe2XAfRhHtqA6o3ZrkK9DmdquPDaDifZR0JKmeKOTlpcQ59y8CNdJQKY?=
 =?iso-8859-1?Q?cT/ev8JGwtkBCQWx/3XjKf24uvhPySXCQSgk2h/7ctIIgoM0Io3sk0Ghnp?=
 =?iso-8859-1?Q?wSejK3IO6cXgNdHlGy4gSGh/o1IYp4NbpoU2e5UOgd6WCp43IMS1bbBlTE?=
 =?iso-8859-1?Q?FuSnGvNqZlhZa0oCAPuBagGwIhD1Wp1+2g2dVwvk6QHW9c3FhSSNTZYnpk?=
 =?iso-8859-1?Q?lzw6gyKqNrZpySURzdDMarIZnEBcsT+NqRZC+u1Z2qzVDPYviPCR3OdTw/?=
 =?iso-8859-1?Q?Dl2nq+LLokrCHbwwD9aeMg0xj0hlgRsqCM+e5EE1oCeeNJaNURfd8sb7f1?=
 =?iso-8859-1?Q?472PMq3yYbpW9RQIulF6a8vCPgmGRYpqXkpCa/qxZf0JK62SqQl4rXntl4?=
 =?iso-8859-1?Q?PqaY5x3C5AkfeOMml22YeJ5Ca7aofGM+FcgRuFCMu/nJjMu8tmg/CUV6dq?=
 =?iso-8859-1?Q?L9+JluldkwHsH9wyDfG5nHRq1T83rQQrucPbvxgVjX//FJxMIV2OowzJ8J?=
 =?iso-8859-1?Q?yVnrAlci/GBVV3MUorIBCxSuZw9+cAKN0n14QXh8W58mkeinDRfArBsVK7?=
 =?iso-8859-1?Q?1R1UEC6Ud19vqsjNSL8n2K7JT19nHqoYJdIYxISrNgGWrHvwHnWdsM5WZD?=
 =?iso-8859-1?Q?b2p5eUnpjId5ItM9tl/x8egRC15lAb17KHSJ05EYMeXQsop3LcThGSyXNx?=
 =?iso-8859-1?Q?5xXX9Y914t0tfQto+n4U6ptEA3H+YNjy311dJLrP5bVXAOYNcs26QXhlhR?=
 =?iso-8859-1?Q?+1yq4DW+E0wajZ1lGle+l+azpnVPHVCUo+5Wr+ZJFhdBSTVIbKurYlvi2Y?=
 =?iso-8859-1?Q?V3adlgctX9Zinm7gGjgEchEqVRulxqk9adf6z20pz3KzBc/wU10txzr4lu?=
 =?iso-8859-1?Q?RAWbCdW85PPiATw5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g4lEaYWEuqveSDAzOaHaP8HPDblbbTXy41ZtUpCFLuUNAdAFjaFXcQpEuO?=
 =?iso-8859-1?Q?J7ZTZLQwqLbkc6GB399tATp8mDJembG32lrXLobzzYLanwjf8dGOqJ/o3V?=
 =?iso-8859-1?Q?xedmXXk/xD//6Xztpqhi46P7iUKc+czne32oN+4rOuPYtCbeQ5/qIFX1Rg?=
 =?iso-8859-1?Q?Qv9cUSib9u3tDzl45T5MXUqLbEcILud5b73BUgNRj1QsbjAyK+zIcnUYHt?=
 =?iso-8859-1?Q?tNELJ3PW0/L0AZOdcpvITx0X0BCKyTFQ0do00SYxbP3lcDqAKxmkG/5QiO?=
 =?iso-8859-1?Q?kYxtRFp/K9TTlaREgBNd0ZFBogl3ymtAAIBcoRvHrrIy9HeEq4Gyi1SMNS?=
 =?iso-8859-1?Q?YGFgw6O+zQmYyRsh7My6XeeDHmC693nsp/G2g4O/9o+B539zfH5QyHNpTU?=
 =?iso-8859-1?Q?2LR4295mC82AGk2N/gYjLFftzzzQ1+8oBOBeNfGXRjbYZkfClfGjeLD9kH?=
 =?iso-8859-1?Q?FbphrT4qNBGXmyHhVS8gMedaFGyYgX3smklZFLq8RJjgJk2vHZpig5rOLT?=
 =?iso-8859-1?Q?6LALtfZYMXKuhBEqoRqwFF1141MDvXmkaQmpw2XPzUWwAbND4AQKdSfJNe?=
 =?iso-8859-1?Q?riga0J/z1U0RYJT4acuho9CxtLYMTOTXFmvO44TKlD1xOXEoZzlqX5FVU4?=
 =?iso-8859-1?Q?ArzT8T1LO19EMv0TnOljgS3Sh2/ZK7x1CTAuHd60TSuzosPIBi4HXGPT2U?=
 =?iso-8859-1?Q?WGtCweG4ydxKGFpYrBVa7UgQ1mN00lpVweyE0b91H4k9TwDdoSA6C/OeVf?=
 =?iso-8859-1?Q?Rfx8A45YkjSL+vMi2/vgFayBUJNQY6F1yrUInLFO9A+JIwLLyDJeNZrsEe?=
 =?iso-8859-1?Q?MNEKSSlw+JE63iENc6VEDpLq0n+GTgrLmkuXRmN5lNhfY/JZkY0xSE/ORN?=
 =?iso-8859-1?Q?uuUpS9xP7uO5uVDSMKA+jc/hK/iAr80u5Oplp872Zx4hDyuRsUZD13Jds3?=
 =?iso-8859-1?Q?/GJBhU1DCRqQZwauWN/gQ0UI6sKIFapeMobD4VQKCrPSN2eTEmL53Xi7PE?=
 =?iso-8859-1?Q?8lL64UsA5nUhxFX11LjVHCxB4JXPg6mPiDKCzigMf81dSAt8nMjkymeVsa?=
 =?iso-8859-1?Q?d4reRUAThXmhkFPW+6K28B8pDUS4/J2G92fIm9w6460t06JwXy7gU9Wx1n?=
 =?iso-8859-1?Q?rqrhOblHJt9SJ4uVZbk2HuEjARL4WI+DcO6A2sW0IbmmcuhCvD0NGxjTHF?=
 =?iso-8859-1?Q?A38GYhp6gxmFmYOoVz9qeVUdiBRhmILaY/VWz5be8APTWuRkeGOCb4ZAsz?=
 =?iso-8859-1?Q?PzUb0Ra/eyJsCFimUkfaTomB2xsB776IVhBvyKMj5GuESBx4nbxf/UpBf4?=
 =?iso-8859-1?Q?gLoVt9PUESCzk/aKvX7onKNLssP92Nb98UF/zq4uYBHWmDxCaljfsn3L1+?=
 =?iso-8859-1?Q?OsllTNkIk9TUEzJf0336JWBWgAMot5TNg7JUMJNf14fw1M1xUyj3iu7wOS?=
 =?iso-8859-1?Q?euZnZoyi/bSZ25ZJYJWwPiccNo1TJ1XfApcvg7QJVEydi0w9Ow8MFBQIgX?=
 =?iso-8859-1?Q?OqWqsKxTk/vP6XDmxFc0XNAmASwrh0Mxutbjj0+igVeF2DBuAXulNp0Ykh?=
 =?iso-8859-1?Q?qelNCZCRaGqXA/Z4Q1pRHHpvGViNE56/zR3DHEPR8K0VhgT8VmKP1KDqSO?=
 =?iso-8859-1?Q?P4FBXNOozZGV1JuOyusGLmbNiqiQc14luizNpi3dqR1UKiNpZkRk+mVg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cce3c870-e032-465d-89c4-08dd6e0e88d2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:38:06.3403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nr1STCLGvX9+Gs02y7x7dojHmcYrsIYOWZxUIhOTwbPGc3/gky/ClthDh1x3V6noyx74CCg5/YFV3Kx8uwBBPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
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

On Fri, Mar 28, 2025 at 11:19:30AM +0100, Peter Senna Tschudin wrote:
> Introduces intel_sysfs_debugfs, replacing debugfs_test and xe_debugfs.
> It organizes tests into separate subgroups for i915 and xe, ensuring
> only the relevant tests run for each driver.
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
>  - xe-base
>  - xe-gt
>  - xe-forcewake
> 
> This unification closes testing gaps between i915 and Xe while
> simplifying code maintenance.
> 
> Cc: himanshu.girotra@intel.com
> Cc: aditya.chauhan@intel.com
> Cc: pravalika.gurram@intel.com
> Cc: sai.gowtham.ch@intel.com
> Cc: ramadevi.gandi@intel.com
> Cc: lucas.demarchi@intel.com
> Cc: rodrigo.vivi@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> v3:
>  - rename test to intel_sysfs_debugfs
>  - fix copy paste error on commit message
>  - expand Cc list
> 
> v2:
>  - renamed xe-specific functions with the xe_ prefix
>  - created two igt_subtest_groups: one for i915 and another for Xe
>  - prefixed each test with either i915 or xe
> 
>  tests/intel/intel_sysfs_debugfs.c | 500 ++++++++++++++++++++++++++++++
>  tests/meson.build                 |   1 +
>  2 files changed, 501 insertions(+)
>  create mode 100644 tests/intel/intel_sysfs_debugfs.c
> 
> diff --git a/tests/intel/intel_sysfs_debugfs.c b/tests/intel/intel_sysfs_debugfs.c
> new file mode 100644
> index 000000000..55c83a48a
> --- /dev/null
> +++ b/tests/intel/intel_sysfs_debugfs.c
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
> index 2f5406523..ad32773df 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -83,6 +83,7 @@ test_progs = [
>  intel_i915_xe_progs = [
>  	'api_intel_allocator',
>  	'intel_hwmon',
> +	'intel_sysfs_debugfs',
>  ]
>  
>  intel_i915_progs = [
> -- 
> 2.34.1
> 
