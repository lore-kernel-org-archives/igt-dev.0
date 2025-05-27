Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C9FC54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 19:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024F310E00C;
	Tue, 27 May 2025 19:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYS08O2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA4F10E00C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748373397; x=1779909397;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UZM7h4Mj6DH+az3hXKagw+JAEEUGjD39XJdqxVMDPUY=;
 b=OYS08O2KrjSHk8/58txA9a5rMmknLc0q/VfH9yP7MtcYjN06U/FFgMy+
 UcrUp1nZscAzJll3tGVeViYE+euaRgN/btov1IOslXg4rkI4i92aSDJ3F
 eD56iv5zydd7Zp/k/SnTwW8hsg3wxx958GjsOyPoYrYM+nL2PpLq8jZcI
 WKSicAuLZDjOlEtH/f9G1r/vWae/cR3cJJmLjcpI8zr1j/ynDVF5EJ3us
 ECpS1U9Vq0Aw5p5Qnr25It9/rv1xW7cY/j/c69BvsVq4fW0sMFTVG5CwQ
 oJCzKcThGkfHyJ72lZnNubsu8p0iC3YWilW+ullyhd+JheGKLnxSQHx32 Q==;
X-CSE-ConnectionGUID: EbNChwMLT5CswhC+9trlGQ==
X-CSE-MsgGUID: 4aeSQefzQEmDYNskyttvxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50541032"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="50541032"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:16:37 -0700
X-CSE-ConnectionGUID: gPU45fRQQM+zE7tQZ3VoDw==
X-CSE-MsgGUID: U4f78fc9ThGIv+FFbb6Qpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="147702939"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:16:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 12:16:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 12:16:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.52)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 12:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT8eFCjpyspjw8n5Tl/d3lkuGBSL68RYuR525YJureOJprEujSRC5iSJsu9NGF0QgTDDhTyjIiF8lioRP04HpoqLaAaCE/4yTTCnZRlzU04WFOQm2nTOJdZAx+L1KdqaZ3zdityHPizy73J5IZz+BlfNiX1VjkCi0gb7txb8ZXZY7dFo+N8KS/TMrPOEPCydG7M7949Ifzgf9BsyFOBmFYlPLk5MhlqKEcyA7WoKnwTuCD15o4GeOGQZe5LmQ1yf7Mh0lvRgDE29XFtNnmyapBHfZ54pT62RM0NA9/0cFQYtY/OR03YSytX6StvojUo6hZftBX+lXgwpDkmvCwvUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrFNiXTeX0oC7qi3aPtz7pUKJkJxgTCuL6gInSU6iW8=;
 b=i1g4v09FV933JfAhar99YcoqUl10dAj6h1oVu/t1aOLh3aai6TqEcKT2DpMs28b9Nml/5us29n6xHcbTtqppsCoJWFz8YO0xuGjAj8P4LzASIVV14eSECZXuUowZj0D5X9RtUzmi7UlWUpsz/NjXAnwY7jwg/SgFQ7k2/eWMezIHiag6SnweorlVLVMtj9qfM2jmUi2/wUW83LW18ZrkIyVUO5weGl8DybnVyoDRZOc7O+Y4009jmfn3H+ANy5Ta1bZPN7wdM0GZK2HDNTDlYmB4LQtzBz92JuuTWbEXSfK6fV0wRxMoRUVSAOfW0laQ0es4IjDhgt39cK/vRJ3k4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN0PR11MB6058.namprd11.prod.outlook.com (2603:10b6:208:376::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 19:16:32 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 19:16:32 +0000
Date: Tue, 27 May 2025 21:16:28 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 07/11] tests/xe_copy_basic: add testcase with
 large buffer size
Message-ID: <aDYPjFET6uh_d80r@fdugast-desk>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523080126.75295-8-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0184.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN0PR11MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e49c35f-88a3-44c1-1368-08dd9d52fd4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEVKelU3ZTNxNkFKY2REOExpR3ZrOThEYm54bkpZa1RxUWpHZFRKT2IwaVl5?=
 =?utf-8?B?VDNQVHZuQ1ZLbmppUm9HbmNOU25kbjhIbWU5NzJvUCtQRkpJekJ4eWM5aDVT?=
 =?utf-8?B?aEJxT1hhMEYrQ0hENU5RMTRiZU04cG9aOEtMNHZEZFZhTmhUcWUzT2hheW5p?=
 =?utf-8?B?eUk5RzdacnJLZDdnOHNUR2t1dHZjLzhyMm42R245YVEvdlh2c3JrZW9maXB3?=
 =?utf-8?B?M3BSUVpnaGI1amxvbXZEdnhESmtpTHBucnAxaVlEL21oZG9KdTEzUHRsNk9z?=
 =?utf-8?B?MFFJcWlXdkdIRGplQXEzWUg3bkhtYzA3TkFOVGt1OGVKM0FOcEk4eTYzMEFQ?=
 =?utf-8?B?WE1qcWpDY0xEWTQ3Y1RLSjhyVW9TWm94WUU1OExqYm1SOG9JcjFmaTBiYWNa?=
 =?utf-8?B?Mzh3V2hFWXNwVmV2QlN5TTd0TEtoZEQvZlB6Z3dsN0dMUm1EdnN4WHlrOTIv?=
 =?utf-8?B?SXdVWlFkNERpSnF1N0tLdEFzY0hLajNHMVZ6N3c4enhST2ZkRnlaTEhHT1py?=
 =?utf-8?B?blcxcHpVYytJem0wNDVReTViWHlVejdmYThnUFFwZW1GOW42OEh5WVVhVjl3?=
 =?utf-8?B?OGZRNDE0ZUZ2YlUvbXl5Z0N6b0xiS21BZjF1QXdyUUlsbk5Kcm9xcmllK3Zv?=
 =?utf-8?B?cTJOb0NIVVRKRm5JTlhESlhuUEk0TnhaUEVGdmhaV0l6clpPbnZKcnpwMWpv?=
 =?utf-8?B?cmV3bzRJREFHelpzQ2xLUVJDT2pBanpZZXZaYmFVVnlWc25oSHlZYzUwWXkz?=
 =?utf-8?B?UlQ2OXFGa2JqMzkzWi9sWElnWVRLbzZpK0RvTDRZVkJZbmhqUlBvYUExSVRH?=
 =?utf-8?B?UnNiZThkQTJWai9JZkVUci9SWmNaNUtFYTE4aTdMbk55WjRnemNkNkRaOCtK?=
 =?utf-8?B?UVVzMTczZzJablZFZDVOckFPWGZlVUJLeC94bWFxQ3huMTBWY1dBU3JyYmQz?=
 =?utf-8?B?OXBWTDhrTHkxOE5Ec2dSejdSUUh3UHp1T3dNa1M1QnU0TlJCTzd6RkVOVjJD?=
 =?utf-8?B?TzI3SU1RbWV5MGdQemRURWNpVFVyblpCZDlrNGIzTXUvemk2Q1FwcnhxV3d0?=
 =?utf-8?B?UHpjTHVNRXBEeUkrdXQ3YkNOdmh4VTY4R3NSZDFvbk1UZWZ5WjRJTXNBeU9Q?=
 =?utf-8?B?ZWFIQU5iMXR4OXUvZVQ1TnU5MXdqZ0NzS2RZUWdFRXpQQ3RHNmcxNXdFc2d6?=
 =?utf-8?B?YmM1M0F2VUw2ZlpGZHV6R2hwWmE3WGVmL1B3cS9GUDZyM2wyRTQxOXUvaFAv?=
 =?utf-8?B?V3pzNHVGVk1sVUZTSGhCOHNZVmJDK1pBSXJoNEREdVhqUUpXbXVoVDBrSEt1?=
 =?utf-8?B?TGtkMGZSd3l4T2V5R1hmL05TNEZQcis1cWFDY2VWdnlBTnJsVWVBTmNSQURs?=
 =?utf-8?B?c09uQ21UdWtZc1BISkxWVExOL01YRlRKUmlkTHJBR21lM3RVa3RGOCtsZVdU?=
 =?utf-8?B?TnFwaXFCZ0xOYVNzakQ5a0haSmcvMmI5cWdHMzhBOVBxUjN2MjdlTVU5ZUNo?=
 =?utf-8?B?blZRV3p3WVo5WE95dkdSRFJwSm1sTExVQTV5RzFPZVMvdWFLbGlrTjVRTzVo?=
 =?utf-8?B?SlNmWmI5RzVmTmEzUmFLWm40Vi9zVTB3Uzl1djd3UTJKV0U2VmttR0Flekx6?=
 =?utf-8?B?YjlDNVhuVnZwOXFDMzdGQ21Qa2tSWXljVHFldExPOXZ5NFpJbHh0QWdDdmEw?=
 =?utf-8?B?RjZhb3RHTDlxRGMwWEdvbHYzMVIwc2hrUHk3VXJLMERtZG95UElFcVdDMFNK?=
 =?utf-8?B?VjRMYktEcHZMS2RYVklGTE1jT2ZlMWU1T3p4T1VKRm9TbVZ3NHg2WmwvRGlu?=
 =?utf-8?B?cGNkQ1daeis1M0ZRVDM3VHA2UlFoVk5CWTJwVXdFU0FBMTAzWStWb2MrWU1w?=
 =?utf-8?B?MlFFQTVobUg0ZGcrb25XOVpHT3JXbzZiTU1RTlhvdnpWemFWa0szYmpVd1lz?=
 =?utf-8?Q?MWxeL5yFMgI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnBmUTgzNXgzNXZCWUQ0Mm9iaTlXVEtJVGlHbVFIYThsNURpaDIxa3d1Q3RU?=
 =?utf-8?B?Q1hqdlRRaFYwUlZhVTR1VzcvK2RQaldLd1QxUXNLM1prQkdYUnhaWU0vY3R4?=
 =?utf-8?B?WTZudUFFUVBEMzNwUUg1MDRqWkozdEUyTkZNREhjbkkxa3NUUWZuenpESVhH?=
 =?utf-8?B?L3l0OHZnNUtYZWtUTTBTMTZyWnUySUlNWGIwaXBOclhYUTFPa3ZZeGplS0I3?=
 =?utf-8?B?ZU10a2doNVdDWGVEOUt5NHRxV1JaQnNIWGx2c21OZldOdGFrcnFmckN3Q0Nr?=
 =?utf-8?B?K3k1SWJta1ZlVkUzd2dacU9CbnpmbVZaTDAxMnVFR045TVgzOExWU2NWUzVo?=
 =?utf-8?B?UU5YRHRTenFzdzUyT3NVSHR0TDN3YWQxbGFNZFhsZjRNYjVYYmRRd2xwTHdw?=
 =?utf-8?B?NFNudVNOWHMzQWo5K3daR0hPc3R6bXhaTFVBY1R1UjVQaGpia21mREsySEI4?=
 =?utf-8?B?Q1lhOCtCR05ZRHJLdDFETVZUYkdOamtnYStwRU1sdS9NUUdKNUwwMEdZbEt6?=
 =?utf-8?B?NFZEVHlOc1lwZjZ6Nlh5YW5uc2xpN09zMEZ0MitwSkZmQVRmWWkwRVlqbkZ3?=
 =?utf-8?B?N2J3bHpTb0VQdFdkL001RnI5a2tPQThPeXhGWHNvdUtXdE5PcnIvUkVMVm5m?=
 =?utf-8?B?VjhJdWhYazhZWkxJTGE2QWNTa01CeXVmT2VPQndqN3IxRXIybUdrT3ZpNTRE?=
 =?utf-8?B?bmZOUHJPeVJzNU5QWmlyZTBXUUcwNGUrNjdxcDA0dVFscWd6a3VFVmsvS0gz?=
 =?utf-8?B?WkE0VmhVMDVUZy8zbXR6VGFKSGgzUGNndGtONk1BU2JGUXdrci8rRVVZT2du?=
 =?utf-8?B?cUJPeFBuTXRLY0RvMEIxS0M4a3B6cUsvMGNjaWYwL1hpSWIrU2ZzME5CMHR6?=
 =?utf-8?B?Slp3c3E2cHBBelh2bFMvQllVMDkwK0c1V05RUEtDQ1VOWC80NFU5dFVpYzZJ?=
 =?utf-8?B?ZWdoTkNtR2FZOXFjcUNFVlZlcWFSVElScWRqcTNlR2xVamhwVldsRjhEYUt1?=
 =?utf-8?B?SjZtcmFxK1dOMTZiUkx0dzBBSTNHcDNrOHhRR01oOEdCcUVKNlZCMERmUG5r?=
 =?utf-8?B?N2RUQTloem5rQmFzdmFTQ1ZEaWNUOGhOdnlWSW9FWVhlNkdRZjRaTGZUakZD?=
 =?utf-8?B?TDMwalh5OEhrbU9lNUxGUGV1T1pxNXRUQzh5RHR0Tkx3bkJxTmYrUThZN1VH?=
 =?utf-8?B?bnJXOUt6M0VTbkJ6eFhSOFdQTDVQVkMzaFBhaDFrSU4xRnJzM1NXZWNGVzRD?=
 =?utf-8?B?MTJhSnhjc1RBK21wTEI5bFgrM1p3WGhwalhzcUtvQ3pLZ3IzWElwUUxiRUZs?=
 =?utf-8?B?SjhmL1o4NnpDdlVQd0lqSHpMV1EyS3BNeUVGeHVZSnlHYm9tT3hRMVB4UGlS?=
 =?utf-8?B?UDFMUy9ZMXRzdG5SYUt3YUhTMHBIeUhvOU1EVzNTWlJZS0hSSGJvWDJsamxk?=
 =?utf-8?B?bDZ0TUhScmd3bHpzRmFFeitBbTVSR05Mb243M0ZUbWFWSGxJdjVJbkNFWm1X?=
 =?utf-8?B?TzlGZ1dNUkt1UDZrSTQ4L3g4aFZOOGIwZGN2V0Z2ZjlYZFcxZWpEalhGRmtE?=
 =?utf-8?B?c1JidnBRTCtmaXl5Y3R6SXRpUTZsL2ZUZ0dMZDFUVHhoVzNaY0FyMXlnSnJk?=
 =?utf-8?B?ZTRRTVVJMmk5TmZBMytvR3NYb3VxajdiNjdoc0xWd3RtM3VlSVF4Rjhqb3dt?=
 =?utf-8?B?UU93eUdDc0hBZUIwV0FNOE92VStxWCtiMGNWU0x3VHlCSk1RTit4d0N2Ry8w?=
 =?utf-8?B?MFAxTzRIOStqUlpJcHRYSVplOERDa21CT21XeS96dVlPb0xOSWNNS3lWbmNP?=
 =?utf-8?B?VUlOckpybGNUZFNpSUJLV3NwczR5LzNhQXRMcHpkcjFRV1R3aFAyNkg2QmVh?=
 =?utf-8?B?UnZ6QVJFaWJoUlluN01lNjBidEJsb3FyZHdWVmVsQUk2dmlaRStjaG1uSDRv?=
 =?utf-8?B?MXdoZWQ4REVCTldQeUFxZGQyeEFobEdaMVZHWWxwVWVnVTU5Nnd4a1pZZ1hL?=
 =?utf-8?B?MnNjZW1EWlM5OWxLeXVhN3VLbHF5N2JaRnFiUndYUEhlTElHQVdCVkcwNDJn?=
 =?utf-8?B?Z05QRU5wSUgrWFA4MndRdzVacFVmanRKcEl4UTh4Nms1ekV3aENuS21UVnBp?=
 =?utf-8?B?MmZVdEhKV3ZsY0hZZjIzczVRaGw0U1RkTHZrU3ZpTkpxcldsQnZ2dCtJY2Yv?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e49c35f-88a3-44c1-1368-08dd9d52fd4a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:16:32.0672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdW9BGY22SbYXYuq6Vi6P4oRn/6HH10gbXnnc7Dh1fOf7QB61Y4N2S6wMuE0SJOkxt1ufP5/USjc45fJ35mnVAzC37op1gmTwHqtTxHF/WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6058
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

On Fri, May 23, 2025 at 10:01:22AM +0200, Zbigniew Kempczyński wrote:
> Maximum possible size for mem-copy/byte is 256KiB. Verify intel_blt
> is able to emit multiple mem-copy commands to copy buffer which
> is larger than 256KiB.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_copy_basic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 569f250cc4..bed3e39426 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -46,6 +46,7 @@ struct rect {
>   * @0x3fff: 0x3fff
>   * @0xfd: 0xfd
>   * @0xfffe: 0xfffe
> + * @0x8fffe: 0x8fffe
>   */
>  static void
>  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> @@ -99,6 +100,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>   * @0x3fff: 0x3fff
>   * @0xfd: 0xfd
>   * @0xfffe: 0xfffe
> + * @0x8fffe: 0x8fffe
>   */
>  static void
>  mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
> @@ -172,7 +174,8 @@ igt_main
>  	struct rect linear[] = { { 0, 0xfd, 1 },
>  				 { 0, 0x369, 1 },
>  				 { 0, 0x3fff, 1 },
> -				 { 0, 0xfffe, 1 } };
> +				 { 0, 0xfffe, 1 },
> +				 { 0, 0x8fffe, 1 } };
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> -- 
> 2.43.0
> 
