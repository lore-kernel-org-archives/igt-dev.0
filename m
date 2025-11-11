Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B364CCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 08:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7252810E137;
	Tue, 11 Nov 2025 08:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5coWmO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA33910E137
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762849250; x=1794385250;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=egdE17HtdngcN6cTmU4j5kiLFm6rlKJMrQ/VtUdIAOU=;
 b=m5coWmO4J37K87GNdJoJL0Y6AqPNCw/2QwxO20lV7JuA+2c7iPibB0Ys
 AGCq4zsAZha45E1vPmAY7ZKjVejbFrFLaf60gqiBIII1NF1tYf6f8SLhV
 OWYKgNEbS4m9btxy7PyEjhCul19NRJ2q5WGxuiuzFfUPp+26DqtkdvCnO
 QdwBDd+u2+Vf8Um1ozrVVk+N5F5uLE3HBfiAxpdIC9AGj0Itm8BP1AES8
 N4LespJmyNlrkQouELFXRoVJYpSAcUJPVVDsLq/h3jlYnEJ/AT/JpmXMR
 D3mEqpNRLsmmt/r45z69aZXU9XSHkhynMN1k1evGqC6BIhmak4sSeVl9e Q==;
X-CSE-ConnectionGUID: 2+g3zvKNTgC7wPXRT7T+pA==
X-CSE-MsgGUID: l7WfTnyLSzOwiqwpgTx1FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64611468"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64611468"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:20:40 -0800
X-CSE-ConnectionGUID: /5rsxfiRQLyhxDC4NeXNvw==
X-CSE-MsgGUID: A+xi/nX/RbWyNn+/GtoTPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188164992"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:20:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:20:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 00:20:39 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:20:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOwgWbna3ja2YxyJ4mlMX9EySd1Z236Lmht3wPHd7w5RnUoXSFnkZS8bJGltRlecopJzQqGxpwtuzneUbNywiA2/JMe5XDeLDTCSqlIZld0fhHtoM3jHQucaaI4W7ufyNJyh4XQqv0HhU6n/LCcNb3vr3v2Ui9HuYpiXIqDt44izjW5BzqR/JyNZsxZ4KM65JdHpFbHutcDRi6qPEdAv1OeETRCdet0Zwaz8A+u3Y6+W+jRDceTWHX4NponhFToC3iKKIsGuVwIuNUMinp+Yjr80H0XwVLmQyc3XlOu8dZ0dDNQ29z4RITGPNM+oIW5eUXiXh1fkd8fy08NZKJQ9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec+OKW+pOz/mS3AfVRGNrRzlLln6VnbrMks8Y91zROM=;
 b=i03H0irkPA0PGL0HpCyMcZOD7IojLTnmY9az/YnnZWzfQUsVALTTjBq0hIifx3inIvTKtCNtz8Ov76P8hNSOOVsA+tZ03C6AWEPErgkcgVsq7z8WMINbizDLBKAXx4aw8ejVsy0WNfoBpySP3CE4Ryzqizv14PPZEBxDtlAUCpW4mv5ZXd/2p/gIp0YXVDZ++VVRIpCo6Wot5eunQLAz+QFtKNGoe96e4tju+HInnXrE5bltEqZhOGdYp1aXisJG9Jz+qd/rnc5V4DJJQJBJZ7kNnWbqlreuMz0HirZ+PLzSMbKLD3IrKTNPDEGUoALSP0EvsvAdEZmPPFkQtEU47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA3PR11MB9398.namprd11.prod.outlook.com (2603:10b6:208:576::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 08:20:37 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 08:20:37 +0000
Date: Tue, 11 Nov 2025 13:50:31 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] xe_exercise_blt: Insert a flush between two
 consecutive FAST_COPY
Message-ID: <aRLxzz6m61ALksZT@bvivekan-mobl1>
References: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
 <20251110135805.3620715-4-balasubramani.vivekanandan@intel.com>
 <20251111004004.GN3905809@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251111004004.GN3905809@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA3PR11MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cebb3e1-728d-4f8c-251f-08de20fb3152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDM0Y2k4c1ZlbUgzb1AyNGZxL1hJMWJCYS9QZGlYNWRWRzdYYm9LV0Vld1h0?=
 =?utf-8?B?NUlHbGdIMEpjRXhTK01RUGdVTzlyVE13Z2tXNnBuVDIwRVF4alNxYWlqbXZp?=
 =?utf-8?B?UUNlRko3RGFDejVmQmNEYk9Yb3Fsb3JOTkU5bklBMmlmWHN3aDNLWEx1Z2tw?=
 =?utf-8?B?a052eldXMk5tcHQ3dGQvdytWM1Jia2p0enZUeGQrSkNFUXNLcDZleWJjVGxq?=
 =?utf-8?B?bmNqbFQ5amRwR2ZQV0Y4azNEdklqZ29jdE5PVlF2YmhXTm9LU3Bxb0hoVG9m?=
 =?utf-8?B?WXNDbEtuK0pIYTVROXNDRy84c1JWemttaEZ6TXVGaGNpSW80RFpycXlVbVlx?=
 =?utf-8?B?YkhZNmN5MkZaWFhDT1A5VmVGRGZIbGNYVXBVS21MbnVnR2g2NExrLzllbHlX?=
 =?utf-8?B?TGc4NlFsTDJHSmZoVmI1WjB6Q0kwVDlUZGVXMmRiMVpESndwSnVYV0tnRU5m?=
 =?utf-8?B?UmQ0aktLcHFaT2tVMG1NeW51V2RZNEpJMU52M2NQd0Z0dzJDRU5ZSDZwT2JH?=
 =?utf-8?B?S0ZsVnoyNmJCSWw5NlJ0M2xoMk5LRjI4dDlPNXppdUJPZVRvVlRzTk9rb3FW?=
 =?utf-8?B?VHd5dGNpZGtNaXdNSXBqQjV2SFJ1SS9aZzVSQnhuNkJJOFYrVTRyRGo5ZGpP?=
 =?utf-8?B?MElPeWtHWXRLbXBqQndwVDZ3R3RxblFqRWtDMVNVWUhjeUREU3BHa3hBU0hq?=
 =?utf-8?B?YUpjYUVjVzFCeDdIM0dLa2c2NlJBRFJsQzBHR0lHd0kzVWRQUXZVZ0dlaitT?=
 =?utf-8?B?SlJueXMwZFIweno2ZVlvSEJpR0c0bWFYaklGelZaVmt5RjQ3Z1FiYjVtbkpN?=
 =?utf-8?B?dDJnQkRxY3BVV3dVVU1nV3J4ZXJxNWxQMHlNNlNOWGNsTWxsT2RMYWJwZUJC?=
 =?utf-8?B?Y2RTc3ExRGRRa3lqTHRoUnVBdTNIMW1FcjZmQVpzTlN4Zk1ScUhrOXJOOU1R?=
 =?utf-8?B?d2FibWFxZnpwcVJJRFQwZzRzQVVjMHNwdEIxOEs0a2RhOU5relI1R1NNZlRl?=
 =?utf-8?B?WktIdUNHVkVoVnFIdmFYVldxMGQ5RHIzSzNJTVJBS09FSU1UODZhZ2h1OWJw?=
 =?utf-8?B?QytFSHl4WGdlaDUzcFR5RXBXWS9IdCt2ZVd1a3l6OWFmaW9ISTFkRGVpYkpM?=
 =?utf-8?B?ajNjdnJFakhOMVQrNEpRWjUvTHgrS2VnaThyWlVLWkVna0FadWcvSm95R0th?=
 =?utf-8?B?VFlYSlFQQXh4VnI2Sk0rVkVWMDc4c3FBQ2Q1ZzdqOXp3d3ZKQ0JSVUlVTGlm?=
 =?utf-8?B?STBVZjVoRTRJRG85SFJHZXVta2JrUlhUV0NxZldQUXlDaXNLY0U1ZTUvbk1h?=
 =?utf-8?B?YUoyeHp1VEZMWFBRbWxiRXByenNnUzNnVlg1OEpYNndkcVg2c3dqaENYeTNi?=
 =?utf-8?B?aHJnOEVuWjRHV1FwdWlKM3I0VFprSEJIb1lXcXNqM0ZyZU9GR3gxdnRJQTIr?=
 =?utf-8?B?UnppbkNjWXN3OFVMaThrTU84aG9UZ003eTFiZ0o1enlFcWI0S05YK0xXaHQx?=
 =?utf-8?B?WkdZL3ZuOEw3RHgwd2pwT2R5dWhMM2F3N3lCNnRPQnVTdzd5aTdaeU5OeDlm?=
 =?utf-8?B?UnBPUk55Z2kzNW4wMVlaYjE3dTZibXZmWmRWRkJEb1A4c3UxMHgyMTZpZVZo?=
 =?utf-8?B?UUI2SWtVeUF1N2p6dk1IZ0VPU0JSWGFKWEFVSlBmVnZBYUpIY0l3VFdrS1cv?=
 =?utf-8?B?ZVFJa3ppdjlXRjR4aThYTlJDVUVRUjlzc3UxTWhzMTFBeG85bGJHQTZXZmhR?=
 =?utf-8?B?aVM0YVJ3MU5FYkFHMkRqSlE0dVhFMUlKREFLOUtQbGJWaEFuVWFTbXJUWHhX?=
 =?utf-8?B?Z0tRMVFaZkhzME95YjZVMDVrK3RWZ1c3UGJzNHRRdjBwRnFLdWFqNWR6M25D?=
 =?utf-8?B?aWRjU2s1TXh2WlFNSGV1amJVdk55djFuSGw5RFJ6blJkem5xbU14SmZ5VFBm?=
 =?utf-8?Q?VcpB3NS1oOc3TwJPvoksAqiORiw0r1Kv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azJPbnJEQWhaVjJlRmxucGdrUjNCdWJjSm5QTEdmWngrQTJQS3NrUUw1R1Bi?=
 =?utf-8?B?Z2hSanRGTVBDejZNbkV2VHV6TkQ3NkhGZGovTE5LbUJtQnFOekprbXRTcFVh?=
 =?utf-8?B?RmhmTG9rR0RMRnU3d044QmVnWTA5cUtZSGc5MllHVmlabjhSZkNiMVFEZ1dv?=
 =?utf-8?B?TEM2T2hqY2FkNnhHNmFvdXhYcW1EQVJaUFRUdkVSVm1LTlpPYjFCN2JIb3JK?=
 =?utf-8?B?eDdvVmNNMkMrOGxKaVhvY1dCU0Ixd1dnWDNXdnZOWHJ3cXh1VXl2Ump4ODFt?=
 =?utf-8?B?MmpjSTFGeUNKa1dDbW4xYzA2NkVnaWlWMEg0YmhGRUdRVGVVL3U4WDg3UHE2?=
 =?utf-8?B?b1RKd0o2NFZWMEtQbWhxaEljMHRyd0FmckhmM3BNR1VtVU1Nck03bk9OakxZ?=
 =?utf-8?B?Qld2dWFidFJrMTFCcnBTSElCL2tKdGc1b0FxRzU4aG4yNHN5TDBnbGpuVk1X?=
 =?utf-8?B?dnhobkZnd3hncGozbkRmaWlLY2I0R0tNMlA3WGF4bGhVeFZEM1dBTUgyTG42?=
 =?utf-8?B?QUsrSWZNNzBXWWlVWG0vVnk5MDU4dWZLMEhucTB5ajBpQUtsaFJhUFFHT25i?=
 =?utf-8?B?d2NzVW1TTUZzS3RNWTExV1A3d3RRY2hVZTdEMDBkS0pTOXNpNzZwK090YkR6?=
 =?utf-8?B?Q3g0YU1OdGRheDdyQmlmNytNVlZDYnNtaHFlQTNjMm95RHQxUDE5ZmsrREtP?=
 =?utf-8?B?TTlraXBSQzZPdStUdjdMdllnRG10aUY4L1NhbzZmelRrNDZPTDZ4Sm5UbGZI?=
 =?utf-8?B?aFJTamQxc3E1bFBpSS92QXhnZGRqNkNYaE1wY3pySXBsNlh5NWxVRXUwYmsr?=
 =?utf-8?B?M0dNQ21sN21WMlJZc2c4d2kvZEo2MXFRbHgrZks0dEUwQ0tEWHRucmJiSDZ6?=
 =?utf-8?B?bm5lYXN5UDN6WG9ScEJtRmhoVm1SZ3RLZWlTS3lMMVdBZFRtbzhDS09ySlZl?=
 =?utf-8?B?RHVKQ3QyN1hsY3BmUzVVdHFGalQyejJzSmVWMCsxK1Fhd3k1ZXJOWFdmRmc3?=
 =?utf-8?B?OHlVZGZuNU5rRnkxeStnSUorT1RjeFpLYWRqdzB1Y1l2L1QyYktrZVlJc0gy?=
 =?utf-8?B?MFIrdStIT2RFcW9OMHFHYXFjQUZ5MCtjMEdUZU9ROWswVWJvbVFrVDlWRjY4?=
 =?utf-8?B?YVhGZjQ2MHU4RjRXM093N1J1elBKSjgyN0hSZmlKVS9ZODlOWjYvSkFDQ2cv?=
 =?utf-8?B?RzNHUTRYL0RGYWN5OCtCRUFpYjNuVHg5WmU0MUhTeGZab0pkejFIMmdwWlF6?=
 =?utf-8?B?bUpDTS83RXlMY1VFbHd2ckFKV3lTRDVZV2Yyb2puQTVGU0dDSm0xMGpwRmFG?=
 =?utf-8?B?RkRldU9lK3RyRHhVaUR2RzBRbTV6YzZvN0tVK0NTMEVGSFAzeXAwak45VTNw?=
 =?utf-8?B?UWxKNTBlME1haURYS0NJMmdwbFZudW5SSnJQYThuaEk0ZnBYRXpPTEJWMUNh?=
 =?utf-8?B?NlU5MXVKRHphUVNVdWd0eUg3UzluenRvQ25YVE1kQVVXZTZNb09FOTdOTVF2?=
 =?utf-8?B?MWhKM0prcnZ4OTdkZGIvMFYvcVdKNE5YeDlEelhwYzN4V1VMQmxNZzFhaDRn?=
 =?utf-8?B?K09JRHFrc0hmVzlYK09vVXpLajIwa1l3djJXeHZWUkFoTERENC95YU5IMEJI?=
 =?utf-8?B?YzcwNC9WeitXdG5TbHZzNW04RjZnV2NzUWs2cDBPd2ZXcW94aXZkeURZWUVU?=
 =?utf-8?B?eDZQUnhzZ3Z1VStaRll4SU40Z0VNVGRHTHN0M0FFcE12Qy9GbU9HOGs2aTRD?=
 =?utf-8?B?K3c4dng2d2s3cDc5Q2FQWHk2RzdYSWFVaklqa0l3NUFjMmtodHVoSVJLYkE1?=
 =?utf-8?B?ak5Fd3M0ckFMSzcrb0JTVEREZzF6dDhxdXlJUllwOFQ5Ymx4QkRDeDF6c2s4?=
 =?utf-8?B?V0ZQT2VYNy9WTUozRitENXJkQmk0NVl1bElRQlBqN0xXa1R0NW1XY3Z4S2la?=
 =?utf-8?B?VHk0cXZEMUhGVDFqYWFWVnZpdE5kMG5qZWRjblVIN0lObW5WVXovZHRGRTd4?=
 =?utf-8?B?WnZLcE9HZlUrd1hKbVJha3BTSmYrMTI4aHo0Q1JlVHd0UmowcWt5cUtzUExm?=
 =?utf-8?B?TDR2YUFGd0drUWlrQVd0UVN3djZtSjB5cjVLQjlmZmR5NnhkanhsWjg5OHRv?=
 =?utf-8?B?c0pmd2JaVFVJVTUxd1FrMmc1NUdKRjdYaVorRGw0R2F3K2xOaTMzVHFrM2hr?=
 =?utf-8?Q?Dzd29KpOaah8+7XuXKUKZ5s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cebb3e1-728d-4f8c-251f-08de20fb3152
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 08:20:37.0631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcgBCy0lhPzQ1mBkagzyIYZDh8YAAvaOrh9e6B5oayBmOZkzCKr+C1P9I1/+5UDe9NGq/c4SN7dnolX8qmqnXgTeTzYo6WdqUoy1lsM5X3loKOmLWbN57BqT7ZozF9AL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9398
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

On 10.11.2025 16:40, Matt Roper wrote:
> On Mon, Nov 10, 2025 at 07:28:07PM +0530, Balasubramani Vivekanandan wrote:
> > As per the spec, a flush is required between two dependent BLT
> > instructions. In fast-copy-emit, the source of the second BLT
> > instruction was the destination of the previous BLT instuction.
> > Therefore a flush is required between them.
> 
> So this is effectively a read-after-write (RAW) hazard, right?

Yes.
Will fix the rest of the review comments in the upcoming revision.

Regards,
Bala

> 
> > 
> > Bpsec: 57567,57555
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  include/intel_gpu_commands.h  |  4 ++++
> >  tests/intel/xe_exercise_blt.c | 14 ++++++++++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> > index cd281ba89..f6d367442 100644
> > --- a/include/intel_gpu_commands.h
> > +++ b/include/intel_gpu_commands.h
> > @@ -445,6 +445,10 @@
> >  
> >  #define XE2_STATE_SIP \
> >  	((0x3 << 29) | (0x0 << 27) | (0x1 << 24) | (0x1 << 17))
> > +
> > +#define XE2_MI_FLUSH_DW		(0x26 << 23)
> > +#define   FLUSH_LEN_DW		(2)
> > +#define   FLUSH_LEN_QW		(3)
> 
> This isn't really for Xe2; according to bspec 6997, MI_FLUSH_DW switched
> from taking a 32-bit address to a 64-bit address (and thus the size of
> the instruction increased by one) all the way back in gen8 (BDW).
> 
> We should either make this something like MI_FLUSH_DW_GEN8, or just use
> "MI_FLUSH_DW_CMD | 2" down below like other spots in IGT already do.  If
> the former, we should also use MI_INSTR rather than an open-coded shift.
> 
> >  /*
> >   * Used to convert any address to canonical form.
> >   * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
> > diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> > index a545654d3..06a2eedca 100644
> > --- a/tests/intel/xe_exercise_blt.c
> > +++ b/tests/intel/xe_exercise_blt.c
> > @@ -86,6 +86,7 @@ static int fast_copy_one_bb(int xe,
> >  	uint64_t bb_offset, alignment;
> >  	uint64_t bb_pos = 0;
> >  	int ret = 0;
> > +	uint32_t *bb;
> >  
> >  	alignment = xe_get_default_alignment(xe);
> >  
> > @@ -103,6 +104,19 @@ static int fast_copy_one_bb(int xe,
> >  	blt_tmp.print_bb = blt->print_bb;
> >  	bb_pos = emit_blt_fast_copy(xe, ahnd, &blt_tmp, bb_pos, false);
> >  
> > +	bb = xe_bo_map(xe, blt->bb.handle, blt->bb.size);
> > +	/*
> > +	 * Bspec asks to insert a flush between two BLIT instructions to resolve
> > +	 * BLIT level dependency. Though the spec is not clear in explaining
> > +	 * it, HW team requested for a flush instuction between these two BLIT
> > +	 * instuctions as they have a dependency.
> > +	 */
> > +	bb[bb_pos++] = XE2_MI_FLUSH_DW | FLUSH_LEN_DW;
> > +	bb[bb_pos++] = 0;
> > +	bb[bb_pos++] = 0;
> > +	bb[bb_pos++] = 0;
> > +	munmap(bb, blt->bb.size);
> 
> This feels like a general facility that should probably be an emit_*()
> instruction somewhere like lib/intel_blt.c so that it can be used in any
> test that needs it.
> 
> 
> Matt
> 
> > +
> >  	/* Second blit */
> >  	blt_copy_init(xe, &blt_tmp);
> >  	blt_tmp.src = blt->mid;
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
