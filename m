Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEA5C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 12:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0822710E137;
	Wed, 21 Aug 2024 12:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGaY7TAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C3510E137
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724243719; x=1755779719;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=duyAxILFRaOknss1CjDyhoEk27RmcAm8WDErQHgXLD8=;
 b=JGaY7TARjP6JjJCDWxzJaT9phYGnDndx0WU16uGI3Y1ONWLKNwYVpd2h
 7SApg+zkciiRzf8r3EpMX1HNfrlT984BgGESkXZidYazyZkYp3d3Indca
 6fz+JSrVxjpDXLohw2uAj37DwyOQSCttoDE594ivw0OL6+9b9ZgHR0Hos
 ebgb2d6Eo69+Jj4joF+SmULLyj+OXNJVI0RyIwNwf7Ob+b0OcQIhPVS13
 u8HdWWbnQJlUG0Tg2hNf42cHtz34y6UPM34ASfH9a16ybFpXol3XNwT5w
 7mf4CWL7Iki/P0yMVPUe7WvGG9shtZwMvoeuTajxgR2nqKxY3gCjTC5Ay A==;
X-CSE-ConnectionGUID: h9OSb7D+RsCrRrJ9elGavA==
X-CSE-MsgGUID: z2cZYYFGTDyiMFdhRVybbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22482754"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22482754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:35:18 -0700
X-CSE-ConnectionGUID: JGc7CqhHQ6WTUzX6cihMDA==
X-CSE-MsgGUID: lX08+MX/Se+Xm6s+b9yL0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65427219"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 05:35:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 05:35:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 05:35:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 05:35:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 05:35:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQkJ5E5q+UFbuf7Olk9J/9cNQSSyEKAUSP0dJTscdGqQ189yZAV3Qfj2ZDHUsnjixgryoNwFBjSXnmZTRGy3CKYRfksMbvQjAdQ4AZqd8gXkAiZLkz2lMss616Nh4JhiujM94kLMAtgbwCnZtyw32Me09ShBZbdYB9yO+kdxbEtzKPh3nNziCRc7OMyLn+dnNvmcV0drsN6AvGGQMafU3tjKgGNHyWgf45cqZQBZ5PpOYnbvADCGyJ28RUqAkuBAWtFo2SjgPVd0+RmNODvLn8Ia/Ja+R/kixFD7JfEZP6oy+V1w5WeS3YZjJdjo0eoZL+/W0exWyeEmvhzbSF17gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sYoDjPG4xhRkpqookkIomZZnkeX8OPyUMIx7DZcRiA=;
 b=yDfcK3zQxTavuhxohcJGMhhgRE+SEYySsq/eYGdCLQwlO++1D4wa+rUajbPGXn4Q4ngjHGc3fUTqth38tRFrRjbYWqtROE2V8lm9l+jYermwzSLywieYvxyXKlP+oyCQrr1SZtC6xv6WNBsCJ0jrKQo8v/HdOrSkTHy5Y4myUUUxEjXZOohm65296kAKyOFT8KtVE6GaYx9AXY0/cquKcgnITCZcZ+3eNa2Zyg0UsZc1r+ARGByYzmEjHqjMpA/U/Jks/NWGYdL6Wp7uqnRJ3za9gPS4UIcKlOSR/gt3MSlP8NNiYhbxSTZK7icbAWFBV86nRJBZHZ4Ol5SuCoUCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 12:35:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 12:35:14 +0000
Date: Wed, 21 Aug 2024 07:35:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v2 1/6] tools/intel-gfx-fw-info: Re-format with black
Message-ID: <vbao6gcl4cxcfizf6gdwpmjebmlqvob6y72of6bq7g737x43lw@nfovq2z3fzt7>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-2-lucas.demarchi@intel.com>
 <20240821112945.ecy2tuu36nnih4hd@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240821112945.ecy2tuu36nnih4hd@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ccfb86-280e-4877-0c15-08dcc1ddb4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PK2PDGLIAtxIBy16N5SgEfvXtproyQJmNuYDXdLEraQtW2cQX2Y6E5R/miHQ?=
 =?us-ascii?Q?8Mkvd712wpeGNaTCLBMwbsus9Fl+v8poUKjp67d3Ao5wp2oRKLIzvM/IskGy?=
 =?us-ascii?Q?z8RXdg34DOKTrnpsSiTymxbbkLegH25UrkP1yLpUfYuop2Zys9KPHlagMX2d?=
 =?us-ascii?Q?u8pKdkSyBI72G0rqDxMfbkXnN2kDxbAbnEt+wYgS+GvTDD7vPGs+p62upm63?=
 =?us-ascii?Q?4tC5+Zq8tYFh5ksQaTiNlyyK/v5+AFEylrJXvAIaVrOVqcgrwKrFcrlal/2j?=
 =?us-ascii?Q?v0jRfFHyJZJAgg4WG7E+Jg83juGapu4CQHXMBK/BLCgBD7bAL1ZFXP/pim9w?=
 =?us-ascii?Q?Vc3rgWHMcH7Tl0/aWJXpLOwgsNqEnXgRR/YfKBAn6cQzvB0GCIFPS/BsxFaW?=
 =?us-ascii?Q?ReJW8vldSsEIUUIBwsBAy/Baya4ql40Sp6uHA4B+5jVGCXgSxCzmuBH957IB?=
 =?us-ascii?Q?EWYDRoEANZwbY9k90QklekaXZotDxs6OJoQ81ZIBpItADTD5OkMf+7bwtDnq?=
 =?us-ascii?Q?ZPZUD99yGxoD96/jw7H6nc9vXqecmONhiG3QvqyKdg7V1iVlq2PbIJ3PAXhl?=
 =?us-ascii?Q?q/HrUyqm2iFvr9kGVxBLIqFIZgs5e2mT1QpIAJ8QmCoQxTzG/lLZFidQJOBe?=
 =?us-ascii?Q?MRXuE4ytA5gCHHJ65RSQFJa7uJdzt/BIGSyJC99PD5e3yQvbiAC2pr9J4NkU?=
 =?us-ascii?Q?D/xBc1s7TgAGUoIWCW+nH9FY172CDvh6nGCW2a+IrFlLPpHpABQQI6/ilyH+?=
 =?us-ascii?Q?Lcgvc8dxMyAIMxORGuTx7o3MkkEh7T5d1CMcbVP1VT8tFpCusTh97b+gsVor?=
 =?us-ascii?Q?XQ10fQUVw8IzWmbWaB/YQcCPFGHIKzIkGqtnTQLDNUo+piQIs14zYnmxMomO?=
 =?us-ascii?Q?rXRcatIXhTAcZUZ1SAqfy1Uf5UwKXvpG59KPoBDS81bfRBaWSCDwWn158Rqe?=
 =?us-ascii?Q?V0cFZMRTqm4P9DGtjuwJOn+7zUNyiXydwcMMZaR04DHOS39S7B+89mIYjh6N?=
 =?us-ascii?Q?Qp2DZDv2SWPZ/DTnFBTFac+q82I+PWMKBxs3eosJ6f1/EHt6Grfw8UxWqIEF?=
 =?us-ascii?Q?0lvTxKVXGx6sSzqf7JLTGwgHf54ECYtVT+FGrTmbtMGxFDAZoz31XdzW3buK?=
 =?us-ascii?Q?cElKkfLkts5xxCwZe+Dz7cInV97xUMwg/A7CqDpHvrBUBxgeXxiqfXpmoVj7?=
 =?us-ascii?Q?YPHNPfLse48ez3wLV+y4m7+h3vPse2R73X28W4LUqVYqIIpUxAlFvgorwFhZ?=
 =?us-ascii?Q?YOorPCVIAIqkbuL2XYoXH4GzEp+xUQHHkCTTXSEXMguo6ydVX0UXHDqnPAqd?=
 =?us-ascii?Q?AxyaXREuBlbj7TcuiAceP51HzrSVMtG90qrr+45b1XxtsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8/Tuz0NuJMFpHyRXd6Z4DffTbz9tF3r3XEsESqcRUFgpmz9ioR2CWh6IPDzQ?=
 =?us-ascii?Q?9rhffc9c4Iq6VQJEhx/89fL1tsgtmIQqpaYXsM6POYl/hr9Rk1kQ8aIZTmI6?=
 =?us-ascii?Q?hUTrOyIC8wx9YJsMwONFMfabUMt8p6/uTZN/wNVwuZlbvCvK410KOGaUDYTi?=
 =?us-ascii?Q?e0DozYcdXQK6fU6tUU40dw4mmB6EqdoeyaTJ/z2lVEe1ctTaS2fzBGSqfNvq?=
 =?us-ascii?Q?ZNtQeqS6s6YASS5D9njdEn4j/GUCkjAwsHNvG5tum9tPRQWKhp28n0FfSbOt?=
 =?us-ascii?Q?/ife9nGKyiD+Y4M/6xrqprmF+htLedK5ZECjazICveU+uSEEeb3nYgkkkUrJ?=
 =?us-ascii?Q?ojy64G/CkMS7tzq6r03Z5JJqSDLced2f4gKdIdx04i6kJ4fMJuUYvw5NrQKS?=
 =?us-ascii?Q?ueGnwYfVRr2IdRPgpuHSRzEi88LOyHIC173BNpkAJ4NLfxAkmi+9BU5NbTFy?=
 =?us-ascii?Q?17M4dKVjSCAMdobmw7S9kubDxohuKMerrq+m2O/hw1rfI2vHOsqvUgwqIIFr?=
 =?us-ascii?Q?b9/mpaI7Fq+8Aff/Y1No0bImAB/jA1jmAhBnKCpkt+ULRbXEpkkntmU6WF7C?=
 =?us-ascii?Q?R/SmsJ/Y9MnOcwd+qEVxKyxhN5GqdZD42YYYVuEhWkzox+YeT1LIjENA1trR?=
 =?us-ascii?Q?Vz4nsRL1kpINdbdMvmtaPgkywQ+ZrBbITGvrxdCL23nUdF71+16QHjWbjxIF?=
 =?us-ascii?Q?iEdIsZsSejgDEGP9GVSS4dM0m7DD0J9zElUGljVe9icDGl086ZnL7FrcsJ7g?=
 =?us-ascii?Q?zUSgMNLNxjejo7PKZV6Y10DCr+HNAoadY+pbDUMjypQBdxE2gwjWNos7n/3P?=
 =?us-ascii?Q?YtTNfrMzFqVOvuqwWXMgDYUha0dA+11WTAVRUEl6vMfXMrBK330bar2ONXve?=
 =?us-ascii?Q?Uy1CVps35RRwtcTM35mOQ0cYx9mmCYzouTALwD4HiHUN3ogVhvcmNPTa4QIW?=
 =?us-ascii?Q?GOxYB+dhxWLJ/lm9OHdGxdJ/pST0dHCDIFxGyAcADuJX1wzGzpvynpUFZb04?=
 =?us-ascii?Q?E9MWXQ561dsQQdBDIbukJOUlRt87jRDw9JQIup7mh4DdPdUc9xIB5sr+DaRl?=
 =?us-ascii?Q?xtXs5ydykRQjRcanpbXgqinDUFzHUjUV8SrsOHqF9LQZbAyUevgK5tQ/1jG9?=
 =?us-ascii?Q?GuG9e7YGscOoIfJWznwgnU3hhNu/HZVh6YM1dONm8ykkxeJjiaOTGZeGWNda?=
 =?us-ascii?Q?Dz65CqQU9IfvyDAi9H8Oogd4ZTQt7LQHnXDvIThkM3gUXIcjUaRJjBrfQgPl?=
 =?us-ascii?Q?M68/rJruX8UJWbgn+yA/NZHBuE45xST/UqMbui8zLUvg+cwfiQiHi1siYEE7?=
 =?us-ascii?Q?kShQsEkA93RBTPivpH7Ic92FSuHP8Wxijxmd7caGeKqPNXIoiGUKn6AnkP0P?=
 =?us-ascii?Q?cBZDnapbvdnNT1HMVmBGi+2joRNtAK2p4gNAmvtBBhGwI5p9RraLqX2saNv1?=
 =?us-ascii?Q?3n5wj/w55w7rH+GOrNONWvrhNC2uFOZm97AxeL+XPFDvIOZYnodPUFM/FONc?=
 =?us-ascii?Q?4xixxUFlKOh/bILz7I86twO58BmeCcfwACLcFUzL/519ILLfV7W2MspCZX5e?=
 =?us-ascii?Q?9VRKCge1Som9/42afFBO+WqyB4WNFwL6OlG2KfHP/UM2xTq0ik+1nA93jNdC?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ccfb86-280e-4877-0c15-08dcc1ddb4a1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 12:35:14.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZXTGLvad6nylCDAAjj91vurqzyukFi2v/09XNKG7xPcfJpyTUKqY9Hw2sp9QRFfThdhnUXzMn+CCXiaO2zunl8vuxsN8k1cljSfK2eVG0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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

On Wed, Aug 21, 2024 at 01:29:45PM GMT, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-08-20 at 16:29:23 -0700, Lucas De Marchi wrote:
>> black tools/intel-gfx-fw-info
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>This looks almost ok, now
>
>pylint -d C0114,C0103,C0116,C0115 intel-gfx-fw-info
>
>intel-gfx-fw-info:293:4: W0621: Redefining name 'e' from outer scope (line 136) (redefined-outer-name)
>
>Your code has been rated at 9.92/10 (previous run: 7.64/10, +2.28)
>
>Btw running
>./intel-gfx-fw-info -c /lib/firmware/i915/ehl_huc_9.0.0.bin.zst

							     ^^^

>
>I got:
>
>header-type: CSS
>version: 137.147.184
>date: 543-01-b9
>checksum: 3aa76ca9f25d916e64a56267338d37993b8e4e7321856de83d98d14e15ace4ad
>
>Is date an encoded date and time?

it's compressed and this simple script doesn't handle compression (yet)

	$ cp /lib/firmware/i915/ehl_huc_9.0.0.bin.zst .
	$ zstd -d ehl_huc_9.0.0.bin.zst
	$ ./tools/intel-gfx-fw-info ehl_huc_9.0.0.bin
	header-type: CSS
	version: 9.0.0
	date: 2019-08-05

The compression happened not to change the first 4 bytes so it
incorrectly recognized it and applied the CCS parser.  Adding
decompression may be something for another time.

>
>You can add my acked-by with or without a fix for W0621 warning.

For this patch or for the series?

thanks
Lucas De Marchi

>
>Regards,
>Kamil
>
>> ---
>>  tools/intel-gfx-fw-info | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>> index b0d41bbae..35555aab5 100755
>> --- a/tools/intel-gfx-fw-info
>> +++ b/tools/intel-gfx-fw-info
>> @@ -150,10 +150,12 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
>>      description = "Dump GuC/HuC firmware information"
>>      parser = argparse.ArgumentParser(prog="intel-gfx-fw-info", description=description)
>>
>> -    parser.add_argument("-x", "--raw", action="store_true",
>> -                        help="Also print raw header content")
>> -    parser.add_argument("-c", "--checksum", action="store_true",
>> -                        help="Also print checksum")
>> +    parser.add_argument(
>> +        "-x", "--raw", action="store_true", help="Also print raw header content"
>> +    )
>> +    parser.add_argument(
>> +        "-c", "--checksum", action="store_true", help="Also print checksum"
>> +    )
>>
>>      parser.add_argument("filename", help="GuC/HuC firmware file")
>>
>> --
>> 2.43.0
>>
