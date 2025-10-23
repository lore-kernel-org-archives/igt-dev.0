Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57859CCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 13:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E558A10E0EA;
	Thu, 23 Oct 2025 13:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dubLNVCS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9CB10E0EA
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761225683; x=1792761683;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=3Pgo6YWEPIJ+8An6JzChqFtc0460NMxu+55sAwJYvyY=;
 b=dubLNVCSt/eVoosmKnYOL/vZLgmso0RmF18rs44fG7FJm84MiADLQ03D
 11PEZoTKkH/Dh78t6HHVhWeXYxSJTJ1JTM030aJUPcerf8bB9iMJQDg34
 35nmya4l5OdotKRBzEMzTOz8lmcFMrn+IZWQpMZbH0TTNDad0xq+9R/GG
 DpskoU3JAK2oAEr7g7SUDfBD9wJ/ibZcIROAdskfhVdO9uwr4b1FRs0XI
 fx6uqSCg9TKFfd3uxVxh0bhx4XaHYPkUw5U3NZ0HfxX+rmUZD0VTipbAO
 MmjVSUehXGuTA85WyXM6U1LtCJjtKgbjn7wLsot4o4n6R2vkR/RC3YxfT A==;
X-CSE-ConnectionGUID: zhbWe37LRo6RTZWNZpKp4w==
X-CSE-MsgGUID: qi160SwuR+27BKJzr1uvSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86021362"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="86021362"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:21:23 -0700
X-CSE-ConnectionGUID: d+l7ntTAR0erL8ihvgKwEg==
X-CSE-MsgGUID: P6Du6pEESRaUHzjW24m/Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184083990"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:21:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:21:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 06:21:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiQsFCTO+oInp+/8FHMWEyeRAfjPSZITL907QEVxl20escPuVqh/OkgMGT2nZxBh9gaI6nLCKzR43g4N1RTIGmqPvpJ3L9n18exmAe/HdfWmYWrwi263fQ9HA8h6XtHe9np7o8FhnxKqIXeHLNLGdsKCzDcfVHfL3eMz0Q85C3d4UpnDutBzibL8pVC2yvezZzhgS8sDDkCUla2OX6DWy/sNhgKjIEz2AbQmWiMFdnfydsaTnHY3z8Nskoxt7ZPMNJrEA/xJBzDAnY1U8DpB6f75oZ6fC/UxnW/Yue02NXp/lja6UZRZA656nKxgkhx3FrQxxFtcW64h31ZffeJ+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbhqjo7kBETv38nIj+H2z13zvPx/kLQCPd68dDhQTRE=;
 b=GEQ/9usI3t7dhsmXF5XXaZN2UCLQEjmFt1bU2xh/13rNevMWNBwCLyLuLPeVRT7AXOjRZ4/r9c66mKgh6en/Pyu/0Yq1YAHWy0yXBvVnf3LVHl7eEr9W8A6VcUOHTaydHAwNKcfsu61tqooLJiDV/pk7hLuI2jsOgRfZCi4j7hJLODTBZNx+4LrqvNcvmbXnpLVhjclisIifq91Z92918u9DqHAIC92AwFQb4wZ/1KdKhSwt8GehqByxRt33UhHff2WAGLn3Dc7gCElXUM1sGkwTVDFqkBlybRMZNwsorwFxXOSGR0KjRM+yo+2KgtDSSTzNZ/Oc2+uJ6VNgWVg2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:21:14 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:21:14 +0000
Date: Thu, 23 Oct 2025 13:21:08 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, <dmitry.v.rogozhkin@intel.com>,
 <sebastian.brzezinka@intel.com>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <dmitry.v.rogozhkin@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 0/3] intel_gpu_top: Usability improvements
Message-ID: <cover.1761225010.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DUZPR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::9) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 5febad27-0d3e-41d6-bb68-08de12370a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzZLS1hYQVNpRCtNdk8ybmFpSm9TTDExeTRzR2YycWIwa1ZpQnpxRTN3bG5H?=
 =?utf-8?B?ODM3MmR5cEpwK2lQWUtyeVQvZ01tczc0a0QvL2hjeVUxdkRJRExuM1N1TVl3?=
 =?utf-8?B?Ti9sTTBVMElxOGJqQ1E5ckxsRSs1VFB6OThEUkpNWTF4S3RiMk90NGxWK1VK?=
 =?utf-8?B?bFFZdlorLzN0NnFoV2hBbVJyVDlaUUtoclRqdVk5NUdkQU9MMXZrTlhjVmww?=
 =?utf-8?B?MUFId3RETE8zcHNhV0VYc2R4LzFvS0puVGNEM3VkeDdqTHB5UWpYKzlUOHdB?=
 =?utf-8?B?WEFoYTlPZGlyVHFmeWZlTDAvbEtVQ280cnJOYStYNWJMbmV2dDJZejFveDg1?=
 =?utf-8?B?M0g1UEpRTDZ2bm9PbU1Wcmh3NzEvOEc1UzlwZmEzRldLTmxaOURwUWRLdkg4?=
 =?utf-8?B?L3o3Q01JaWpPZmZTcjhhN2JuYU9BSFk0MUNwakgxRlpHTkEzR2N1WlVpVi91?=
 =?utf-8?B?OERJSUdxUkFDS1h1UWkzUU8vYzVaM0ZuYUVHaWR2WHhwMGJOWHA0UDJTU1pN?=
 =?utf-8?B?WHFvUjRGMk1nQWRvRDNsdXNjcGQ3djY3TXRzc1l1cHQvT0UwUHpsWTAzUkpm?=
 =?utf-8?B?NHlpVHhmaEFwOEpUeVROT1FTbFZHSThORCtSOVpibEpveXBqbkRjVk0xSlVS?=
 =?utf-8?B?RzFJVVRaKzZxT2pGb21sdk0rOVordW5McE1qSXBLNW5pTDM0NTl0T0tOOVcv?=
 =?utf-8?B?MG8vaFV3djNycFJhSWo0OUtGZGY3Tm9oRG5FRnRHTCtMU2lsdlhod2RQVi84?=
 =?utf-8?B?QXNnWnRiYllRbGFzY1RWajNaSk5laHA5YnhTZEF6RXVBdCtNOVo2R0h1K1hK?=
 =?utf-8?B?NURScG9ucUd6alFMZXdRY3lReTQ0MUdhZVNsOEtFKzNJanhpaTNuYytJMk5q?=
 =?utf-8?B?K3BIdEZyWWlEQ1dMOStjUVhidFJRYVdzV2V5QmZaQXVMakU2S2hoeWFpTGg1?=
 =?utf-8?B?ZTBtZTZrNkZRdVQ5Q25xWG9TelNZalNOTFVxUUtwUHRNZlIzNlZVb2t5TjVL?=
 =?utf-8?B?R3NvdFZtcjZjb2FiYjFzZG1rd25OQ2o4VllrQ3dyS2h4cXJ4ME5yVytkNHhC?=
 =?utf-8?B?WHZiS3l3SHJHbUdFUXdwMUwwN3dwRFUvNzAxQXk1RnpkeGNvL0IwV0NCdWNO?=
 =?utf-8?B?MitaQlRDRkNiY0p5SGM0Vm5JMXJRYk5JZ0ViWTkvalMxYXRlT1lSMjZmRWxy?=
 =?utf-8?B?MVRtdXJ1cHQvSE1LcmEva2ZqZlk3YXZrQTh4NnNFVStOeU5wTDhiemFXNXl6?=
 =?utf-8?B?Zlg0UUtmK0grZG5NYUJteWJJVDZ5MEJMcDlvYk0xWm50VEhPWVIxTnJtVFg5?=
 =?utf-8?B?dUFqUlZYNjJLQWJua1JtUXJWNHNMR3hJdU5DVXM0Y1hmZ3BWeDQ0KzdRV0xF?=
 =?utf-8?B?bER4a21HNGFGU0ZJSFNCMFJWbmREeFpUNEVPeDlCSFh6MzJ0cWNqV0Y0SFBy?=
 =?utf-8?B?VE80dHZQWFZ2V29QNDNGZG44RmRGZ3lJSkRTR1VGZ2psMkNPbWJtckxCZE53?=
 =?utf-8?B?a3ZoYStMT1dnZGplTVZuQVgxaTNCMnY5c2cwVzc2clh2U2xONTkyUDF2MkNU?=
 =?utf-8?B?VnhqTmNIdFRtUHZ3QzdPdDk2dWF4ZngrYmpYZlpPWUU0UmtTTnJJRFBiVitT?=
 =?utf-8?B?TGtxR1lNT0lWR2JvMUJzbGtaSmVDUmw1TlEyNEVpTXRUaTBtcG9rd1ExTHZP?=
 =?utf-8?B?RitGNk5JMkNjVXhOYVRzVVpIcWtBYUx4a0JlUkZEWkJVeFdSemJ6elE2ODFU?=
 =?utf-8?B?ZHBxRHZBNHJHZ2pNQm1aSGkwYXBoSHhDUFdvSWNnZ1F3Y0w5bzlDa2s4YlV3?=
 =?utf-8?B?LzkzS09ROGNuUmdBU0hsNXgyZmxhaDRnSUtSeFBqYXVncmJuVENRdmtsOXFZ?=
 =?utf-8?B?WiszUzNuTWlDd0NqRkRYK29ZQ2k5OEhrbi96aW9veE5lTU96OEFtRHIxTkNT?=
 =?utf-8?Q?g74i+o2ugvZCCCn0QbZBn0VJrDjApw3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGIveWlqeXNYT21mUjRsSGRnRURUOFM4M09ZMXE1c2lCd0dMbUlDc1FNRWZK?=
 =?utf-8?B?cXEwOHpnODd1dit0TnZObHlYNXBRalFvS2p1a0QrZXFRYjlBVlZGdmV5V2Mr?=
 =?utf-8?B?ZXM3UWtxbEFpR2JjLy9HdHlJanNxclJsRjhpZStJb2ZpR3RTMVRSNVZvcitF?=
 =?utf-8?B?NlVqZWJSU2J5ZmdBL1FwSUZMODNPbXNST0Q2UDRKUDRoaHE3dzJ2c3Uzc3Zn?=
 =?utf-8?B?S2lGWHRXb0pZOEplQUFkdU9weWdwTWw3RE5tWU5kb3BVVWFNV3Z4K3hVTU5B?=
 =?utf-8?B?QXFsOUdEbnFPTzJoWi94a3J0bnFCRElkS0JJOFZtV0lmRlRlKzM4WmtzTHpK?=
 =?utf-8?B?dHBzU2UvdTExT0Qzek5JSjl1c0E3cW9vOVByTkY3YStpTmxQZmp1YVZ6bktm?=
 =?utf-8?B?aS9LZTNNZjRKOU1CbkR3SW9Dam5WaGpjTHVrWHQweXlkVkJDZ0I3cmJhUDN4?=
 =?utf-8?B?V0I0MmVtZlJ0bnd2L2wxSHFhUUtGbWVCMHRnUExSeEJNMUZCdHd3L3NsbVVt?=
 =?utf-8?B?enhBaTlyVERQWDBsYmFVL0pERFR0S1FSVjFIdDZBSkdsRnd6UDkreHJ3UWVX?=
 =?utf-8?B?Z2VZaEJPcFBGQms5MUdYZ3VQbFJia2xMaXBFN3A0YkEyUlhOanF5WVR3VndN?=
 =?utf-8?B?aXBOOUc5L1cwNE4rSnBnenZobTZIc0lwY0F6STU0ZllNcElVMmladnJIZkVW?=
 =?utf-8?B?UDl0MHdBeEhsK2wyTVNTNW5lanNMS0xuWlNPREVvM2NYRzQ1Z0hqelhFdVhk?=
 =?utf-8?B?TU1zV0RqTzdZSWF0cStsa05tSXdtSUh4L2lVL1pZeFA5NHF5SlBIM04zR0J6?=
 =?utf-8?B?RnpoU3JwRkhWWWEzV1Ewd0JXSFZBbkQ3RUF1a0l1OEdTL00rY1lWLzZlVTM1?=
 =?utf-8?B?S2tndXcrQjUwTGVtL3VlYndzUDJJMWVSMW1zU25KQXdCemJ4TGFhd0dXZW9Z?=
 =?utf-8?B?Qjl2SVdCQ0NGelFBaS9ZSnREbS91V2h3Q3p1KzZod090SzVKd3ZucHJwNlFu?=
 =?utf-8?B?NVRGRTZQdlZIK3ZabFBBMVB4SXpISmlIN1lBUVU2emFITER3OXpXeitCeGE3?=
 =?utf-8?B?Z0JSdW1uK2ZvbG0yekdFclEvcWxqUWRPa2xuc09Mc2M2MVRMcEFuTE1QYkI1?=
 =?utf-8?B?d293azdlU2RiQ0hRSUYxWGF3R3dwYU9hRWFtOFBuZmdPTTcwSzJZNWRxN0NX?=
 =?utf-8?B?OHlPR1FLaSt0U1UzQ3pTd01xZjgvQVhnNGdTMjVaeXo3VFBOY0FhVWFaZ3I4?=
 =?utf-8?B?anI1RTd3cVFrRWdMQmtmbGNSdVArM1RQRG5kdEE0cm5xWm93MU5XS3JYbGFK?=
 =?utf-8?B?SVpVODFYbHlYcWtta0gwdFBsTmQxSU1mem5QTkV6U3V3UjRLOUJoQUtJQjFG?=
 =?utf-8?B?Ui9JREJGV1JTZFNYVlpTTFcvWWJlZzBKZ0FwalE3d1RtNXVaVkU3c1B0Ung1?=
 =?utf-8?B?bmRoRmRTVkk1eVRWYmo1akREakw3azM4bkUvNGd1alBuQVpzQTd0TFZxTGF6?=
 =?utf-8?B?c0c4VDk5MUQ5WEwyTlRIVUx6UzZLaGxhSDRiTWxBOGJCbVhHYW02MDRUVUh0?=
 =?utf-8?B?bTFPWS8zT0RPM1RYQjF4dU5aMVFQb0ZNdjN4UnYrdFY0alV1eFYwVmJwdGtC?=
 =?utf-8?B?MTh1cVBsWDdVMnU2Yld1eEc1bVVqdmdYZVVBNmliOXhjMFhyWjZnZmwzOHpG?=
 =?utf-8?B?dUFEMm0xd3RnSHFNNUZXOFV2T0F2UG5WMUk5ZDFIdElFZXVIM3ROdVA5ZU9a?=
 =?utf-8?B?M21mNWVmUTZML2xSZnMrUmpBNmFhTnJ5YjN3bVdaOC9TTndYUnFxbGk0M2Fp?=
 =?utf-8?B?VnlVRWhFTkIxbDNIMUFVMEpMY0dKUmZCOHh1RFN4YmZ2YXhOdzVqb3JpRmhi?=
 =?utf-8?B?MWprcjlhbGUrUlhVZE1FcmhGdDQvN01nRjZFOXVXZVpWaDJjUlNOMGZiMytl?=
 =?utf-8?B?UXZKQWtNMkxPc0ZCYkdTUW1MVTRDYVllSXhzMHFEYm8wd0RIOXZxRjdVVGoz?=
 =?utf-8?B?YW5DWVRSbjVCcUg0VGNnV0xEZW1SOUNtU0xrTFJsT1RWeFZlNXd5UXFjLzZE?=
 =?utf-8?B?eUpDUkN2aGdvZkV6R0hvRnBteW5MdkNJbUtUdWpkM2FuK2c1RmNpVU5UMUdY?=
 =?utf-8?B?czRVYmt1bzRNRmVxZ0J5NkJKMFBmSEFZVGtMeCtoUk5UN2FaTnB4enhhaTd2?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5febad27-0d3e-41d6-bb68-08de12370a4f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:21:14.1235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gv/w+vlfdHc0EMFdCAklFfsj45njsRm/dLLPZEe6IVPHjIIQAcjdDBks81iYFiJq9JHFCZw8rkjT3nVtaGVIGBX+gv+LD66cwX0ifJzMWIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

This patch series introduces a set of usability and maintainability
improvements to intel_gpu_top, along with an important clarification
regarding its compatibility with Intel GPU drivers.

Changes requested by the user:
 - https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/174

Sebastian Brzezinka (3):
  intel_gpu_top: Show interactive help in usage output
  intel_gpu_top: Refactor flag toggling logic
  intel_gpu_top: Add usage note about i915 compatibility and Xe driver
    transition

 tools/intel_gpu_top.c | 75 +++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

-- 
2.34.1

