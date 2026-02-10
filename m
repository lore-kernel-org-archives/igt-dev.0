Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C8EE9462E
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 03:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7229110E4A9;
	Tue, 10 Feb 2026 03:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HdkEDSV3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B5210E4A9
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 03:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770692750; x=1802228750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1ZCTwLJS4PT9weRBLVBfmqhBefuT7rd4phufjpO4g3Y=;
 b=HdkEDSV3ZEPrTFtIfWuvpdcNfucjMdefr+nKRna27Vb0ggrceD3IEHa0
 WdwnTZu2kmT+ffkEIehek9tMchniWBl6vzBktfj1s2G2Wj0iOGTSiT08n
 qlwCSJlNOXqJaooOHoDYExcSQiziQ4GAss8oCwtZ99biJvv2HvaKkBohb
 GfMqsD8zMn63BOYZLBucaD4o+8kY8NcN5uwYUbdybTNcIHHY7rUFmZfdL
 LU5OSAqO3aK7IfES5ej3M6Ch5TVAfbAflASXtqdSCYLs8sAO77qdTzP+e
 Bfq4DLq8wRvMaPN8mBAtGqePTn95rcr3CWVPBa1Q14JnZEKMii2pnh+hi Q==;
X-CSE-ConnectionGUID: tX8jOZ+jT8eyTXk5qM8MJg==
X-CSE-MsgGUID: 6tWpeSgFRUCoiVQSOiI9dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83253292"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83253292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 19:05:50 -0800
X-CSE-ConnectionGUID: VVdvQY1gTuuy8Pncmf1A1g==
X-CSE-MsgGUID: 5VnbHnsGTiWer7i94t6IHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211460997"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 19:05:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 19:05:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 19:05:48 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 19:05:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWXfaDnbZ6whOi5QvsVLcglBelg5tYbrfcfVVyHow8bMkhpN4SBIK1eCDkuvE1LNuJaN0W7o5+xaRu0CPyQbfwbmtKpejXV9Mseof1gOQq0CFZdQIZr3oXsKMcR6D3JuYa6p0R51BSBYzEM0728kdbWtCugdsvc4cJOP4l7ugJh8XseDIf36aG0Y/iNddTGSe1IHkjAvP68TA+N/GYk67KqzUduUcYZhSXUcMJwZbf5ZW/5b9rUoxSd3Zl81WBsYQYHKcwAwa/PuBFsVwSaFILI7f0tf34HKNvyppKkzRa9renwcRCdpHEbi03qxjom4JnRqQonBp/mPlVzA02GkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZCTwLJS4PT9weRBLVBfmqhBefuT7rd4phufjpO4g3Y=;
 b=QyhrWW3P8/1/FMQiC1PNpjcJfv79+rQsJQbK9xG+C7LFhXfKh+vFFi7/r/W4nMxZX1SIUlTQJkVzZvgg0P3LsxGQyLeUmp58NPqFi1vnO0iBtg+FQX/2GOMulefFsIXP7OZoPRbumbEBZ6l3N430P6/be3BI1+fHiBsPMLyaa/3dQwgtFGRolZ46PoulOY9q+YRHNcJmtl/z7mzqEkF9clvYlx7/1xE9QckLfC+N2Mf3MF2HWAYXckX7fCAUYaJxyFzaYXYdVCREtRhuPzSB+b+BEBo1RehdS8XBHmzPSVAzhWFkU07vshU5p6JkJv2t34bV3BYu/02OXPHqex0cSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 03:05:45 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 03:05:45 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before
 unbinding xe
Thread-Topic: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before
 unbinding xe
Thread-Index: AQHcl7nHAvt8S4Eg8U6YSj3Ebv8F2bV7Q6MA
Date: Tue, 10 Feb 2026 03:05:45 +0000
Message-ID: <DM4PR11MB631299DF160170E04D441FCA9062A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260206224106.3845768-1-michal.grzelak@intel.com>
In-Reply-To: <20260206224106.3845768-1-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY8PR11MB7009:EE_
x-ms-office365-filtering-correlation-id: 84119996-142b-40d6-0879-08de685148af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?V2xtTXdmdDBEei9mWWYvaFdaTnl4SjgxZjJkU25sM0xOejBqZ1BuVWdIRVZw?=
 =?utf-8?B?Ui84TTRWVDFvMytmREFjRUZMNFBCM2FKMjBMWnJEVytFS01BNWpPTFM4S0Zn?=
 =?utf-8?B?WVg0UUVhK1NFNnplcjlWTEw1TEdHODMvMXUzTTV5UFJJK3VLcTlCZjdOaStv?=
 =?utf-8?B?QnJ5Z0hWZ04wNndGUHR3SzBnRDJWYWdjdytwZTE5MldKWjIvNlFZRVFnWGpM?=
 =?utf-8?B?ZjRNdWlLYlVreC83QW5zcEIzWVRkc0hkcTNHd0svaEppVUN2ZUJtVzJMajRh?=
 =?utf-8?B?Ni9kN3BmWkVyeUczcHNNMXNCYkRoeHFMUkVhY2JuQjgxU3pTeVJMczBGWXFX?=
 =?utf-8?B?dnB6RmI4dnIwNnZQaVRySDVRVitMQ0cvRmFYUlppRko2em1CU2NYVStNeWpH?=
 =?utf-8?B?QXFPZDB2U2kxQXRBTThUekUxcCtYdjlLcytndkx1UU1QSGFzQXE3MnhjMnJz?=
 =?utf-8?B?NE1uUWJUdS9UL1FuRG5ib0hmc2FKZ3J3anFqWU16VHMxTGlIbXdsTFdWaG1N?=
 =?utf-8?B?SEZkWUFOYlJVbHAreVpGZTBaM3hwV0hOVXZTQVlUVXpqZ2JSc3JvVkt1eXM3?=
 =?utf-8?B?M0orVldhM1Q3d0UwcGJWaXJXQ29USkRTUElCS2p3enUyYjArdkZ3ejlsNW5W?=
 =?utf-8?B?OEdvbldZa25LN3B5UWUxZ3lpdndDN1NIa3lkUXFwdFEvVmV1OUk0dWNFTWp1?=
 =?utf-8?B?WmhndTNDb0xEeFRLekpZNklwdm9zbXN1cjBEUTJYaGdGQXJWZHZDb2lrR1d5?=
 =?utf-8?B?eVp0akxMM2g1TzVWUWRJQTEwWHZvMlkxNFRzbE9kQUw4M3pBVFZPUFZDNWx3?=
 =?utf-8?B?c0k2ZDVxM0RURTFGOWFvSStsanY4Vkk4OXpMdUxoc0RrVWlDNXJQWjJBVFZJ?=
 =?utf-8?B?NEJLV0p0dW0yUFMwc3JrdzRCbi9UZVh0VjFhdERSQjltVG1mRVhSanV0eUdX?=
 =?utf-8?B?VGNROStFcWw2aHY2c0k5a1VzVVdqNkIwMXIwUEYwVVpERnlnZ2ZrYWRDQlpF?=
 =?utf-8?B?SHcrVmROWEllRTRyM2FQZmxMVmxiZHEvcVJIR25VS0lMWkR1cUc4WjhpblY3?=
 =?utf-8?B?eU1rY09YcDFuUCtzT1IrZ1NYYlVGbXRJZGJGekZURTgzT2xCV1ozaVI4cU5y?=
 =?utf-8?B?U1dYenR4MlVlMkNscjIwTGVHTU9oTTM3OGtvRWJ0TDdCMVZiblhzSTBRWUIr?=
 =?utf-8?B?YkRoV3NjWVlQcGVSaEhodVlRanVmRHVpKzlGcEtIanJ2ZnRpL2d2cWsrMzJq?=
 =?utf-8?B?ZjdMZHoveVNFNjhvb0h3R3hhTnVTeHpPM1o3YXN0Qm5qMmVpa0VVN3pCSUlU?=
 =?utf-8?B?cHNnNnBwd3Z3UzcxeTdLN201MmRkYkJaTmtwZmk4YVU4Y1RCNlFkbjI4ZFpu?=
 =?utf-8?B?aUZpUWMwR3BBWi8rSVgvZExPSUtDQW41ZFgvcjJKT05wMU12QmM2WkZkRm81?=
 =?utf-8?B?bUNhcE5jSEJ4VzdLSm9JbXJZUFpUbTdPbW1HZnVIeFNaQjRxalRVbERPMnFG?=
 =?utf-8?B?dk1BSklyNUVPV240WDk1TWZOTHpsemNsemkzRHYzSGJNanM5MmxmZGZ1RlUr?=
 =?utf-8?B?aFNscXdDbmJzNEpPak1wRGNKY3pCTlFiNW1qVnpoQ0RnRlZPR0J3Y29lYmJz?=
 =?utf-8?B?K0pTTVN0T2JaVDNDUlZWeDh4RmZraFJXeU1ZeWFBTUh0V3B5VnQveDV5TkhP?=
 =?utf-8?B?UDNoWklUd3V3R28rWUFUNzhTMGZPL1M3RXhiTS84ZjJwZ0EzS1RubEJyRTNz?=
 =?utf-8?B?NFVyc29CZE5qN2pLYU1XeGZTZTM5SFJIdm04T2FHWGxXTS81Nzk5eXRiZ0k3?=
 =?utf-8?B?N04vN1lrUlh0VHhZVEZlOWlFQ05sLzNYaFlRSW1OYXQrbThsTnB6aW84OUF0?=
 =?utf-8?B?aFNrSVlvZGRHbzNKTFRmbmVrblNCeFJ0RmhmRDVXaFhaVmNiZlc4ZzlLUjUw?=
 =?utf-8?B?V0RTMTVkblpuUXE0WUZPaG9KQ0twbFRvTkpOV0JESUk3Y05VZ28vZVZ4YUg4?=
 =?utf-8?B?TTM4N0JwM3ZpL1VFUkJxd2I0MFhpTS9uT3hSUTFKQ01GYzJTRTU0YmlaL29s?=
 =?utf-8?B?RmJMT2RIeUN0ZWpJRUcrUWFjN2tFRzhFWG8ycWZ2VEJTOEw4NHNENk9pQVpa?=
 =?utf-8?Q?7JLkwBkznBr7cNDvP8BADxmmx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkRGd0w2eWVTNDV0YzZZWjIxOXp3bmtlZ1NIdGlJR29OdzJBWlkyNmxMYWxm?=
 =?utf-8?B?U1c1MW5wVVlmRzdjdWgwZXBWeDV6dHV1aUVaOEJocVZqVFNvL1pkNVgxb3k0?=
 =?utf-8?B?RTNkdHpoQS9pM244L1hUWjZKWXBXbDZpL0QwV1A0OWNFek1LbHNtTXR6MWVK?=
 =?utf-8?B?NVpNUHNQMDV1VlhHeXZ4czBOdE9TdGU1ZVNSVCs1ZlpRQkdCLy9oUWNCNFpY?=
 =?utf-8?B?OTlSbjJraGRPMFgyTytNM1BwT3VBWXFoL1Nia3p0WnF3M1d2emFKRDFFblpz?=
 =?utf-8?B?eUROanowT3pKVnJJckloZnB5VU0ycVlJa3B6bUpIRzN0SWEvOHR5UGJ1eTJt?=
 =?utf-8?B?UlBNWlUrTVBCdWZ1NFE1YTIwYzVPTnI1eE5tMm92RTg3YUxzc05wbkhYUlkw?=
 =?utf-8?B?bXRRN0p2M09XdmxieU54ZGZCY3MvclZLTHU2RktiM2VUamJSZ2NBYVZoSXJm?=
 =?utf-8?B?aU01a1doQWxzYUwyOTROUHBqMnM3enFEWlIxR3hIU3RiRkp2YWhxR3BQQTJM?=
 =?utf-8?B?MEJGcnBzYk85Q3Z1V0Y3OU5xS2N6cVBsOEtGMjQvRFNwVWoreXlOd3kvZ2Vt?=
 =?utf-8?B?Nk54RDV0Z0k1dmhuUHY0NmhacjJQaDN2TVBLQXhSRkJsN2YyM2xQZE50ZHhj?=
 =?utf-8?B?bWtMby9RLytTemlYMzFtYzltc2dCVVB4M2xoUUpub21oVW5YTlc4NG9xblZ2?=
 =?utf-8?B?UnZLTGU4YkJwb1o0MHR2WVVrb2xrMFlRNmJtVm9NYnJ2bC9aVW9nTHV6S0Fm?=
 =?utf-8?B?OGE2blhzSEhpSmxpWkhDTm5uTWlzMlU0NDh2UlpydjFRemxpYVBseWU0RlhS?=
 =?utf-8?B?bHN5Q2xETU45M213NExMM2JLSXhuMDZoenV1cGRUSXFWU2hoMGc1US81YjJZ?=
 =?utf-8?B?WDdqTjN3blVhKzErRWtScTA1dE16U25ZVy9CY3Nxc2lqOEpaT0hudHVGMk9F?=
 =?utf-8?B?b211SWJUeTJTSzhxb3dObFRQR3kyci9hY1ZVUEJNZ2I3TmU3K2p1eUtSVzB6?=
 =?utf-8?B?ZjFVdkswcnhQSlRTajFNUXRnLzN0Y3NuWjJIc1hYZW5TU01yKzVMNzJBVmxo?=
 =?utf-8?B?OXYwL3NpZm0rSFpML29HY3VZTWE4bk9RRnhnMnE5NGZWOVd0SWVOaHpvRTJl?=
 =?utf-8?B?RmFvRmRVWTdJV1duU1ovSGlUOUQzaHhmK3hIMnQvRzFEV2l1SmFsOFBnNWRy?=
 =?utf-8?B?VWQ4b042Y1BuZEVzeExUSXU4S1VWV2dTSzErTXlKV0dZUVNXUEFXbmRjWEls?=
 =?utf-8?B?TU5pVHhwYVo4aXNVL3pkVVlKLzQrRytQWUptcEVabDhUNmZyMVA5OUZsNkVG?=
 =?utf-8?B?eWNQUGxGRHltQzd3SXROb1p1d1hYRHY0anZOOUxsWVBIanYxTHpRVEYyc2h5?=
 =?utf-8?B?VktmMGI2R2RHZjgzV1F5WnJMTEVhNU5rR0RBMkJQRjQ3Um5qYWxzd3ovR2hl?=
 =?utf-8?B?bmQ3WGhrRzl2L1Jia0NFTTlCMm1NMEZCcXdqaGhSN1czbkJhdE5wQkYrVG1N?=
 =?utf-8?B?ZkVGSGRNRXJPWWpXVkJla0ZNQ0hsU09oVXVxdndnNHdyTlNySnZ6V3BDeGFQ?=
 =?utf-8?B?RkdPMGN5a2VCc3VEZkRVbDF5WEFQalBQdXU2MDJTdWRVVFZ4Ujg3Ky82R2ZD?=
 =?utf-8?B?Q0sxMjB3WVhGTDd2ZmU3Nlg5NURjSTRoc3lYR3FSQnNCQTB3VlMrVFdQZW5M?=
 =?utf-8?B?Wk5ZQzkvdEl1QTNhY1JNZnR2SWRmM0dCemt6UUEzLzZtNEdveWxWSmFjQkor?=
 =?utf-8?B?YXZyL3NTTmQ4MzRUdDU0c0Fvcmt1dlY2Q3pFUHgxZU1LV0ZHWFJXZUkvRk9o?=
 =?utf-8?B?STNJLzZBd0V2bHFEUDBaR01yaFdiRFNOWEpZL2YyaXREc1d1eG9LM0FBMlNH?=
 =?utf-8?B?Q1UzV0hZOEhaTGJqZ2cxZUEyazFDOW45T3NnSk1JNkY1N0ROQjc5M3NoMS9B?=
 =?utf-8?B?SXRYak12R0I4WEtQODF2YUtmSm1mY1hoaVBLOWVyTldjL251bmFuTFZpNHhF?=
 =?utf-8?B?ZzA3OTBxbStJMzZFQkRMNDhXUGpMcm5iWk12UFdneHNEWnY1eVo2eG5xU0RK?=
 =?utf-8?B?enVDUlc2c3hVNGNsZ2M2WEVaa1ErWS9FdXk2dkl1R29NQlV3bG1sajdDb1Y3?=
 =?utf-8?B?RTd3eWZQRlE5RmVtakc3N094TjJHNjBYaENDa3dsWFpDNmZwc0lyWDc2dXVM?=
 =?utf-8?B?cUdjRldhY2g2OFp2M2ZtN0ppSnIvNHh4Q3JoQ2RVOUZBZ2c2bm9YMFlGWVgv?=
 =?utf-8?B?dmRHRVUrNTFaOGFGZFVzeTFqaENXd2RxYlQydktMTXgvdHJXaU1IUUhETVFo?=
 =?utf-8?Q?THzIBmBElIMvyAwNJs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84119996-142b-40d6-0879-08de685148af
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 03:05:45.4136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hOxt4rAP4swZ7JJdAI0sSiJVJWw8dW3W2tPQhifdUAFfVvjmQV28JZmHdosQrOUIGuAXRlUDtkzJnvlI8KWNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0
LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1pY2hhxYIN
Cj4gR3J6ZWxhaw0KPiBTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgNywgMjAyNiA0OjExIEFNDQo+
IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR3J6ZWxhaywgTWljaGFs
IDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MV0g
eGUvaWd0X2ttb2RfdW5iaW5kOiByZWxlYXNlIGF1ZGlvIGJlZm9yZQ0KPiB1bmJpbmRpbmcgeGUN
Cj4gDQo+IEF1ZGlvIGRyaXZlciBzaG91bGQgYmUgdW5sb2FkZWQgYmVmb3JlIHVuYmluZGluZy91
bmxvYWRpbmcgeGUuDQo+IE90aGVyd2lzZSBhdWRpbyBoYXMgbm8gY2hhbmNlIHRvIHJlbGVhc2Ug
dGhlIHJlZmNvdW50Og0KPiANCj4gPDc+IFs0ODUuNTg2NzY2XSB4ZSAwMDAwOjAzOjAwLjA6IFtk
cm06ZHJtX2NsaWVudF9yZWxlYXNlXSBmYmRldiA8Mz4NCj4gWzQ4NS41ODc2OTBdIHhlIDAwMDA6
MDM6MDAuMDogW2RybV0gKkVSUk9SKiBhdWRpbyBwb3dlciByZWZjb3VudCAxIGFmdGVyDQo+IHVu
YmluZA0KPiANCj4gV2hlbiBhdWRpbyBpcyBub3QgcHJvcGVybHkgcmVsZWFzZWQsIGZ1cnRoZXIg
dGVzdGluZyBsZWFkcyB0byB3YXJuaW5ncywNCj4gdGltZW91dHMsIGV0Yy4gUmVsZWFzZSBhdWRp
byBiZWZvcmUgeGUgaXMgdW5ib3VuZC4NCj4gDQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNzE2OQ0KPiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYcWCIEdyemVsYWsgPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4gLS0tDQo+ICBs
aWIvaWd0X2ttb2QuYyAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiAgdGVzdHMvaW50ZWwveGVf
Y29uZmlnZnMuYyAgICAgICAgfCA3ICsrKysrKysNCj4gIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2lu
amVjdGlvbi5jIHwgMyArKysNCj4gIHRlc3RzL2ludGVsL3hlX3N1cnZpdmFiaWxpdHkuYyAgIHwg
MiArKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvbGliL2lndF9rbW9kLmMgYi9saWIvaWd0X2ttb2QuYyBpbmRleCBkMWQ3YTM4NDAuLjgy
YzAwNWZmNw0KPiAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9rbW9kLmMNCj4gKysrIGIvbGliL2ln
dF9rbW9kLmMNCj4gQEAgLTcxNiw2ICs3MTYsNyBAQCBpZ3RfaW50ZWxfZHJpdmVyX3VubG9hZChj
b25zdCBjaGFyICpkcml2ZXIpDQo+IA0KPiAgaW50IGlndF94ZV9kcml2ZXJfdW5sb2FkKHZvaWQp
DQo+ICB7DQo+ICsJaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoTlVMTCk7DQo+ICAJaWd0X2ttb2Rf
dW5iaW5kKCJ4ZSIsIE5VTEwpOw0KPiANCj4gIAlpZ3Rfa21vZF91bmxvYWQoInhlIik7DQo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9jb25maWdmcy5jIGIvdGVzdHMvaW50ZWwveGVfY29u
ZmlnZnMuYyBpbmRleA0KPiBkMmRmZDJlODcuLjlmMzJlMmZjMSAxMDA2NDQNCj4gLS0tIGEvdGVz
dHMvaW50ZWwveGVfY29uZmlnZnMuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9jb25maWdmcy5j
DQo+IEBAIC01NSw2ICs1NSw3IEBAIHN0YXRpYyB2b2lkIHJlc3RvcmUoaW50IHNpZykgIHsNCj4g
IAlpbnQgY29uZmlnZnNfZmQ7DQo+IA0KPiArCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKE5VTEwp
Ow0KPiAgCWlndF9rbW9kX3VuYmluZCgieGUiLCBidXNfYWRkcik7DQo+IA0KPiAgCS8qIERyb3Ag
YWxsIGN1c3RvbSBjb25maWdmcyBzZXR0aW5ncyBmcm9tIHN1YnRlc3RzICovIEBAIC02OSw2ICs3
MCw3DQo+IEBAIHN0YXRpYyB2b2lkIHJlc3RvcmUoaW50IHNpZykNCj4gDQo+ICBzdGF0aWMgdm9p
ZCBzZXRfc3Vydml2YWJpbGl0eV9tb2RlKGludCBjb25maWdmc19kZXZpY2VfZmQsIGJvb2wgdmFs
dWUpICB7DQo+ICsJaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoTlVMTCk7DQoNClRoaXMgc2hvdWxk
IHdvcmsgZmluZSB3aGVuIHdlIGhhdmUgdW5sb2FkIGFuZCBsb2FkIHRlc3RzLCBNeSBkb3VidCBp
cyB0aGF0IHdoZW4gd2UgYXJlIHRyeWluZyB0byB1bmJpbmQgYW5kIGJpbmQgaWYgYXVkaW8gZHJp
dmVyIGlzIHVubG9hZGVkDQpXaWxsIHRoYXQgYWZmZWN0IGFueSB0ZXN0cyB3aGljaCBoYXMgZGVw
ZW5kZW5jeSA/PyBrbXNfaGRtaV9pbmplY3QgdGVzdHMuIA0KDQpUaGFua3MgDQpKZWV2YW4gQiAN
Cg0KPiAgCWlndF9rbW9kX3VuYmluZCgieGUiLCBidXNfYWRkcik7DQo+ICAJaWd0X3N5c2ZzX3Nl
dF9ib29sZWFuKGNvbmZpZ2ZzX2RldmljZV9mZCwgInN1cnZpdmFiaWxpdHlfbW9kZSIsDQo+IHZh
bHVlKTsNCj4gIAlpZ3Rfa21vZF9iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gQEAgLTExMyw2ICsx
MTUsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2VuZ2luZXNfYWxsb3dlZF9pbnZhbGlkKGludA0KPiBj
b25maWdmc19kZXZpY2VfZmQpDQo+ICAJICogVGhlc2Ugb25seSB0ZXN0IGlmIGVuZ2luZSBwYXJz
aW5nIGlzIGNvcnJlY3QsIHNvIGp1c3QgbWFrZSBzdXJlDQo+ICAJICogdGhlcmUncyBubyBkZXZp
Y2UgYm91bmQNCj4gIAkgKi8NCj4gKwlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4g
IAlpZ3Rfa21vZF91bmJpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiANCj4gIAlmb3IgKHNpemVfdCBp
ID0gMDsgaSA8IEFSUkFZX1NJWkUodmFsdWVzKTsgaSsrKSB7IEBAIC0xMzksNiArMTQyLDcgQEAN
Cj4gc3RhdGljIHZvaWQgdGVzdF9lbmdpbmVzX2FsbG93ZWQoaW50IGNvbmZpZ2ZzX2RldmljZV9m
ZCkNCj4gIAkgKiBUaGVzZSBvbmx5IHRlc3QgaWYgZW5naW5lIHBhcnNpbmcgaXMgY29ycmVjdCwg
c28ganVzdCBtYWtlIHN1cmUNCj4gIAkgKiB0aGVyZSdzIG5vIGRldmljZSBib3VuZA0KPiAgCSAq
Lw0KPiArCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKE5VTEwpOw0KPiAgCWlndF9rbW9kX3VuYmlu
ZCgieGUiLCBidXNfYWRkcik7DQo+IA0KPiAgCWZvciAoc2l6ZV90IGkgPSAwOyBpIDwgQVJSQVlf
U0laRSh2YWx1ZXMpOyBpKyspIHsgQEAgLTE2OSw2ICsxNzMsNyBAQA0KPiBzdGF0aWMgdm9pZCB0
ZXN0X2d0X3R5cGVzX2FsbG93ZWQoaW50IGNvbmZpZ2ZzX2RldmljZV9mZCkNCj4gIAkgKiBUaGVz
ZSBvbmx5IHRlc3QgaWYgZ3QgdHlwZSBwYXJzaW5nIGlzIGNvcnJlY3QsIHNvIGp1c3QgbWFrZSBz
dXJlDQo+ICAJICogdGhlcmUncyBubyBkZXZpY2UgYm91bmQNCj4gIAkgKi8NCj4gKwlpZ3RfYXVk
aW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4gIAlpZ3Rfa21vZF91bmJpbmQoInhlIiwgYnVzX2Fk
ZHIpOw0KPiANCj4gIAlmb3IgKHNpemVfdCBpID0gMDsgaSA8IEFSUkFZX1NJWkUodmFsdWVzKTsg
aSsrKSB7IEBAIC0yMzEsNiArMjM2LDcgQEANCj4gc3RhdGljIHZvaWQgdGVzdF9jdHhfcmVzdG9y
ZV9pbnZhbGlkKGludCBjb25maWdmc19kZXZpY2VfZmQsIGNvbnN0IGNoYXIgKnR5cGUpDQo+ICAJ
ICogVGhlc2Ugb25seSB0ZXN0IGlmIGNvbW1hbmQgcGFyc2luZyBpcyBjb3JyZWN0LA0KPiAgCSAq
IHNvIGp1c3QgbWFrZSBzdXJlIHRoZXJlJ3Mgbm8gZGV2aWNlIGJvdW5kDQo+ICAJICovDQo+ICsJ
aWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoTlVMTCk7DQo+ICAJaWd0X2ttb2RfdW5iaW5kKCJ4ZSIs
IGJ1c19hZGRyKTsNCj4gDQo+ICAJZm9yIChzaXplX3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZh
bHVlcyk7IGkrKykgeyBAQCAtMzEwLDYgKzMxNiw3IEBADQo+IHN0YXRpYyB2b2lkIHRlc3RfY3R4
X3Jlc3RvcmUoaW50IGNvbmZpZ2ZzX2RldmljZV9mZCwgY29uc3QgY2hhciAqdHlwZSkNCj4gIAlm
b3IgKHNpemVfdCBpID0gMDsgaSA8IEFSUkFZX1NJWkUodmFsdWVzKTsgaSsrKSB7DQo+ICAJCWNv
bnN0IHN0cnVjdCB2YWx1ZSAqdiA9ICZ2YWx1ZXNbaV07DQo+IA0KPiArCQlpZ3RfYXVkaW9fZHJp
dmVyX3VubG9hZChOVUxMKTsNCj4gIAkJaWd0X2ttb2RfdW5iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsN
Cj4gDQo+ICAJCWlndF9pbmZvKCJUZXN0ICVzXG4iLCB2LT50ZXN0KTsNCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jIGIvdGVzdHMvaW50ZWwveGVfZmF1bHRf
aW5qZWN0aW9uLmMNCj4gaW5kZXggZjNiZmM0YjQwLi42NWFkZDcxYTEgMTAwNjQ0DQo+IC0tLSBh
L3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hl
X2ZhdWx0X2luamVjdGlvbi5jDQo+IEBAIC0zMDksNiArMzA5LDcgQEAgc3RhdGljIHZvaWQgcHJv
YmVfZmFpbF9ndWMoaW50IGZkLCBjb25zdCBjaGFyDQo+IHBjaV9zbG90W10sIGNvbnN0IGNoYXIg
ZnVuY3Rpb25fbmENCj4gIAkJZmF1bHRfcGFyYW1zLT50aW1lcyA9IE1BWF9JTkpFQ1RJT05TX1BF
Ul9JVEVSOw0KPiAgCQlzZXR1cF9pbmplY3Rpb25fZmF1bHQoZmF1bHRfcGFyYW1zKTsNCj4gIAkJ
aW5qZWN0X2ZhdWx0X3Byb2JlKGZkLCBwY2lfc2xvdCwgZnVuY3Rpb25fbmFtZSk7DQo+ICsJCWln
dF9hdWRpb19kcml2ZXJfdW5sb2FkKE5VTEwpOw0KPiAgCQlpZ3Rfa21vZF91bmJpbmQoInhlIiwg
cGNpX3Nsb3QpOw0KPiANCj4gIAkJLyoNCj4gQEAgLTY2Miw2ICs2NjMsNyBAQCBpbnQgaWd0X21h
aW5fYXJncygiSToiLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsDQo+IE5VTEwpDQo+ICAJ
CQlvYV9hZGRfY29uZmlnX2ZhaWwoZmQsIHN5c2ZzLCBkZXZpZCwgcGNpX3Nsb3QsIHMtDQo+ID5u
YW1lKTsNCj4gDQo+ICAJaWd0X2ZpeHR1cmUoKSB7DQo+ICsJCWlndF9hdWRpb19kcml2ZXJfdW5s
b2FkKE5VTEwpOw0KPiAgCQlpZ3Rfa21vZF91bmJpbmQoInhlIiwgcGNpX3Nsb3QpOw0KPiAgCX0N
Cj4gDQo+IEBAIC02NzMsNiArNjc1LDcgQEAgaW50IGlndF9tYWluX2FyZ3MoIkk6IiwgTlVMTCwg
aGVscF9zdHIsIG9wdF9oYW5kbGVyLA0KPiBOVUxMKQ0KPiAgCQkJZXJyID0gaW5qZWN0X2ZhdWx0
X3Byb2JlKGZkLCBwY2lfc2xvdCwgcy0+bmFtZSk7DQo+IA0KPiAgCQkJaWd0X2Fzc2VydF9lcShz
aG91bGRfcGFzcyA/IDAgOiBJTkpFQ1RfRVJSTk8sIGVycik7DQo+ICsJCQlpZ3RfYXVkaW9fZHJp
dmVyX3VubG9hZChOVUxMKTsNCj4gIAkJCWlndF9rbW9kX3VuYmluZCgieGUiLCBwY2lfc2xvdCk7
DQo+ICAJCX0NCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5
LmMgYi90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMgaW5kZXgNCj4gNTUyNDE0OTAzLi5l
ODQyYTc2ZWMgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3N1cnZpdmFiaWxpdHkuYw0K
PiArKysgYi90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMNCj4gQEAgLTE1MCw2ICsxNTAs
NyBAQCBzdGF0aWMgdm9pZCByZXN0b3JlKGludCBzaWcpICB7DQo+ICAJaW50IGNvbmZpZ2ZzX2Zk
Ow0KPiANCj4gKwlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4gIAlpZ3Rfa21vZF91
bmJpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiANCj4gIAljb25maWdmc19mZCA9IGlndF9jb25maWdm
c19vcGVuKCJ4ZSIpOyBAQCAtMTYyLDYgKzE2Myw3IEBAIHN0YXRpYw0KPiB2b2lkIHJlc3RvcmUo
aW50IHNpZykNCj4gDQo+ICBzdGF0aWMgdm9pZCBzZXRfc3Vydml2YWJpbGl0eV9tb2RlKGludCBj
b25maWdmc19kZXZpY2VfZmQsIGJvb2wgdmFsdWUpICB7DQo+ICsJaWd0X2F1ZGlvX2RyaXZlcl91
bmxvYWQoTlVMTCk7DQo+ICAJaWd0X2ttb2RfdW5iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gIAlp
Z3Rfc3lzZnNfc2V0X2Jvb2xlYW4oY29uZmlnZnNfZGV2aWNlX2ZkLCAic3Vydml2YWJpbGl0eV9t
b2RlIiwNCj4gdmFsdWUpOw0KPiAgCWlndF9rbW9kX2JpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiAt
LQ0KPiAyLjQ1LjINCg0K
