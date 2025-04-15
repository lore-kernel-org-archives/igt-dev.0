Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27632C369B8
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 05:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EDE10E35B;
	Tue, 15 Apr 2025 05:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAcMmrVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE2610E002
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 05:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744695295; x=1776231295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9KDc/1bk7KodLWYCa/cLaWaDLik0Uh2O1JxYnPozNTw=;
 b=TAcMmrVqEasqvCR1Dw2I+3CNqly/UOFlYniBLJ5HmPF8qIpaCMvZDBDe
 /bo8lvqscxFWfyZ2AT2mJpwRrcUQWcML1UbteaWdso5n84hCIB7oNYt6U
 uHEtnC7Lz9HqbdCf/6/RHYwgJ8ZkC16B1gMp5nEfx/C+5C6JkYGNEEDWm
 bdpcEBYSVwoe9r8bMScGrLFYX8bcIGESC4L8MireG4zCgndjf1ZiQZigr
 momBA6LikyU21uS2w1EF+OvlKMj9dSQSqnJcip1kXJLHJRmfs++jA+Hqg
 HZaYk3isWpgo90Z4VVFkyP8TrPbM6ny/v7aUeEzKKYINLWiEAh4ceTK9g g==;
X-CSE-ConnectionGUID: 5GttJGboR8qwSVP2xpTutQ==
X-CSE-MsgGUID: 0sLWdfpkTOqxZShh+bQ++A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45897072"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45897072"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:34:54 -0700
X-CSE-ConnectionGUID: ChzHJYHOTti0XDAq9h3tUg==
X-CSE-MsgGUID: N+vMG9gbQxCjPb8xhhcogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129983406"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:34:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 22:34:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 22:34:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 22:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pixFzB6u5hJENPJpv2mQ7jkrV1x7xIKZU+8HK0y1vYdUTZdQ6kFmQU6L0fEMygRlH/dY9Jb20M5WxXZtjtOR81tHVeR8qPhpdNS1YVknNiPNA4PtDuqunCbCyO+q+yu6NKfbu7YUVPxbrofA8CoysHgLTtfXan+D3tbb/jHT3rGdP9N54vQoCdZeygwWlYl+k4CP5sJIuu6YswM87YjiM3V37KshzQ+C+lbpWENOemxn41GNp2zPSDXXs4GEafgR5ncIKs6DzPTtrzBOUyjA8qaiIQeK8l6ie5Ud5OsMGq+jbuHu7QTlsZFq36LT5pfUdggIGN5uv3XIg+0fTmRsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJXxVL+Stt4kOsYkX8mNxzBdHc8zXGx9uRDKCD/J6kg=;
 b=lsiCwhTHgwT3C5tzIH9G+1oiAKQnSROL/cfGn5HishSYhlhxuGnpPTegyU1adl/J+uXp/0+a/0kHQ5KkNDci5G4QJS2+r+z521Ps3prgqHfk7JexqNaR7tWfj+P7RSwUQZrQU9HgdrDaS341Jdp8sAXAmktMNJOctu9Shxws6573rUNIik16Cm42QIKF3VxS3s+Cx/BhreDxPioivBPa3LZiB0BQetXLCUY5hG4du8/zArPC1ZP4dOC7MFYAOqU+WZ/099+/iHg0MUcEJDNvAvF1Dju4BwBZn3O8SdHuWM69/raJ8J1K5MHbCn/ks3SCo9kK3fgfZr2AXy0b1s/4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by DM3PPF78DCB3A49.namprd11.prod.outlook.com (2603:10b6:f:fc00::f30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 05:34:52 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%7]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 05:34:44 +0000
Message-ID: <45f224ae-639b-4cd7-ad18-99871e488bb5@intel.com>
Date: Tue, 15 Apr 2025 11:04:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 05/10] lib/igt_kmod: Add igt_kmod_bind()
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-5-84b1ad0b8075@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250410-lib-kmod-v1-5-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|DM3PPF78DCB3A49:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0e77a8-7bb9-4a5b-6dbe-08dd7bdf39a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmNvUHM0VEdBVXV5V2FtaGIyYzJ1cUF0QTZqSG4xOFl4SXhNNFp0Z1lmZTZ6?=
 =?utf-8?B?ODlZbE8yeG96VXJ2eituWWpMNFRtMUYyRktSbjE1R2V0dU9NZnlkRWtPNDFm?=
 =?utf-8?B?UE5LV3FZeWxoczZuUkJpRnJaM0dkUW9wRUlUa3FEYUlBcE8wUXJ3RUdBTSt3?=
 =?utf-8?B?VlZvMlV2K0hjQ1VCMFhXL3B2bm9tRytIZThJT0pST0NWL0hUUlFpZWwraG9l?=
 =?utf-8?B?djUvZU50bVBDejBBa3E2cTNZbWpRUUtrcGRTTlorcExId3Q1ekx6WlZ1Y0F4?=
 =?utf-8?B?LzEyWWNKNnRSREZIZFJhUld4QXZ2VEdqMXBtVHpvV0tnNkg5MzA0Z1EzRzIz?=
 =?utf-8?B?blpGbzJ0cHZIMFdkUTFFT3FsN3FMeVFSL09ROFJNNVFlRmtEeHlOdzZVNDFv?=
 =?utf-8?B?N21RR2NRbWZ1MmpJY2lIRTYxMEtEelppSGZmT3VXaytmdUdHMXJGb3RHaCtF?=
 =?utf-8?B?amo5emp6bDgvRHk4Qlg2THluNWV2TnhBelJnamZHdE5mNmt3aWdGNE1yUis2?=
 =?utf-8?B?NmRpV1pVMW9PQ0ViRjdMaTJIcXY0MENZQUVQeXlMckxkMnlNZ0RsTnhpbDNM?=
 =?utf-8?B?UG5FZElFVnpHaEFNdjBsUTl1U0dDYUNtZy9VQmpDMlE1SmpQVUxvOGc5U1lh?=
 =?utf-8?B?bTJQaGI4MTBVcXRNR2Q4Y3BIa0QxNG5Dd0FKdjgyWmZKR0tlS0t1ck1RaC8z?=
 =?utf-8?B?ZEN0WjhudC9kTGdXUlNoU3JaQmZSZmJPVlRKbjF0NW1PQnQzK3lnbzltNzlW?=
 =?utf-8?B?V2dOT3lEakZPQkpNVDgzODRZSGMzRnl3UnUzaU45TGR3dlJ1VU0zNzNHb1dF?=
 =?utf-8?B?Umk1UFF0eFNMWmttQXJLQVJWYWdGYktsajZZd0JuYXJNQzBhZW1YZHNIQSt3?=
 =?utf-8?B?eHZMOXdHTUc0ejJhMWN3REdDS2pvTFBNSlBqcXVEV3ovY0ZVVFI3bGhDNnZj?=
 =?utf-8?B?SytLbDhQSzh0cXZWOGJ3WjBMdTV6ck5DMktLWC9jSEN4Tk83U0xQWklHWDJ5?=
 =?utf-8?B?bS81YXRJMnZHSG1vWHVhQ2phOC8vYVhrcEhaRWZpc3hYZG5QWDdIN3Y2Mmp2?=
 =?utf-8?B?VmE3bml3NWptMEpuQVo2azU3MnRyWXhqMTFlWDlXRVQwcU9Icmp0VXcxRUp5?=
 =?utf-8?B?T2gzZzE4SFhONnFqOTR2MDViVzNscDZvK3JJdk1wanhsNFZBY3IrSUhpSXIr?=
 =?utf-8?B?L2U1ZWxGeEs1N0hpNTR6UmlOWlp5U0swOFlyM0lMaUppWFVRVm00bjJTNlF3?=
 =?utf-8?B?RFBqZ1QrY0t4aUVqTjhpYndJc3dJLzErZk9xVkhRazd4UEJHMWdFL1dONXV6?=
 =?utf-8?B?Uy9RMitsZlNiM3NqaDVQRkIybjFLbHpVbHltQTAvY05WMHlBenlmRURoOG15?=
 =?utf-8?B?KytMR2tTTkk1VWNjVmQxU2V1UXNIckxPWWwyMW4xS3d6QVEvQmxVRDE5K21x?=
 =?utf-8?B?blRIaUkvakJVaVM5TnR5OUZWSTRyTnJ2ZkwwZ0xUc0lyL0ZIaStNaWhhd1dH?=
 =?utf-8?B?QmlncXVSV29BY0c3N3I3ZkFJWjM1bEs3R3RSMlQ2VU82ZUN1NTJoYjloQ3hq?=
 =?utf-8?B?SW5IbHhpQUVRcWdYN0FXR3l1Q3EycW90d1l0YVRtaVBwbFdZV01nRWx0Z2Z6?=
 =?utf-8?B?RlhML1VQVXg2alB4ZXh2S1hieWZLZURWSUZBUzdKdXRGRk1wNlFlNEVMWHVJ?=
 =?utf-8?B?SVh2Y3hTZENIditPQml0WVJIajM2QnJUckFISzNJNnhOT1JIMnFpaVQ0TzRr?=
 =?utf-8?B?TG1sM3B1YnVRUzJyU052bk95b2lGUFhYNU9NRnVzTHBoWVc3d2JHKzlZdTF0?=
 =?utf-8?B?dW1FLzltZk80bytEejFZR2NFVzcxQlJmQ045aCtscGR3WWdaUGFrV1NXcVBt?=
 =?utf-8?B?T0MrLzNxRnlUTjdlbzNlWklyZVN4bXpWdEpPQnVHQVpvT1dwcGZOS2hYbjlz?=
 =?utf-8?Q?50RD6+n3AaY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZxL3JkWml2aUFtNWxVdllqRlpHMlFBOFVGWW9EVGZrR3pzUWNqeUwrcE1n?=
 =?utf-8?B?dDJQSWJUMTNCTW5zR0VsRnVhZGJub0ZZenVGc3lPb2Q1N2ZySm41dG5zU1Z4?=
 =?utf-8?B?V2RaR2ZZL04wcHN2YUVmS21uc3IwOG0vbk9NS01UUzZweDRNYmUrVGJLdlpF?=
 =?utf-8?B?V3FyZUdSUDJsdGloV0RGV25pSzBEeHI1V3UvQzlGN01JNGVJYnJ0aEIzTUxO?=
 =?utf-8?B?VTQ2KzVTRi9xNFlVRC9NUEtmaENvUzJWU2FEN0xCbkRydXBTYVJJSG5KVUpY?=
 =?utf-8?B?VmNOenNFb1haakVNYi9TMlJHTEpPc25QM3JpVE40Zk5tNTJ2TUpoNDBVMnlw?=
 =?utf-8?B?cVFKRk9BRWx2M2orenpkcm4yZlJncnF6VXd6aCszbVpuK1VYNnNYQ296M0NN?=
 =?utf-8?B?T2x2UmVvTEZ3SnRZQ3JPdVVuWUxlTmcrVHVULzRCdWhIYUs5c09nL2hoaHB6?=
 =?utf-8?B?SG8wRGZPV0NBVGtqdi9tMG92blMwS3VSL1VDN20yaG5aQ1VLQUdlMy9ER0tE?=
 =?utf-8?B?OEh2VUpzMGNHbmJZb1M1dFFWWTNXaWs4cnZoWk94Smp2RTIzZVRpRlpZTUwx?=
 =?utf-8?B?Zm9SWTNGdXV4WkJRZjRIdHNwODhrY0Q5cFd3WWR6Y3dORUZkSllRcE0yYVFE?=
 =?utf-8?B?UmNnSTNtZmVZZGJ2QmFJYVBqSDBwL2IvcG5BRU1aQkk4azcxWHlJdTFLYis0?=
 =?utf-8?B?aS93VWtVTmtQVXNtK0RNNkZUdlZXUjlpU2xjNm9UQ090TXNESndIbWlNNGxF?=
 =?utf-8?B?dFAvNDBGZWJvYTY2Vnh2T1ZkVmc3amhQb2wzcFd0V0ZjUEY4K0R1SFNjSUY4?=
 =?utf-8?B?Zlg2L1Z6K0R5SnhuMUEwd3dvcjJPd0IzQTRaTGhEUXpHa2t0R05adkRpSnhY?=
 =?utf-8?B?NHdQd2VjK2YvVUNpYlpWS3gxdDJaUUQ0K0Y1YTBXNHRKNEpHQ3ZnaTV5b1Nm?=
 =?utf-8?B?MHNNMEJFSjBiVlhBenBPM0ppeUVqODVrZG5HRUcyQUlxVWs4ZnhRelM1RTVi?=
 =?utf-8?B?SWNBTlZrb1JrNUlLREVTU0JzNmpiUXI2SE1zMmlXdzN6OWRaV3VRaE5STzR0?=
 =?utf-8?B?ZnVuYWRQSGk0d0hNYjhvczFFbWxid3lJcXNMc0JBYzJaK1A4UXFEZFRTSmU4?=
 =?utf-8?B?bzBiVG15Z3lqaDlXSnUxaG5GaUdSLzVVaVJSclpUc0NkZElsRDhQU2xsYmJT?=
 =?utf-8?B?NG81aHNtNSt0Z00rTUdhcnVUQ3ppMnVWUTMveTJHT3hkeG1NemRrb1hxYUVP?=
 =?utf-8?B?LzBQRTQwb29iQ1ZIaDdyZmN3YjdXaGs2QUJkZEVZcWRJcXl1djFUeHZlajIw?=
 =?utf-8?B?ZTFZcmN4Z2IvcmxUVWVrcjA5d0Y4WWVGNmtPclIzUEFXR2FZU2dFQkJoa2RN?=
 =?utf-8?B?YS9CRXMxOFJFYVpTUzNiSFlmTDRIQmRPbEpGOHVveWRacWxOT1plbUZ6UWN6?=
 =?utf-8?B?UlIvMkFocUFhY1FJZWtOdXNDbEhGZXNxajJIQnRNU3NCSTY2azg0WW5jaExk?=
 =?utf-8?B?SGRYMGV3V1NHSklWcTdoK3hROU00OXZSZTRIYzJDcWMzK3E5TUE5YURHL2JJ?=
 =?utf-8?B?a0h3cEFrbnowVHFmNXJFOU9wemhSMjI4Q0pOY29MdjF6NFJjTFh3d2VVTDd2?=
 =?utf-8?B?NlNOenNBcGlKTG9KZEZGSjRnc0JDUWpaeGNGNkFBTGdhalQ4dEtlZFZ6WWhM?=
 =?utf-8?B?SlR3NUttQ1R6ZElHalRCWDFScjgyNVhnSldlNUx3ZEYvMUR1bE12N0oyei9Q?=
 =?utf-8?B?cWlHRlRvN0FWQ1haa25NcGZ6RW94bGt5a2xYMVdyS2pKSHRPMThxZWpscm54?=
 =?utf-8?B?SFhUYmdIUXpvTVk5VG93WlBaL3UzR0RON1VlYlZuYzZYcHJQUzFOaTFBT3d3?=
 =?utf-8?B?QTRPMW9wS25MdmN6NFp0TDBTK3dsdFAzMkFNRk16aTM1a1A2UllvTXdaT0p2?=
 =?utf-8?B?M1RVZEFrYXZ5WjIzV3U2MVZob0UrTC92UVlkN1hrZm9KOVE0TktMZ0wzNXNs?=
 =?utf-8?B?LzM3ZnRXaUo3UlRpcEhQRGpMUVVGMmt5dnpaMFM3ZWx5ZWsrbktJb3lvVmpX?=
 =?utf-8?B?Y0U2aU92T1VHNTlxblBuMXc4SXNuTHcyWGZBenV1b0JSV3dURUllYThudita?=
 =?utf-8?Q?hfKxvcoFN5ms7qjPWAlgWu1L+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0e77a8-7bb9-4a5b-6dbe-08dd7bdf39a0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 05:34:44.9178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaTgZjqXOOhgwSX9IbpDTEdxpedVt6jF/8XeUMqh246gFQthkdNeToyYTdiLFh8XlpRIZBGjyemvj5HL3c9tRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF78DCB3A49
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



On 4/11/2025 4:18 AM, Lucas De Marchi wrote:
> Like the unbind/rebind, this can be easily implemented by the
> driver_set_device() helper.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com> > ---
>   lib/igt_kmod.c | 32 +++++++++++++++++++++++++++++---
>   lib/igt_kmod.h |  2 ++
>   2 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 3f5f93f37..14b6b957a 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -598,9 +598,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>   }
>   
>   /**
> - * igt_kmod_unbind:
> - *
> - * Unbind driver from devices. Currently supports only PCI bus
> + * igt_kmod_unbind: Unbind driver from devices. Currently supports only PCI bus
>    * @mod_name: name of the module to unbind
>    * @pci_device: if provided, unbind only this device, otherwise unbind all devices
>    */
> @@ -639,6 +637,34 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>   	return 0;
>   }
>   
> +/**
> + * igt_kmod_bind: Bind driver to device
> + * @mod_name: name of the module to rebind
> + * @pci_device: device to bind
> + *
> + * Module should already be loaded
> + */
> +int igt_kmod_bind(const char *mod_name, const char *pci_device)
> +{
> +	char path[PATH_MAX];
> +	int dirlen, dirfd;
> +	int ret;
> +
> +	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
> +			  mod_name, mod_name);
> +	igt_assert(dirlen < sizeof(path));
> +
> +	dirfd = open(path, O_RDONLY | O_CLOEXEC);
> +	if (dirfd < 0)
> +		return dirfd;
> +
> +	ret = igt_sysfs_set(dirfd, "bind", pci_device);
> +
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
>   /**
>    * igt_intel_driver_unload:
>    *
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index 170a8df9d..e3a4ce671 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -37,6 +37,8 @@ int igt_kmod_load(const char *mod_name, const char *opts);
>   int igt_kmod_unload(const char *mod_name);
>   
>   int igt_kmod_unbind(const char *mod_name, const char *pci_device);
> +__attribute__((nonnull)) int igt_kmod_bind(const char *mod_name,
> +					   const char *pci_device);
>   
>   int igt_audio_driver_unload(char **whom);
>   
> 

