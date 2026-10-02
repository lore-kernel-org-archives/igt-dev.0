Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344BCCA5FD4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 11:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE18B10E45B;
	Fri,  2 Oct 2026 11:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abIn8EJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBC110E0E1
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790940860; x=1822476860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=c/KbJ2nW5XXhPt0njyJSrWNIOZBUKXjV2z8foD3aTSs=;
 b=abIn8EJURZOpeBap2sj9yLi+C/C12fk4kRIrHFOLBFznPK0dB7ovuz06
 JgodMinpJMzUmgfV8jfJNEj3gqGgNvHj/OOdggoObcEK4/zIEcjGjJzP+
 ow4GWwLpRtFaA6A3mya2bIC3ly+XlhpZIDH6ONMHvcbkB3n06WHNMlIcL
 Vf3ZT38bhLoRh7DbZLnc21MHZu9pIkw19qE2rxYUk+O+BO6ur5iRgK5C4
 PblV+xEaZKpfSlJ5/D2Ht41SalkfmshxuGvXDJzdNh3HApsPYuG5AqC1T
 hfKxD0q4EcDUxvk6EO4bo9VccprS4R84+1j9TUNS90/5EXmsqbw9cWxTZ w==;
X-CSE-ConnectionGUID: U7v/Vb3IR3S+wamYfJj7WQ==
X-CSE-MsgGUID: xkivQeK6QNWJgX77Km9NMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108084576"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="108084576"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 04:34:13 -0700
X-CSE-ConnectionGUID: ul3vbjsTTgiHKKHA8J9cXQ==
X-CSE-MsgGUID: VLuJphArSNeBkDW9BqEMkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="279489001"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 04:34:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 04:34:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 04:34:13 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 04:34:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCh3hKszJuX+rPSfx2PNm9iO42qHyouNJ8NkFwq0uv3G8zRgKoSZ2t9VAsipOlqGhZZdhdZFSkQf7xZ7wsM3ubVZUEOOijkN/5LvxT1/i+jd5j6HOHWL1EAQdegz0xeYWiUjTQmalNYsCKSn9LXSEysFBEVPny6+U5aAadAXTMbMY49pRpx03/y5u44rI1xFLY8ylLi/ppdEHmwVrXmdqMX0NrOHtwksZ/D79CMOVPaLN6QrYiSRG2pRl8sbrVKXNcdOUEZkuoUqlnlOF1Gj8rvIU0wambUO59GzCHGAGcJ6ZNLOCzruuWkIcJonCp/5zqyr5kJmLe/Yp0II+5FTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FmwlCqrAIKnKgS1L3DOvK5ue3dE8GxU1Pqi9SuOjDM=;
 b=dBYUEDRovADWkqceQHsTTUZdjY67OrdSQ7uDoYScoqnX50HKf9wUmZEP8yDV5fzGIeC86E+EMBEjOKFq9KYdVCO3Z48TpdWLSdaDuv2dmHaLMzb0zHQ0TfAtpY7R19XRiaER/mBbxrsR2oKpHHwmQkFEStcCkOt/gdJJD0l0slPpkn2v59DfZ5/kQMpGPndmTiF8qiMth+5U+WNPYVq7LU1U8xNArEFq+tZxHefwTWKxD8Cnd+zutBlMhx4FNCQ6YKuAzJkbiNDkZA4RoF9RHvt/isIzboYbtmV0oDCeoxDGkgVZ4Z6LuVyrstpXLlU2hE+RazvNWSqEeNkOgCn75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 11:34:10 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 11:34:10 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 1/4] lib/igt_pci: Add raw configuration space helpers
Date: Fri, 2 Oct 2026 13:33:53 +0200
Message-ID: <20261002113356.3652805-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
References: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0261.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::19) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9a9521-96a1-4dfb-101c-08df2079139a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|260925022911599003|260925021311599003|56012099006|260925021911599003|10067099003|18002099003|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 0zMMsW9RR4tsJ5LMKrU2T655LEPyBebMyC+ByJVqpOpVSvrEcpEmWnxgkEZZzJ6ZjW60wJGftLMII+KlqH+zXNIh9WLwVczdi592kq8k6kJ2bA1xhTewuRLz/Osj3W1WDzSCpVUXaNpf8qQeU35BXIaFPxUdE9G2LOFYnP38Tv9mlRMub3/xba0OgC4jcTuf+rDbgwV+JFA8Zlq/DYL9MOUhH29/bxcXo9lPnOArLbTjTyACa0ISMg4JIwgkVA08j5S0UNvwDS5ZCGEQjxBE2lB5aiSaacZ/arUyGoHCpuGKN/S4K4dKpcPhTs+zRxpoFvqDu38DPctD7WrRje8D7fECgH43w48FYlWa139BbITsALr9Dk5DneNLf4nxykmwurUi7rJ0N5zdrC6Km0LlPSPpD5vuELm0y3Lk2RhdbV3QMfQ2HL3aCuB02fRKU4lg9I9eZvi9L1bsxICHGx1qAMIkejtSXk03nRQX1yyO3pe/GfsX5iUJ6YmfNh+pGZKqhGfHYeW1TmmUnnr3tPafs8489FX/57CLS5+zwNShLYVqBCxv+DLfDU0saQu1RUFF0aHvJCLRwxCspE4kuJ07xiI7W/8grYgLbNGySRSEBRj6RJEIvGCdhBtFnaWQ3QUaUptcJkwtkaBBBi9jsvlf4O0orvlqmuKPr54U3WKIPQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(260925022911599003)(260925021311599003)(56012099006)(260925021911599003)(10067099003)(18002099003)(11063799006)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXY2akJGZUx1Q3c1T2ZaTEh2blFsTmI0Uzk4TzlFT3RUdmJvZ3Z5Z0VQWUZH?=
 =?utf-8?B?TCtQYmdFWXVSczh4VCtORVZXTGMrRXhOektrRlBCdTIzeGhsaldHbkNPNWwv?=
 =?utf-8?B?NnJncjk1bHB1MmZ2ZmNpMStaY1hFeDQwRU1KdDRZTTZFejhwU3pkTWRlMEhE?=
 =?utf-8?B?Nmo5QnVKbjNuTVp5eUEwRkdhcCtRNFRNL2RPSUxlTHpUaHJqMzJycTdaUCtt?=
 =?utf-8?B?eFR6N29Wb3RPQVFxOFZSbEJRSnlXM3Fha25UUmdEQnVlUDdtWGdlcGZkWjht?=
 =?utf-8?B?dEZGZmx4WEYxN0NGYURWdWtjQ2lJaU1qWEMzeHA0L20zYlN3eGhhUDhEMm9M?=
 =?utf-8?B?V3lGUnJQY0JTVWtPdFpoUUFHK1dvNGxFZ25xTjlQeGtJYnRuTmNGdk1JWjcy?=
 =?utf-8?B?b0dUL0QvWTVqL2RHUytBRkZLM3dxbXU1N3cxVHNQVjFmRUdsZyttZlVYa1JX?=
 =?utf-8?B?RnFHbVVPRG5FMkVoaVVQaTFnRWtNTXE1RlR0U2VXTWNuUnlkdWI2eExyb0V2?=
 =?utf-8?B?UHd4aWZyRldwZ1pud3NIMGdDUGp0ZnFjN2tMR3RNaVBGWHRWcXY1NElqZ2pQ?=
 =?utf-8?B?ZVFHY09GeHhEeHJ0Q2ZUNnRVRWovdkhucVI5ZzZXMjh2bkhRSi9uOEE1L2g5?=
 =?utf-8?B?SGdWdUtvU2pkVldmRE1MNnRwVGFreUlKZ05ERys3Yys3WmJWL3B1WkthdDBr?=
 =?utf-8?B?Yi9jMTR5NUFteS9rVFJzcGlIZmRGNEVtWjNMOWxiSEsydmdab0dNbWFWSVR6?=
 =?utf-8?B?ZjZ1VmwxUWc0d3lkZlBKRFN0Zm12a3ZCK2kraUlyUFJIZHozUFU0VllrSDQz?=
 =?utf-8?B?cWZoM0RrNDlKc1pOdVRxbTF2Yk1rYVh5dVBVZXBNd2sybjF5bTBMbWUyM25x?=
 =?utf-8?B?RGZwcGpLRngwQXIySkVGcnMvZTFwaGwzcWpvOU9kb205Z0V2UGhDMGQ5VTBZ?=
 =?utf-8?B?bEVxN1JKcmVTRU8xSWZPa21rZTZYamlSeGUxdllKNFJTTGtKNzFYK1RBMmZE?=
 =?utf-8?B?U3hGell5VjFaNVRkbk5FS1VTbXhhclJyNUQ0WkMyT3pZTHd1ZitvMDV0VHVh?=
 =?utf-8?B?aDJGTnNCV2JxSUlSVW9WUGNGVmdtTVFJSUNqWTlXVWtIcmYzVE0vMStxT3BX?=
 =?utf-8?B?RUpjMm5UeS9jRFhkZ3VaNG1HMVByVEcwcmVJaGJPVnoxWVdaZzBVVzlPY3R4?=
 =?utf-8?B?TEZhNFFMS3p3NHJSUkdrY1ZlZjZRZ3hudlJKNG9MeDFCWlhIclRha3lFN3RT?=
 =?utf-8?B?QVNNWDlXTitLUy9tTVNlWlh1dURFeDBIN3FZYXNuN0gxaHl4YWtmYTZLc2dy?=
 =?utf-8?B?c1FyYVlGaUxQVEpkc3QvTzlTREZLTVkxL0RrYWVRS0VBb1RNZFh2aHEydUpC?=
 =?utf-8?B?bG91dy9LV3ZDaUtEWGVUQkthWm9ReFNlRElKZWhrei9RenhjVVRBVktMUFhv?=
 =?utf-8?B?Wm8zSTNTYzY3UzBmTkhMN2EybVcxLzduUFA3cVFrTjhCYTNIeEpUNXNMd05v?=
 =?utf-8?B?SnFZTjRvQTV2ekYxaWhDSldBMXgxemRLdG4vQ0xacEl0V2NPNW9IWTNZRUtQ?=
 =?utf-8?B?TE1WUHliYUFEVXJ4cm1hdU1PWlJQYWpXV1l2ZC8vNVI2YVgyWXRlUlNBUGQ0?=
 =?utf-8?B?Q3p3Vm42NG11cmtmU3U4WjJQdGF5VU01NUxESDJyQldmTHMyU1RUNWMwSGUy?=
 =?utf-8?B?ZkU5Zm5ickVNeGZkbVh4YnBINEp0YXRTZ3FPM1A2Rng2NDBTT3Z1KzhMVXlV?=
 =?utf-8?B?a2crdVhzbWdhQUVsV041Ujh5aDAvZmJqckR3MmpPWC9CYWlCeXZHM0dtRG1N?=
 =?utf-8?B?RjY3MDBFZXh2d08rM1FsdFFKRGJlbThTYWdGWWZrdlBLKzJqQXhYZjR0V2JT?=
 =?utf-8?B?VVdrU1pEdjhjckh1L3ZvVzRkcmRST0syNWhpWC9BTHFQeUJJTmFMSThLL25U?=
 =?utf-8?B?QWliMHhIMlVxMWtibyswQ2o2djY1aWxNOTh5TSs0MHB3TjlpZk1QVWNoMHhR?=
 =?utf-8?B?VzhyckdPNkJOcWdpSzl6UmxXUkFCY2hrSGVRTGNaNERkc1NrdTRvajBKUUxw?=
 =?utf-8?B?TkdqSjhkUmpQYXZDMVBrNUcvbFdrVzNiMVhvTFowSk12bzgwbFJ4ak5iQ3hU?=
 =?utf-8?B?S1poUFlLbDltZ0JlZzhPa05mWUg4NTlCb1lxRkU1MVJBdmhQZGdQZldCbnV3?=
 =?utf-8?B?NGlDU2RMVVdKbnltdHJ4Z0RUb1dZREc0T1c0VGV6SFA2TkhYNWVwZWpLbjQz?=
 =?utf-8?B?UTBxNDJDQm9GOU5NYU0zeVVacVE0cXJDVGlRSmtYb1hhbXpDL3R5dFdrSGFY?=
 =?utf-8?B?eDNHT1VVbTFMcnFJMG9zNi81WUNleXd1R2FNS0lGd3lPMzlYcmRvallmUVcr?=
 =?utf-8?Q?9hMUYUPYNtpNfz3M=3D?=
X-Exchange-RoutingPolicyChecked: TjzS4SMBumINpunWkQ+SgP6vQ94jtpeqiE2Y6gFSOQfWe2Y6iKeft096PZPble7qooj4ade/OTivXnu0FtHi1sZB5GwPtu25UiOGIC6uYoGl5AcYPOB8zy98iRYcUNy85MTMqlaE+LDcCT4zflCEFFBkNf+DJjBY6aLMsiepxXGJunShwmevgVbW7k3UFqnT7lcFzuKp+GtRUFupuQfMQ7CjglM/rGBUV6F4+fxJjhX4KICrQDJogzaM9ZGEn5kCrjkZoEkau9myWRpVo56gCsopyFcpJKP1vxKQaR1zke4WfWnPDqxYVrv7jNNyg2DiU+5uZ59zLCvGMFqvLCeiWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9a9521-96a1-4dfb-101c-08df2079139a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:34:10.4459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sR0Mvz9HtHJDJHWo28feDX/Jh3u1dBSIYUBiRZVAIt/oS7ubVw19a4pR1rvRay8FtkFdPVKz/RO9H2Qt95aTF2uOaSDGuxGwXWmzkjU/kR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add helpers to read raw PCI configuration space from sysfs and access
its contents.
Provide little-endian u16/u32 readers and standard and extended
capability lookup helpers for configuration-space buffers.

v2:
- Validate malformed and cyclic capability chains.
- Add unit tests for capability lookup and malformed chains.

v3:
- Share the capability list walk between the pciaccess and raw helpers.
- Mask reserved low bits of capability pointers instead of rejecting them.
- Stop the extended capability walk on an all-ones header.
- Rename the capability list start parameter to cap_ptr.
- Document the remaining raw configuration space helpers.
- Use PCI_CFG_SPACE_EXP_SIZE from linux/pci_regs.h.

v4:
- Add igt_pci_regs.h with the required PCI register definitions instead
  of relying on linux/pci_regs.h, which may be too old on some
  distributions.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GitHub Copilot:GPT-5.6 Luna
---
 lib/igt_pci.c         | 191 +++++++++++++++++++++++++++++++++++++-----
 lib/igt_pci.h         |   7 +-
 lib/igt_pci_regs.h    |  17 ++++
 lib/tests/igt_pci.c   |  76 +++++++++++++++++
 lib/tests/meson.build |   1 +
 5 files changed, 272 insertions(+), 20 deletions(-)
 create mode 100644 lib/igt_pci_regs.h
 create mode 100644 lib/tests/igt_pci.c

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
index b63550b390..2fb54bda5a 100644
--- a/lib/igt_pci.c
+++ b/lib/igt_pci.c
@@ -14,37 +14,74 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_pci.h"
+#include "igt_pci_regs.h"
 #include "igt_sysfs.h"
 
-static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
-				  int start_offset)
-{
-	uint8_t offset = 0xff;
-	uint16_t cap_header = 0xffff;
-	int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE)
-			/ sizeof(cap_header);
+typedef int (*pci_cap_read_u16_fn)(void *ctx, unsigned int offset, uint16_t *val);
 
-	if (pci_device_cfg_read_u8(dev, &offset, start_offset))
-		return -1;
+/*
+ * Walk the standard capability list starting at @cap_ptr, the value of the
+ * capability pointer (e.g. read from PCI_CAPS_START). Returns the offset of
+ * the capability with @cap_id (any capability if 0), 0 if not found, or a
+ * negative errno: -EIO on read failure, -ENODEV if config space is
+ * inaccessible (reads back as 0xff), -EINVAL if a pointer points into the
+ * header, -ELOOP if the list doesn't terminate.
+ */
+static int pci_cap_walk(uint8_t cap_ptr, uint8_t cap_id,
+			pci_cap_read_u16_fn read_u16, void *ctx)
+{
+	int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE) / sizeof(uint16_t);
 
 	while (loop--) {
-		igt_assert_f(offset != 0xff, "pci config space inaccessible\n");
+		uint16_t cap_header;
 
-		if (offset < PCI_TYPE0_1_HEADER_SIZE)
-			break;
+		if (!cap_ptr)
+			return 0;
 
-		if (pci_device_cfg_read_u16(dev, &cap_header, (offset & 0xFC)))
-			return -1;
+		if (cap_ptr == 0xff)
+			return -ENODEV;
 
-		if (!cap_id || cap_id == (cap_header & 0xFF))
-			return offset;
+		if (cap_ptr < PCI_TYPE0_1_HEADER_SIZE)
+			return -EINVAL;
+
+		/* The two low bits of capability pointers are reserved */
+		cap_ptr &= 0xfc;
+
+		if (read_u16(ctx, cap_ptr, &cap_header))
+			return -EIO;
 
-		offset = cap_header >> 8;
+		if (!cap_id || cap_id == (cap_header & 0xff))
+			return cap_ptr;
+
+		cap_ptr = cap_header >> 8;
 	}
 
-	igt_fail_on_f(loop <= 0 && offset, "pci capability offset doesn't terminate\n");
+	return cap_ptr ? -ELOOP : 0;
+}
 
-	return 0;
+static int pciaccess_read_u16(void *ctx, unsigned int offset, uint16_t *val)
+{
+	return pci_device_cfg_read_u16(ctx, val, offset);
+}
+
+static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
+				  int start_offset)
+{
+	uint8_t cap_ptr;
+	int ret;
+
+	if (pci_device_cfg_read_u8(dev, &cap_ptr, start_offset))
+		return -1;
+
+	ret = pci_cap_walk(cap_ptr, cap_id, pciaccess_read_u16, dev);
+	igt_assert_f(ret != -ENODEV, "pci config space inaccessible\n");
+	igt_fail_on_f(ret == -ELOOP, "pci capability offset doesn't terminate\n");
+
+	/* A pointer into the header has always terminated the list here */
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret == -EIO ? -1 : ret;
 }
 
 /**
@@ -61,6 +98,122 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
 	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
 }
 
+/**
+ * igt_pci_config_raw_read:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ * @buffer: destination buffer
+ * @length: number of configuration-space bytes to read
+ *
+ * Read raw PCI configuration space through the device sysfs config attribute.
+ *
+ * Returns 0 on success, otherwise a negative errno-like value.
+ */
+int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length)
+{
+	char path[PATH_MAX];
+	ssize_t ret;
+	int err;
+	int fd;
+
+	if (!pci_slot || !buffer || !length)
+		return -EINVAL;
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/config", pci_slot);
+	fd = open(path, O_RDONLY | O_CLOEXEC);
+	if (fd < 0)
+		return -errno;
+
+	ret = pread(fd, buffer, length, 0);
+	err = errno;
+	close(fd);
+	if (ret < 0)
+		return -err;
+
+	return (size_t)ret == length ? 0 : -EIO;
+}
+
+/**
+ * igt_pci_config_raw_read_u16:
+ * @config: raw configuration space buffer
+ * @offset: byte offset within @config
+ *
+ * Returns the little-endian 16-bit value at @offset.
+ */
+uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset)
+{
+	return config[offset] | (config[offset + 1] << 8);
+}
+
+/**
+ * igt_pci_config_raw_read_u32:
+ * @config: raw configuration space buffer
+ * @offset: byte offset within @config
+ *
+ * Returns the little-endian 32-bit value at @offset.
+ */
+uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset)
+{
+	return igt_pci_config_raw_read_u16(config, offset) |
+	       ((uint32_t)igt_pci_config_raw_read_u16(config, offset + 2) << 16);
+}
+
+static int raw_read_u16(void *ctx, unsigned int offset, uint16_t *val)
+{
+	*val = igt_pci_config_raw_read_u16(ctx, offset);
+
+	return 0;
+}
+
+/**
+ * igt_pci_config_raw_find_cap_offset:
+ * @config: raw configuration space, at least PCI_CFG_SPACE_SIZE bytes
+ * @cap_id: searched standard capability id
+ *
+ * Returns the capability offset, 0 if not found, -ENODEV if config space
+ * is inaccessible, -EINVAL if the capability list points into the header or
+ * -ELOOP if the capability list doesn't terminate.
+ */
+int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id)
+{
+	return pci_cap_walk(config[PCI_CAPS_START], cap_id, raw_read_u16,
+			    (void *)config);
+}
+
+/**
+ * igt_pci_config_raw_find_ext_cap_offset:
+ * @config: raw configuration space, at least PCI_CFG_SPACE_EXP_SIZE bytes
+ * @cap_id: searched extended capability id
+ *
+ * Returns the extended capability offset, 0 if not found or the extended
+ * configuration space is not accessible, -EINVAL if the list points outside
+ * the extended configuration space or -ELOOP if it doesn't terminate.
+ */
+int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id)
+{
+	unsigned int offset = PCI_EXT_CAPS_START;
+	unsigned int loop = (PCI_CFG_SPACE_EXP_SIZE - offset) / 4;
+
+	while (loop) {
+		uint32_t header = igt_pci_config_raw_read_u32(config, offset);
+
+		loop--;
+
+		/* All ones: extended config space is not accessible */
+		if (!header || header == 0xffffffff)
+			return 0;
+		if ((header & 0xffff) == cap_id)
+			return offset;
+
+		offset = (header >> 20) & 0xffc;
+		if (!offset)
+			return 0;
+		if (offset < PCI_EXT_CAPS_START)
+			return -EINVAL;
+	}
+
+	return -ELOOP;
+}
+
 static int open_pci_driver_dir(const char *driver)
 {
 	char path[PATH_MAX];
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 509345b2d8..d7d6f96832 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -15,7 +15,7 @@ struct pci_device;
 
 #define PCI_TYPE0_1_HEADER_SIZE 0x40
 #define PCI_CAPS_START 0x34
-#define PCI_CFG_SPACE_SIZE 0x100
+#define PCI_EXT_CAPS_START 0x100
 
 enum pci_cap_id {
 	PCI_EXPRESS_CAP_ID = 0x10
@@ -27,6 +27,11 @@ enum pci_cap_id {
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
+int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length);
+uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset);
+uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset);
+int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id);
+int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id);
 int igt_pci_device_unbind(const char *pci_slot);
 int igt_pci_driver_bind(const char *driver, const char *pci_slot);
 int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
diff --git a/lib/igt_pci_regs.h b/lib/igt_pci_regs.h
new file mode 100644
index 0000000000..5d6fece776
--- /dev/null
+++ b/lib/igt_pci_regs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __IGT_PCI_REGS_H__
+#define __IGT_PCI_REGS_H__
+
+/*
+ * PCI register definitions, following <linux/pci_regs.h> naming and values.
+ * Defined here as the system header may be too old to provide all of them.
+ */
+
+#define PCI_CFG_SPACE_SIZE	256
+#define PCI_CFG_SPACE_EXP_SIZE	4096
+
+#endif /* __IGT_PCI_REGS_H__ */
diff --git a/lib/tests/igt_pci.c b/lib/tests/igt_pci.c
new file mode 100644
index 0000000000..52092eecb9
--- /dev/null
+++ b/lib/tests/igt_pci.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <stdint.h>
+#include <string.h>
+
+#include "igt_core.h"
+#include "igt_pci.h"
+#include "igt_pci_regs.h"
+
+static void write_u32(uint8_t *config, unsigned int offset, uint32_t value)
+{
+	config[offset] = value;
+	config[offset + 1] = value >> 8;
+	config[offset + 2] = value >> 16;
+	config[offset + 3] = value >> 24;
+}
+
+static void test_cap(void)
+{
+	uint8_t config[PCI_CFG_SPACE_SIZE] = {};
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
+	config[PCI_TYPE0_1_HEADER_SIZE] = 0xaa;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa),
+		      PCI_TYPE0_1_HEADER_SIZE);
+
+	config[PCI_CAPS_START] = 0xff;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -ENODEV);
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE - 4;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -EINVAL);
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE | 3;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa),
+		      PCI_TYPE0_1_HEADER_SIZE);
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
+	config[PCI_TYPE0_1_HEADER_SIZE] = 0xbb;
+	config[PCI_TYPE0_1_HEADER_SIZE + 1] = PCI_TYPE0_1_HEADER_SIZE;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -ELOOP);
+}
+
+static void test_ext_cap(void)
+{
+	uint8_t config[PCI_CFG_SPACE_EXP_SIZE] = {};
+	unsigned int offset;
+
+	write_u32(config, PCI_EXT_CAPS_START, 0xaa);
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa),
+		      PCI_EXT_CAPS_START);
+
+	write_u32(config, PCI_EXT_CAPS_START,
+		  0xbb | (PCI_EXT_CAPS_START << 20));
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), -ELOOP);
+
+	memset(config, 0xff, sizeof(config));
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), 0);
+
+	memset(config, 0, sizeof(config));
+	for (offset = PCI_EXT_CAPS_START;
+	     offset < PCI_CFG_SPACE_EXP_SIZE - sizeof(uint32_t);
+	     offset += sizeof(uint32_t))
+		write_u32(config, offset, 0xbb | ((offset + sizeof(uint32_t)) << 20));
+
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), 0);
+}
+
+int igt_simple_main()
+{
+	test_cap();
+	test_ext_cap();
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index f1db66d07c..0a7c903f16 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -19,6 +19,7 @@ lib_tests = [
 	'igt_invalid_subtest_name',
 	'igt_nesting',
 	'igt_no_exit',
+	'igt_pci',
 	'igt_runnercomms_packets',
 	'igt_segfault',
 	'igt_simulation',
-- 
2.34.1

