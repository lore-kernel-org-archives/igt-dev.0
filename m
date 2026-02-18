Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA4FE9A049
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 12:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5301110E00F;
	Wed, 18 Feb 2026 12:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULcSyscI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C5E10E00F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771418035; x=1802954035;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=p5dYyMMKW/UXnWaT/ythmyO/YM0vN1ESNgMe1p7db0E=;
 b=ULcSyscIgN9YRUnT3u/wfs5reDF57Jpd/+L9x8a78FPF3via+xFoISVQ
 psROEg/ljtl7FZzSFbK1cDsF9rFHkM/3XDSaVj67mrUzMuYFdgaJcfLk5
 hPjysIy/cSiFBxzj4J4fFkXoJQ4qjxrEmjMdAMxh49pFUpYxUTtUI4dy7
 WSq7/6aVAvJMelGOHRYbIRPdHilPdCkIeneS7FgPkTzh6aNsVozqxdE0e
 opCCwqxqoeLzGp3vWpGK7qk3KtCCTQcLLbdLkB77cV8hL1/HSBZZxt0CW
 8ww1xD6GMNIK9xusOLfLvnnQysippqcthoFhCotRb/oM1IuO75wIBAvJI g==;
X-CSE-ConnectionGUID: o5ppJ+VBSFCHhhYmqdOcJA==
X-CSE-MsgGUID: PommESxqSByR990V/F2peg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71512238"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="71512238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:33:54 -0800
X-CSE-ConnectionGUID: p6VPhiLVQ921E8PRZYQ1Dg==
X-CSE-MsgGUID: nIHpBqnoS4OxOCKK7kcOzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="213423458"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:33:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:33:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 04:33:53 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:33:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+R3DSYEUWt7LmrCUHy+0jU90SE5Kpn5LmyGBWlVc1Sy7WymLNbZyv08xLL52cvRs+5spiKqe1CLfhSAJg9ldApZTZQR8qGfpqh8CIzevo9B+2/c1PZ4KNgZ/x+RQnR4LpprEs2Fc6fKT7RO65iWZsJ6BCJ1ZrakHSuBiFS/DsomI6YU6XzVZ2W97L85NLP6mc5r8QMt7r0JoyD9JwqM7BX2JOHYg2VacuMg9D7JWef14Azmmvv/YkLnrjH47oE3/dPfpF1xqVkRQizDPFLVTQyUT0G8gFpFlalBK5Lq92gLcjQQOOJNTmnKiPR4Jm8ozATtP9OcXcWm2LTzU0xdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+htCX6IZrnoD0p5/e4iqSy1MGcZMPYNrvdyCoZkSpc=;
 b=dV3P3tGqe6R1roOU+I4RhmGtFhv/bQKwg2+4Tbru6F5U/0yGVhGexllIoBnb/h7h3WQq5cj/fPvQ0mvI6FlM12+jij8T5IFfc+MiBVSGnLrfUNxELQEQs3kB5xehVIqiF+9zCaSgBa13EArS4FxZuCojBkdRhCAGmqoUNud1WV77EBZqgqvIFVor/HlWXrGRe+OJc40N7Ux7MXFEJJTkvIfZDh8P9IUehk8c3WQ3Kr2rk+WgjHhEnhFAUiKIOLWW8zlSfXAczu1TtLpeb7I9mP5nzLUxo0G1Wu6a1zB7QUamVSmqRgnEGAEKYwPQUawJeG8EQErmtgTX4Fbq2i5VNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 12:33:50 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 12:33:50 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v2 i-g-t 0/4] meson/tools: split lightweight igt core and
 reduce tool dependencies
Date: Wed, 18 Feb 2026 13:33:55 +0100
Message-ID: <cover.1771248283.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cba42a5-fa69-43c9-2f44-08de6ee9f81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0JTQnFpNU1HR2gvL1daRDQ5MUVWclliOW8vaU9VZGZuRlpSMUpNS2VvSFFZ?=
 =?utf-8?B?aG5VZm9rMVFCWUhFTkJNeDNvRzNJemZ1Y056S1FCK01VS1Ewa3FHR1g3STRi?=
 =?utf-8?B?UTJOV2NydWs2N1hQVFA4Ujl2Z28wS0t3UW9PSFp0a09lTVVhcmtFM0NYQ2N5?=
 =?utf-8?B?QXBOdGJFdlh6U0JoWTVreEZaK0Q3NktRMkk2TTFrTjlWd2Z0TTljUmxSMnJw?=
 =?utf-8?B?dXlNY2xHYURITEFVSC94UXh4VzdzN1RQQU1Bazd3enl5anVkTXJrS2ZIcFFp?=
 =?utf-8?B?WU9SR1RWbUxGYlU3RElBVjA0QUNwM05sck14UzhDQlE3YmpGUktlRmxxRS9E?=
 =?utf-8?B?YWN2SWZLWVpydHlndlpINHMzS2JHRmtKWlFSNFVkSWpmM0RPZzlZM2lUSEVh?=
 =?utf-8?B?ZWZOblF2NWhHOWFsMTZMdkdOWmFkekxZVmFoKzNsaVBmMmpSV3htLzFiUi9n?=
 =?utf-8?B?ZHZPdVFoQlg0d0JncDQxalVFenhSekY0V2ZGSkZLRjgrSEpqbWxYNk9nRWt5?=
 =?utf-8?B?dkdOa2JqdnhvWUcra1gwNklMWENjRHorWkVrb1FPNWxkOUJoQkxhSVRyMEhR?=
 =?utf-8?B?V2dBS1pUcVZQRTA1VlRNNnZIVDJDanhMTlBWSXVtWld2UmFrN1MyYXJPeXUx?=
 =?utf-8?B?TVA3UE9sRTdGcGtFaElJZjNqZDVNK3ltelRVaWpjTndDRGtZOVFXY3RBRmZ1?=
 =?utf-8?B?UkV1cWdld2d3U0FJbXRLQmZ2WW5XTEliNDkxbWpvbWlMWmFGUng3anJyak56?=
 =?utf-8?B?T3NqMjBrQlc0Vm5rYWE2RGtIMjNjS3A1eU5aZlZPdVpQRENNSVUzYUl2elFP?=
 =?utf-8?B?NURMWTVoQmNOYlkzRVF4emt0TWdKWFcxc2RlazREV1VtZlBMaS8vWkpHaEts?=
 =?utf-8?B?emtuYWZoaEZscVBCSDBpU2xGLzduQ25UaFVwVWZvOGpTVEJEdEhpdUNOVjNB?=
 =?utf-8?B?NHpua0drR3B5Y2NoaGhNUVE1VXpiSC8zRjBQYnVOVUdrVFdRaExsRWVMVG9w?=
 =?utf-8?B?bUg5dWtlSE9mV093QUF1aTNUZTdkT0dReFhBTFdWeUt5WnVrSkszNmJ3L2VO?=
 =?utf-8?B?a1lUQTg4QWdyRWZ1WjlRMlM1MXR3WTIxNkhjMkIzMVZzWXhoODl0b2ZBWTZ3?=
 =?utf-8?B?QkFWeGhqM09NcWx5dWxSTXUxbTdKZ2p5QmpGN2NVY1pna0l2SWp4Qi9tK3c1?=
 =?utf-8?B?RUE1bVZkM1d3eWlveUZqQ21MZGtmVzJINWs5Um9uT05RYXlxTkoyR011SFVu?=
 =?utf-8?B?bFh5N0dtenZEMVIveGFmcXlMOUJ5NTNJY05nSkk0U3dvUEEyZ2EvMDVSZVFa?=
 =?utf-8?B?c0c2MTJaVi9od1J5MURiN2c4eHk1dFNUdktCYVJ1MGdsbE5KMmNjZ0JXZ0FF?=
 =?utf-8?B?SzMySHlWeUphRkNpdGY3Smk1WTFPK3ZJdjBHQkVMdHVKcENDZnBING9pUlB1?=
 =?utf-8?B?WVRFcVRjQjZqVGN5ZHRxaE5oWFYySVVLTHpnWlJiY0VvdEgxMVIrYzIxSUtS?=
 =?utf-8?B?RDNNbUoxRDI1K01lV2prVWFBQjZCY3cxVk0yaEJPQXQzSE9hR0MzaUZpNzdN?=
 =?utf-8?B?L3U5bGVFckhtRlM0cjVKOUM1VkFHWEx0MkFTaDlKNHhhL0FJa09DOHlBdzRz?=
 =?utf-8?B?Y1ZkcHJmSk1EUVhGQzlnd1g1YTRzM2x6TDYrdHNBQmUwUkx3dE4zaW9mQkRB?=
 =?utf-8?B?dGRkdk5HV29zQTFGWklGbHBQb2xteE1sekY4WW12ZDV6eS9qeHZlQXYxVVNM?=
 =?utf-8?B?alp6YjZubklFQ1JhcWhMTzZ2RmM3SlN1V0lycExvK0tReWJpSmM5YllNUkR2?=
 =?utf-8?B?cWo1MUd1Z1pieVpBb3FWYk1CNzlGZWdiSCtxeDVsOElYRUdEZEtxVmJRU3Jj?=
 =?utf-8?B?LzZ0aEdLQ3hZVDZYYVlkZkdlNDk0NFFzYjR3Y3RnQlpHN3FqbGhVNlo5Z2NN?=
 =?utf-8?B?S0g3SkI5TlFFMDNtMGFNMTNCUnRCL0JsTDB4a0lKem1tM2RLZTZicGtjZ1BG?=
 =?utf-8?B?eFphak0rSVVtZHlaeC9na0NKNndjVnNFSEw4N2UzS2J1Yy9VU0g1TEo2VTZj?=
 =?utf-8?B?UUI5Rit6R0g4Y1VqRG5WNG0zdk1KbXJDQVFDVVp3anpJWkg2dHZZTmt1T2Jk?=
 =?utf-8?Q?4L1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1Z2ZXVOMjBWTUI5d2MwNGNSbFV2d0RXNy9Gc0xVWmx2NWhWYjRxQ3VLSXVw?=
 =?utf-8?B?UFlRakErdDRvVGJJa2NYOWVvMUtmTGdIeUwwTGMveHZWajhqYis0U2dtS3NK?=
 =?utf-8?B?R0xvbzRkb0wwOWMrMzBDd0Y4b1JhdUpuVlVuTEJOYThWMW1hYk1obDVzZ2RI?=
 =?utf-8?B?NjBwL2syU21SZlFqY3VVL2hhWStnQllzN2pkdXloN3hEaDhmVFhJb2JQTmNN?=
 =?utf-8?B?WStPcDE1b203bCtONlo2RkF1cmVUN0tsejJ1ME9PTnlrVk1NMjlRdnlUMnV3?=
 =?utf-8?B?R0RRVDErcGdmOFExNjJVMmdNUjAxRGNSbGtTMzN3bWorRlF0Nzg2U2lNTXgx?=
 =?utf-8?B?SW02emFlVUhBQ0wzL1lKdVRUMUNDaGtZOEROZ2VibWpZbDBwK3BuK0pHRGo4?=
 =?utf-8?B?OXYxbGovbkQyTzY5OTAvMWxySGFrYnJya3BoUzNyVklEd0gydkxrR3d5dUM4?=
 =?utf-8?B?M0pzY2g2cUprRTIrb0dCV3d5NkVjd1RudTBCeGJNTjBBVFhpaHZ4THF1R1FD?=
 =?utf-8?B?b2VLdGQwQkZMUzZZdHlJU0hOMkE2bmQyNmxyMDVhemZ2ZnFGT25ZMDF5L0RH?=
 =?utf-8?B?VldsUXFINkJiZGNRQWxaTkc3anpxOVNhTHFDYTRtaDkrQ1VVbWtWdFFJeGVC?=
 =?utf-8?B?U0tDSzNPUXc2WGs1M0Q4TDVtaHpmQzhLRWZJUCtFYmNYN0lWUGZoOTh3alVw?=
 =?utf-8?B?SU9veGFUMHFZWmd3eWpTLzVWWHhVSlpXOWVjSVVISnIwZGQ3MExvSXJtWGo0?=
 =?utf-8?B?ZzZDZEtWRFEya1FUREVGZ2VZWVpBb0Fxei9Xbm1Nc3VrNTV4TlBHZEVBeGYz?=
 =?utf-8?B?eVVpOVVyM1REU3pWekp1SXhKeGpJSnl5MHFiMHVwb2NNUlZnSWJnNzRMQWtn?=
 =?utf-8?B?enQ2ajVpalFlTWRCNjk5M2dKNmVsbDNrUTBYQ09uQ21mdEJyMkxnUTVGLytn?=
 =?utf-8?B?OTNNZ0pXOHdmbUlvbFJja1prejJVdXRQVVhCWHBpdnFNMjRHYklJN3EyUlJl?=
 =?utf-8?B?dWNzQWdmZk95VlgwRng1ZTVYSU83YUNxOTdCY3dtUGM5NjBGY1dQenVuYkQ0?=
 =?utf-8?B?YXhTZUlRclZzcktlcytENkhYNTU3eGVMS1lvVno5U0lkSEpFU3ZURnQxTzFn?=
 =?utf-8?B?ZXQzN3d6MzZzSVFRako2bzZsN2YrQW5ITTNxb2lYTjR3T1owS21PbVBJN2oy?=
 =?utf-8?B?ejhURkFBNUM2WURhbDhyTXk4ZkdVb3FqcXczSjVuanV2UzBtTFNGQmM3dDFW?=
 =?utf-8?B?VWhNUVVDQTN4aFcwT3lyOS9VY1B5UTRLMnl1MklXc3Z1RENYSXNxM0pnQ01q?=
 =?utf-8?B?RDdwQlB3bHlOMmpxcFRpb09WZmxXaEZBQUhpdndKUG5kUG1Zd0tHb1BvVWRo?=
 =?utf-8?B?eDJIbjMyaGh5SytHQWtkSEJKdEd0V0IrRVhaOVB6czduaHFiamw0eERodFFD?=
 =?utf-8?B?K0FRWW5QWkEwQWxEN0tKbXg1SUtOcE5VRlFPNHhkc2NyNmFDZWRhYXF3aExi?=
 =?utf-8?B?Y0pRa0NMUldwTnVyeUtpL2tjQ2djUmJXSXVZSmVZM3ZnbEhkb0x4TkdmcHZH?=
 =?utf-8?B?cnlkQUt6eG9oNWVpVXBZSld5dCt2QjRaMmc4M0wxVFU4Zmc2bVhnNGVDYnc3?=
 =?utf-8?B?VDhIeWFXb0QvWGtlbnNlcUkzeTVQVkpNektwbHpSLzBiQjh2bFArSDg4YkVn?=
 =?utf-8?B?YTNJUStYanpVRnc5c1BMT3FSNHpUdk1BenZ6TkxmRnF5ZGhOckRlUmdRdXFH?=
 =?utf-8?B?RCtjWkJMcVVudXhBVUVoZXFvWWZUZ2V6L1ByYVFjVW10a2U5R0FQdWpORS9K?=
 =?utf-8?B?Y0htcHRlTVFFWUJGWHA3Z2R1d0N3N0ZnRlVIOWZueGVKcUc0UHFoVjZqZXhY?=
 =?utf-8?B?RURiRWVXK2JlVjZReG9IQWpKcVp6aFN5UXdPZkZkNURhV0oxODNNaXlBbVFu?=
 =?utf-8?B?NE1iSEJVdjFLQjNNMkZJbngyQlQxNXBUbDZ0aGNUVm5Uc1diK2M0bWlqNk1w?=
 =?utf-8?B?K0VvYXA5M1ZidGRocWUrMm84bnhJSXNTUmFDOUVnMzBFZHBYS3dCeEhFd0VS?=
 =?utf-8?B?S2MvQWJKeGh4V2FmNFo4RzF2ZndWMUNTWXUvLzNqRmpmYW1uRk4vanU3OHpl?=
 =?utf-8?B?ZEhOUlVhZHlzY2VQUjh5TDZQRTk4VERHZ0FzaFJWQ3NrZ0xZQ1BQam9VR0RN?=
 =?utf-8?B?bFpDMDZsbzl1UG5IWDY5bHQxZTV1T0lSa0IzVjdwaS9zeGpkc0NKa2FUem9O?=
 =?utf-8?B?K0NTNlhabDBHTXc2NGVkRC80YjBVcnM4aXJXY3pPcE9FYVNweFFLSUkxSXhQ?=
 =?utf-8?B?ZjBVYVdFWURvWmhjdUNqZU5XeEdab2l2anVaMDRudzNLMHNDN2gxaFhjaE5r?=
 =?utf-8?Q?w6ZSyURdRtQBR5cY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cba42a5-fa69-43c9-2f44-08de6ee9f81a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 12:33:50.5609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bbPEzufSqckFpaIBsHOdNonZ17qmne2EBMgPxAsR8S0Au3Aum7EH9nlB/eOM2z3B2SXohiLOLXq/+3k1MxGzdmokF/1I6WJJMKR1FZuuzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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

This patch series continues the effort to reduce unnecessary build-time
and runtime dependencies in IGT tools by clearly separating a lightweight
core subset from the full IGT library and by making tool dependencies
explicit in Meson.

The primary motivation is to allow simple utilities (such as lsgpu) to
build and run without pulling in heavyweight graphical dependencies
(Cairo, Pixman, X11, etc.), while improving maintainability and clarity
of the Meson build files.

Sebastian Brzezinka (4):
  tools/meson: make per-tool dependencies instead of using global deps
  lib/igt_tools_stub: Add igt_load_igtrc() stub implementation
  lib/meson: build core sources as per-file static libs with minimal
    deps
  tools/lsgpu: drop cairo and switch to igt_core

 lib/igt_tools_stub.c |  43 +++++++++++++++
 lib/meson.build      |  42 +++++++++++++++
 tools/lsgpu.c        |   3 +-
 tools/meson.build    | 121 ++++++++++++++++++++-----------------------
 4 files changed, 143 insertions(+), 66 deletions(-)

-- 
2.52.0

