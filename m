Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C07BC3064D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 15:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA6910EAD3;
	Thu, 27 Jun 2024 15:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lympmgIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD5D10EACB
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719500524; x=1751036524;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JdRs0znNfAZkcnIo4MX+wv6CitY1D/2kYeLogAVyf24=;
 b=lympmgIxVrMTar2sp9c0XUMOnrj2WP7FNlUoClYGjdefTuNfxz+IESp4
 GHs/DucbF8z9thxU7rrUgik0bMLfNZ9ooYNgHBpJo/+8HH+DblsszK1sp
 7JfmzhEkqhDWl5wAHuRl+7q9YcWxgecu+dwl3cwK4lGCvR3EesXQgoNt3
 emVuICGKN0SQJp4qyHaINPHLAIr5vADhrAzWkGve7N2p49MTRBFKHrmZa
 5jKHwPKdKpM7rPH8vehC98TBrRBtgSPs0a9PmV97h/84Q0Hv4dKZ3qZ0k
 PHQttWsYvERdIBt7q2eB7RNR8H05eyTxquc2jW0wPgOkgAVyHvmYAPjC4 w==;
X-CSE-ConnectionGUID: 7pmNC0x2RqaeVPgchpeh0w==
X-CSE-MsgGUID: fpK+HHclRgWlxp0G28caZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34084715"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="34084715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 08:02:01 -0700
X-CSE-ConnectionGUID: 9Qb39YcGRB6txJ9cer+gdw==
X-CSE-MsgGUID: lWi2AwyUT/euNR10190DXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="44303982"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 08:02:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 08:01:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 08:01:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 08:01:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXPERJmQa7Hrue8l9oqdFBowGUtIzQng+DWTs5wyCGNr3gnR2+YL3VO8Ea1qU7P4v7ERS6a9ufdPYv4AMODuZyAxuMIr9AP/WaANbhQuZMhlfBswFxy2pC48wQOVEIAk2O30msVKdVq6VNZ/5TANDMc3iT0vOCKs92ROgPMcLpkOHimuzFNHV9gZS2tQChuRUz9Gn1XPe9GE/2OGz5NkVdWTY00iou+CJazztUCciPk/YvUtDGLr0L2VJcvuJIjFsHMUagbXjDl4T+ki4pC7pHoCcoln+H5RD+RCpJhu9uwzcvIZl2XzgZzltk7URKKW99VGgq/xCV76IoN2A6BPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To6OxItHeVGKqssMEEht3/ok2Nk4QvrML5QPC4UDXxM=;
 b=iIyLUyiXEzOW41oOMMiaj8jTw2dZga7KdnERbvpTmcEfM1e1lWQJ2ef5mTMZkryxE81YdlV320ldwohhB7p1gb+DFxWLT3QZlHa/3k6FKGxaE5wrlvJmqcR+UFbTyCMvJ2vgL9XRslaslQbAkjBcrn8xR5IDdjuQl6Fyz/myuYyDlaToG1bXKyfxygnb1ADc4oFeSqyyqUrvlv4XrCReX6WNoi1dtrbhzcFa9lprvc54kdNS6RGjKnx2SM0fdteZPUzFzdUHlJsKld5O0w+1dQFvXN49zv92jZZ7DrCRJdk3rQ98UYLuH27Hm7iDGTnkO1wsYBPjvYoDvmVS1f8F8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 15:01:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 15:01:53 +0000
Date: Thu, 27 Jun 2024 08:01:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t] lib/rendercopy_gen9: Use AUX_NONE for platforms
 with unified compression
Message-ID: <20240627150150.GX2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240625091651.131301-1-zbigniew.kempczynski@intel.com>
 <20240625181733.GW2906448@mdroper-desk1.amr.corp.intel.com>
 <20240627075637.rp64nriujmzh67zl@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627075637.rp64nriujmzh67zl@zkempczy-mobl2>
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BY1PR11MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb16d2b-6e8b-4f94-8fc2-08dc96ba1452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTRPVmVOREZVYm40Y0JUa1kxbXM0N2p3Wkd5aVdJRjdxYXJucG1kNXhkaDEr?=
 =?utf-8?B?dXZKYTYvZ1E4M1NGMC9VczZVWTY2c29QUkRJVE5KK1VtVjBrN2oyd3ArVVpa?=
 =?utf-8?B?SUZDMlJ2TVpQS01HUFZKTTh3U2RHUUJPbnRHOUJnWnlweVVHY05uZGZxNXhL?=
 =?utf-8?B?M2ZvUTMyYVA3eE9RakNDVE5HRGhHd01hTmRmN3R3STQ2OGZLaGFDQlk3S3cr?=
 =?utf-8?B?ekNaYmJvWGhCbnRmYlYxK21QUUI1aTBVVmdNTjVmbHc5dG5zRXBRdUlBNE1Y?=
 =?utf-8?B?d0FPK0pmYUVNZ0MxTGdpK3QySHl6S095N1U3VmpkM3ZZc3dFVWhJSkRya1lz?=
 =?utf-8?B?a0dWRXIrb3VNTFRQR0VnS2p5blBQVnJKWEhHMkZGTTZVd1FKUUtGdFlDcnM5?=
 =?utf-8?B?V3lVd1hVMUw4RzBZRFhVTXlvRVZFckVMQUIzZGdSTDMrZ3lqVGhaOG9RZ2xh?=
 =?utf-8?B?TTNvSitUcUlBZUgyNGxMNys0Mkg1cjJjRklLQnJocExKeDRBeEtwanRVUS93?=
 =?utf-8?B?RGhJZFBYdXR4UmVOb1E4di9LZE1sMng1c1NDV2tuQzg0UURJVVN5bTk2Q1E2?=
 =?utf-8?B?SjdkNUUrbEx1OXN5WlJOT0R1NVo1RUdPeWdKbU1od29Gdjc5em4zYlFpZ3J5?=
 =?utf-8?B?WUt5cjNlenh5Tlh4VzZjeHBmU3phNnd0K1pKc3JxdldGZ3hXdlVPZktYODlO?=
 =?utf-8?B?TVByaHUvTjBaNWpORU1HTVlVWWd1QVpRMWxiWUV3YmFEa1VPaDNpdTFXMkpW?=
 =?utf-8?B?NXNSK21OOE0wYXJtQjZNdXZ5S2FNSVRjWTNQaXZ4YWliVHp3RHNwNkxnMW1w?=
 =?utf-8?B?VTBVQk5sWWFxUm1ES3gzY1BDcFZoYXJWV0J6dVZRbldOaytZMXFacWJVVk03?=
 =?utf-8?B?azFjRTZTcnozZTladGR4R0I4SnE3SjNsdjBTZndIeC9pVWI0SWpUVUdHQzV5?=
 =?utf-8?B?MkljN0VsbEJHbkRFYkRKcUd1UmNDZ0hKQTVJS0lyTlIxS0JsaWpNRDlxVTMz?=
 =?utf-8?B?Q2t6cjQ1NXdmaTVYRE5Xck95THhSTHBFU05udHRENGRya1ExTFU0dGgvQlhm?=
 =?utf-8?B?RTg1a200RCtMVU9FaWFJVFhmYjkvNzVua0RQdXBYaVVodDhlTVRidkhsa29N?=
 =?utf-8?B?OVMzbG5uYjlwbTZ4RjZFb2tpR1E4VDFSdHY0WVFMT0s0U1dzQkNORmpRN2dr?=
 =?utf-8?B?SEttMjZYNWw2MkxoUG9VaENJcldqT1N3QmVVbGpuNzNEQjBLWHl3R2crbWtZ?=
 =?utf-8?B?R0kxUFFURnFEaEJ2QmxqenJVZGJvQ2tUaDZpNStzaTFCZ0UyczQ0TVJKKzFP?=
 =?utf-8?B?NEk3WXQyMkFTMHk5bmp1cWUrb09QVW0zRFJnWFZ6UWJXVDNzZkl5bTYzTktr?=
 =?utf-8?B?ZTBtaldvR0ZLQXo4cVFJQVlOY3JnWkhqOW1YT3NtKzhjQlE5Q1N4c3FodVNN?=
 =?utf-8?B?UVU2NXhhZUFnb1l2d1hPd1Rob3V5b3A4bTUvNmtQV0tlcVE1WjNwQUwwWUpv?=
 =?utf-8?B?bDZtWEkyaU9iWU12UFVKUE9CV0U0RXp5VmdXMDVieGgrUUxkMzhvNW9yU21D?=
 =?utf-8?B?b1pneGswc3lYTk1HT0FwOHRuTkxjaW1CSURISENHenplMFZ2MjRXenBEUFRB?=
 =?utf-8?B?ak1EaXQ0VFZIVnZMOXdaVWRsT0FLUEhIUytIN1hiQmswaC9FczM0RHhsYVAr?=
 =?utf-8?B?VXljaDJiNmdQOGU0ekkvcVU5TFZiVTNoNGRsRC9meEcxeXdBWGtmbE9aNDhF?=
 =?utf-8?B?bHVFWWtadzZGUlFCa1Y3Q2tJZ0RQaFdBblpHMTY1REpaQXUyTHJveWlIaDRW?=
 =?utf-8?B?OUpTa3pkUnNuNWtNT2RpZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEVMQ0w3ZUdnc2VkWEE3TEVWQU1VUHZ4cWR4Z2ZEaVNKZFVTNG02L1cwc0ZL?=
 =?utf-8?B?ZkpQaFh5M2ZIVGRadmRDN2tJWlc5MkE4cVNId1EzNTJmY21HQzJGSFY4WmpY?=
 =?utf-8?B?a1JoOHdDeGM3OW1hWnU3WWJwUGw0Zkk1MkhUR3huSTZ2cEV5bnRwK2x0S1l4?=
 =?utf-8?B?NGdyeXo1RVB3NWIxWHNPTktPZXlxTHk2YXBxQk9zcmRsR25CNllXVkxYd3Zj?=
 =?utf-8?B?V3FvK1NZLzRMZWg0UUtNVCtBa0xNMTM3V204QTBnbG9lK3dDaGx0WjFnYkM2?=
 =?utf-8?B?UEZQRlVBV2loLzNsOTRwcEZGU2RrelQxWmVHK05iSGwrSHRxcjgzMXVaZ2Y1?=
 =?utf-8?B?cHVVRGU4MlBCS0tuU0dKajdNZ0tZNFZHWVpnVjF4MTZpdFVCeVNwNDBNcWFt?=
 =?utf-8?B?Wkh1STg2Ukg2dHk4N3lLdW1vazgwL2g0V245UmlXV00vN3BSR0Z6UlIzZ0J4?=
 =?utf-8?B?MU5xRmlUUE5zZmN0djJ6YnF0dzhRYmdXRXJzTTc3c1VmdEZPWGxCaUF2dUFO?=
 =?utf-8?B?Y09YMTdCWEliNkQ4Uis3NGpnT21xV0tyT3BJMmZ4ZFdhbE1jZGF3K0xPY1A4?=
 =?utf-8?B?VW4xbE5PV2ZWN0haU2VJMnBFRWVTTEIzano5a1dBL2E4RnBHQWFjU2hxYnVm?=
 =?utf-8?B?KzRTM1Z3dWVKb2NMakhWTjNjUERNSFNjWjF0YjR4M3BYc1dOay9RTUkwZWd2?=
 =?utf-8?B?bitEWmpBK05saXYxMExNeFBzWklsRC9CbmdwUUJNaVlFN2ZIcGdxQVBUTE1v?=
 =?utf-8?B?dlYwbndaWVNEWURjK2dwMDNQMVJIR3lmZWw2V3VmN21pQ2tyM2xmY04vNmNy?=
 =?utf-8?B?aUlYNFB5Ny9oVXhkdTBsMlowN05qeGVtbnlpYWlIaGZCMERFand0UUthRFRB?=
 =?utf-8?B?NjBsRG9FM09KNTluY2o4c2tjRkREZ1pRVXRMNGdDVTFzSVhoZ2hvUy9QcUJV?=
 =?utf-8?B?NGhsUnNQb01BbVBIbXNYems0T2RkNFF3anBuWC9uRnhYZ3BldnF4bkJ3NWp1?=
 =?utf-8?B?WlZkT2NlYWNJTE9VU1cyUGNrZ0hjR08ycDdHZlBjMXBQN2Z3YkRxaS9uaXhX?=
 =?utf-8?B?aHFRbk1ENEl3bHpVTkdjYzNNSDJieXpzY1VjS3NaSXF5WWkyRnR3dXkyaHdB?=
 =?utf-8?B?WUlEK0pCbk5JaitBbnBNQkhRditGM1JlUk1xaXRXdktiSW9la2ZHcUJod2lq?=
 =?utf-8?B?Q1hBMWZ3OTdUelRaUE5kSS9MVkVXUG92c2xzcmZOQ1RIRUxSOUVGU1lhKzVp?=
 =?utf-8?B?WWFsSEhsNFhvK3pwckxiZU81UTZhL213bjc0YUR5Rm5KYlZabFlmUGt3Ykc2?=
 =?utf-8?B?WnJ5VW1mS0hiZ3k1Rk9GN1ZqWUZKZE80cXNsUTcrTjF1dE91VXRDUnZ3YjZT?=
 =?utf-8?B?SWxDTWFmTU1RZU56UU56RE5rNkFFQkJnMktCcWRLQ0UrQm1mM1JLNWxqL1p5?=
 =?utf-8?B?U21nVjB5N05SUGZ0YStqaWF6NWkwalREa0NqZ2F2Vzg5N2toZmVza0FZbC9U?=
 =?utf-8?B?dFdyTHFZc0tjZUZ0VEQ4UWtmSW5COGZWYzdLVlJJb0UwYXhuRWtlc0lmendW?=
 =?utf-8?B?SFRGeXRnL2lxTEcyVlg1L2N0ZC9VdGtJTk00YnhKMjc3cy9zN05CSDRYQ0pv?=
 =?utf-8?B?dkpob3dNdndRWHhHK3grcXFSSmxzb2xyblJhaUZNTjQrRGZQVVFNblJlZTVq?=
 =?utf-8?B?eFdjeUs1aWFTMWR4SW1xd3lXZldxdGt5MzROeFpWVXBiR1ZkSHhxakJ0VG5t?=
 =?utf-8?B?WWZjL05qenp0dGdnd0MwNmpZMS9vT1Yyc2lSUVVaT0pxQVN6SGNobXlFMDdr?=
 =?utf-8?B?cWtRUlovdFdRVWhjSjdZZ1hnby9VQzJmMjhVajNVcVNHbSsyK1lWc3VYb3Mv?=
 =?utf-8?B?YUFrTE0vNlpFUUJFZGRVV1Z5Z2U0bjUyVXlSeFpEbWZnQ1F5aEl3anBVUlgw?=
 =?utf-8?B?cXFENElMWmU2RGtMZzVqUGRCYStMNThSTmIxRTAvWUk3VzRxeUdSd0ZLR2Rk?=
 =?utf-8?B?UlZybWJ4WnBSRVRNYVVCa0ZZeWFEUDVTODRpbjh2eVRIQlE2ZWhjekdqazE1?=
 =?utf-8?B?cEtsZ0FyditmTFdnS2EvYnhsSXJRN2VmS2J5SjhLWTIzM0FvSkVQczc3ZXJF?=
 =?utf-8?B?N2RRRXQwVzdSM1hmREJ6U1Zub28rekhUZWpJYTRSZDh2NkVweStxMENVbmYy?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb16d2b-6e8b-4f94-8fc2-08dc96ba1452
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 15:01:52.9966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+AmDojGGFmeQFHLRdctNfDbzi/H1NGskoJJPLmA9Sb9ZIu1PCe9aButuUMWE14WDA2FbIvUT28ul2wzU7MV+3Lxl8MXm4EdTH6mxrqXy8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
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

On Thu, Jun 27, 2024 at 09:56:37AM +0200, Zbigniew Kempczyński wrote:
> On Tue, Jun 25, 2024 at 11:17:33AM -0700, Matt Roper wrote:
> > On Tue, Jun 25, 2024 at 11:16:50AM +0200, Zbigniew Kempczyński wrote:
> > > For non-MSAA surfaces when unified compression is configured in PAT
> > > auxiliary surfaces must be set to AUX_NONE. I haven't noticed this
> > > on Xe2+ before as it setting was silently ignored by hardware but
> > > setting to AUX_CCS_E is incorrect and may fail on newer platforms.
> > 
> > Matches bspec 57023; 0x5 is no longer listed as a valid setting for this
> > field from Xe2 onward.
> > 
> > On Xe1 platforms, does this field still apply for platforms that use
> > FlatCCS rather than AuxCCS?  It's unclear to me whether the setting is
> > correct for DG2 or not.
> 
> To get the compression on Xe1 (DG2) setting aux-mode to AUX_CCS_E in surface
> state is mandatory.

Thanks for confirming.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> --
> Zbigniew
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  lib/rendercopy_gen9.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > > index 726f1a087b..62a365f3c2 100644
> > > --- a/lib/rendercopy_gen9.c
> > > +++ b/lib/rendercopy_gen9.c
> > > @@ -229,7 +229,10 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> > >  	if (buf->compression == I915_COMPRESSION_MEDIA)
> > >  		ss->ss7.tgl.media_compression = 1;
> > >  	else if (buf->compression == I915_COMPRESSION_RENDER) {
> > > -		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
> > > +		if (AT_LEAST_GEN(ibb->devid, 20))
> > > +			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
> > > +		else
> > > +			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
> > >  
> > >  		if (buf->ccs[0].stride) {
> > >  
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
