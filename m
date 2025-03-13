Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7E6C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 08:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C26C10E342;
	Thu, 13 Mar 2025 08:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/T4Ade6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E999410E342
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741853647; x=1773389647;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dyK6zXZLIU8lGLgQ4kyPpGHcQ9kB3kBpPZjI0hcQWQc=;
 b=D/T4Ade67GaNXyXC7E301pJKYbjK9ahuoj6Jt6gwFM2DcUjbsU5nWeT8
 PPNkAoe0cdDAs3x4A00e3iVsN7M+/bUimbT8dHtV91zDy5INnM7knaYmN
 EemnMS6iEh9Kx6j5YOgeHYa2rekj64O19NrGxR4o8dUy79nRNRHsYRFDD
 7Y7rHvpWOMf0p1+nOU76a5janXYufOVLdb4RHzn2pVZhNST9C06bLGSjn
 UQdVJkSZw7hPoeYJuw5kw5pNmw8oTFtGrwHXG85JjTiXpk8iVDP+nON+5
 MdwxD512GZ20rrB51M3wo5AVIarQCUi7Lrr5LnYe6BnEkkQvBC8/wJLWj Q==;
X-CSE-ConnectionGUID: QePHr17kRAq48fiN3gSMIQ==
X-CSE-MsgGUID: a/3sbcJ9SSaVsZ2/04vvVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42128613"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="42128613"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 01:14:06 -0700
X-CSE-ConnectionGUID: mccFe/0vSAmA0kFtE3O3aQ==
X-CSE-MsgGUID: ORIJY60oSd+Ad7JZ8D+j1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="144072415"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2025 01:14:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 01:14:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 01:14:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 01:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCo8ZLGdatOKskVO5sm/Q7iGlaIl8RGjd307F/Tel7tiApUUDcR4DDALtWPrdtd4z/kwIm+XACF45Eh9uPcvwt5JnMi6iy9cfX3sD1MqE4lK8vapJ4H0d9qzInIIYUOECBZfxsoBFSGKYtfU5HpOWpQKmQgW6PLAoAj42IVY++AqFD8xM4dvyiaSehPx8923nGQe3sy0Mc+VuUb3WJBRiX4mtHGby5zH1mbXeP/jTsIRtpvuH+GQlDD36sqR2MtCoFOD7NOZ+9WYEiuDncHteSjkW2Hwh9sHyx3yRKUWXEQjrchnMymtEf2JGHA0ltYPfBXFgH+MJGlnAVk8XzdAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWKdc0cw0PD2m4ev6B4AOdU6rEJFgyKX+8KqaWuJc00=;
 b=vsgHjP4XuRRQZowWcL6BHSGElLKJ254MhM547+ItpQ9gQ8hQJzTj4qc7qQd9TgY6YMagQxSaLhwrAWC0OOpQgH9vbADIaArMCqp8/y1RMLq1/f6hQ069S6OVARdz6Gl6oRb1LpR5osxkNgtw/8QSp21udOHCYTnn8OGfmeuU9nMarB1eLQ1+KVOGe023NeIBh49SMB9Y7LXsTaZ8adAs52BzzJFt/6q2NyUcNSJgF+8pqWkKTQj/7AX58Nyyua6vcJCsOSpE3x/OrcalwOT15AsLYKk43jkvVYv/Q6gFVTtuWRTkTc1oyEsBAbhr3eAIYYPdQC0VYPYxri6K/WyO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 08:14:02 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 08:14:02 +0000
Date: Thu, 13 Mar 2025 08:13:53 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <jonathan.ming.jun.lui@intel.com>
Subject: Re: [PATCH <i-g-t> v4 1/4] lib/igt_device_scan: Enable finding all
 IGT devices for a specific driver
Message-ID: <s3hpctmss27deqqgnj32o5dymg3v2pd27od4j2flgng4tpq4ep@khimontejuxg>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250313062154.1601701-1-soham.purkait@intel.com>
 <20250313062154.1601701-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250313062154.1601701-2-soham.purkait@intel.com>
X-ClientProxiedBy: DU2PR04CA0153.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::8) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8eb787-09fe-4f96-09e3-08dd620703ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEpLbHJUQXAzMEJIa3FXLy80TzVwL3BlMmNGZmxDd09panZYZzl5MSsvMnl0?=
 =?utf-8?B?Z0FYSVYwQnVTZ3JjMmtYU0pWK25tY0RZVmtMZ2VsN2FtbTFZSTJDcHY3VXM4?=
 =?utf-8?B?OUVodDlpZzA5bFRCR3RNRnF6MUhRZUpjMUhXRTQ0UDNBSmFKV29GWCthTFZu?=
 =?utf-8?B?UGppTlZ6ZGE1YWJPck1HcWtnZUxzSmJ1TVovbXBMN01BbmZWRllKZitibWMw?=
 =?utf-8?B?QWVHTCtxNXdVa0FiMkxvdGpLQVpRS1VtZll6bmRYSkdpaTRsaWlLVUJZZDZi?=
 =?utf-8?B?ZTZrU0EwNG9HbktpbFVLZEhJMEZmcTVWSHpjNzBIdXFjOWFZd3BOUnVYa3or?=
 =?utf-8?B?cnRMT1ZPbnl3V2RETVhGeENrY2gvV1JMUjhjNUhjM2xDYUVXWHgrSVNtaS83?=
 =?utf-8?B?YmRUaGRZYmlMWE15VEFOcldyOWg2WGpnZHVKS1hWR1FFczRUdDRicWxkY09k?=
 =?utf-8?B?aTVEZGFGQjNibUdQOVltclFEUWtMT3I2OWdITHJFMUY3b3NZVTA5YlRrOUR5?=
 =?utf-8?B?NFcyNVpwRGZIbjJ1SDlkbVpwZnJ4ZUhNWjNkTjZZZnZ4M1p4NXBsWnpGc0JJ?=
 =?utf-8?B?dnJtTjExRm81d1FBK0I3Q05qeVJqUXkrM0VYMHBrN0RSOWkwVEJmdmlYcm9Q?=
 =?utf-8?B?SFJ2cURYRWkxdUJQcm5pV2Rhcy85QlY5V1JnUTNLT2wvcWVtU3hOSGJ1dzRz?=
 =?utf-8?B?Q0FFV3RERWVPRmc4T1N5c3V0UDlIaGRJeGdLZ2Z2WWpQSkFSVlMvT1FXTlB0?=
 =?utf-8?B?alpBbFhyL1BWRVZ5c2VIZU1zYXRXYUtGOVg5czBRV3pVVUJVTXhka2Q0OFhS?=
 =?utf-8?B?diswWGpVWEZLVFlua1ZSUzRjc2kxSjJVc0Ftbjh5Uk5jZUx1S3NIeVR1Mk14?=
 =?utf-8?B?OXV3VFBsUVNwY0gxbkNqcUJad3pRM1ZDUE40MFAvK3RpZjh5YmlsOG96cnN4?=
 =?utf-8?B?NGhnQUUxN2VGcEkvaDhYb1lpeFdsOFk3ZmkxaG4vc24zaC9JSlRUNnFYL1h5?=
 =?utf-8?B?RnFWRDhHa1ZWNFgwR0FEeHYwRmVTS1lySHczUUprVDZ5VUk2dFJ4Z3pPbTY5?=
 =?utf-8?B?VWJkUEx1ZlZZUlJ0SzQrc1U4TXFOOG80c21idTIwaFF1U0xudVNOeFJGZk9l?=
 =?utf-8?B?L3I3YTRUZEVGR3lYTTJKNWNpYUpkem96YUo5NlRnNi9IQlVmL0E3OGNJS3Ny?=
 =?utf-8?B?ckhGMkdxYUpwc0xnMTQ3MGFjL25WYXBhN3ljSVltUGdldWdhOTl5WVNpa09C?=
 =?utf-8?B?dlk4am0yczMwNjBCT3AwRm9EVHR1bVYyU1krQXB3akpmMFBjNDVOSG0zbVJ4?=
 =?utf-8?B?cmVNRHFFS1l5Q1FOWDBsZjk1YmlCNWtDYmFtdVllakhCN2s0aklRYTg3SHkz?=
 =?utf-8?B?QTJBTy9QTGJLdUJ3eVFza2E2QW05MitMNGZnMWVtYmZTa2JIU0xqVmp6QTFl?=
 =?utf-8?B?cFd1VXd3YmRxNEhZWTV1YXphMXFaNGR0YjBFbHIyOWtMSGppTWJzRWRWSUx1?=
 =?utf-8?B?dCtXajU1VUpCci9CZncxdk1XOTluTDZHckpVcnd4dE9rTFo5QWVvTFZYWmky?=
 =?utf-8?B?MFdlcGpqMlREVzZsQkR5eUdpMjF5NGFjTWdzbDg2YThhRWFQNFhCTW1QL3N6?=
 =?utf-8?B?SmNqNnlTK0NBT3lnMnZraXJ6ZWhRSTJDY2tKTHhYendWbUdiMncxblc1ZWdh?=
 =?utf-8?B?N21jWEZ2b2NzbkNGcFk1azZWeFFQbVFFUGRKenhLb041eVlmczlIMDhyc1V2?=
 =?utf-8?B?TXBIV3hJTEhWd2FWQ0E5ZFdRRTlzb3FQdWh4RUpuQ3JOQkE5eTFwa296bW12?=
 =?utf-8?B?QTg0TlRQeEFkOHVJOEs2aU9WcDRmVzgzQWY1NjMxRkQydTdEc043Y3pWNlZF?=
 =?utf-8?B?SXB6ZEFCV2U1b1NMN0tDM1E4alBEYkh0WXltdkQrWDVRTkZVeVJCQWxQdXcw?=
 =?utf-8?Q?4vM7Zp4haDMWJl2VJy3lSxaLbyGMJ2B0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUN2b1R6S0JZK1dBZ2UvYTRmZHd5bXViQnVSZmlGMjEvZEUvcWJpRW5ieFNx?=
 =?utf-8?B?M2dhMStodDlzZkJDYUkvSUhNalJvVWt4YmZLTS9jSmkvQkZpbmVVNTVsYitw?=
 =?utf-8?B?VTlmVzRoTmFoNnVvb3pMdjB6NzVlTmhqQUJQQkJtUW80Y0Jmamp5TXRJWTJt?=
 =?utf-8?B?a3BIVHB4YmU2MEVjUDR1LzdFZGV1aWROMnBKaWxxNGp6SXpmVEk3TmY1UkI4?=
 =?utf-8?B?MnJoc3J4UmNqWGtrMzB3bzFUZHJrK2NEZjZreFAyb2pndlNkUlMwTFVQWHk0?=
 =?utf-8?B?N0ZxRFd2cStaYldWMS9heklIWk11MDR4TDMrV2JJZWpNVEtGZldCSTRQTTFT?=
 =?utf-8?B?aG1lYnpZMlA2WFNnd1pEdHZFcEhVMHR4MDNhUlo2MU1haXhyN09sYnk0ZGtT?=
 =?utf-8?B?R09OL2pibGFVbDVzb0lYTnplUFlnTDFvZ3pKMDEwTytuYVhkbjNYdkg0TE5O?=
 =?utf-8?B?ZVlCZWw3M2tESkdxRmZOOGlSVDEvZG4vUldWL1MwRGZ1c1dIVzhBVzZEMGN6?=
 =?utf-8?B?TWl6eHhPczJHa0d5TFJodXFHVWtVcExESWI4UVppVGJ5MDk1MkF3OGNrcEUw?=
 =?utf-8?B?QUk3QlI4NkZLNTRRZ1VzaXl0UjEvSllmOFNvK3MyYnQzSXc4SlMwVmlmaytW?=
 =?utf-8?B?MWlVY1BLMzhwelc2YlloWHVyV3hmWThlak1uTm5GKzFmTDZ6OTA0VGkzM3lz?=
 =?utf-8?B?dXlLRW9TUjE5REdNUWlOWEZVRWI5MWZXRzhsanpYL3lmYVFPOHRVdFo5VGtK?=
 =?utf-8?B?bEtCYlMzZ1VMQWZ3SG04bW51R3ZHQS9VdTVBbVU1REZkbE1QL0JJcS9Hd0hM?=
 =?utf-8?B?ZDl0OVBWdHNJVVRydnJmVGNZcDJsTUFQOXNDQUJYajFsYUVyMDZJckRpRmxR?=
 =?utf-8?B?eXh4VXZzOVZLZDhaSVJaRVJ1M3d5OVA3dTV1QzRORmtUSkExakkvRjY1TGdK?=
 =?utf-8?B?MVY1SjVsTUVMdW5xUENZay9pVjJ2THRiUUF2VmVqT3llT3BRY0VrdExRaUpv?=
 =?utf-8?B?QmJ5WUtnSmY3b0NJaGgzTzVUeDN0MXBIUVpBeEE3TXlQdWEyK2pCUU41bng1?=
 =?utf-8?B?QnI3L0hvdFlzMlJldmJDcXp5cHkvSm4ranBjTEYyT3hPNitSakdLRnUxUmg5?=
 =?utf-8?B?bk52ZktJUWFJeDVtblZBQ2dpZkxLcHdBOUV3WWpxZlZjRDNUYVZ5bGFUeGNT?=
 =?utf-8?B?WjFFMnA0WXF4MHJmRDJBM3NCZzFkelk4a05QNERaZS9wTkpVMTVTZnV6QXdU?=
 =?utf-8?B?ZEErRHB3R1RnUHhidUtyT1Ntd3NISlJISVJxZU1lRyt2Rjc2YitJZjk2Si9n?=
 =?utf-8?B?RWVtT3RaUG5IS0lmOWtmeS9ya0pDWU5uOFVXK2p3akYrTEVFUG1ncmQwSWRU?=
 =?utf-8?B?TU1ZTWtKczZOQ0wwbEVlci82ai8xM01jT2RZamdiaXJMQ1JpMHFxaHJhZlAx?=
 =?utf-8?B?dXQvWjFtMDJjU0J2N29iaG1kWStKWDltcjgxSTY1dnloU1VQdVI0cXNIazhC?=
 =?utf-8?B?VTFNSW1GT3VHTjNzQUNGZ2ZhVGtYRDcyU0k2NnVYRXZRMGhmNFo0Vm9peGpD?=
 =?utf-8?B?MXVNbjNoRUhYWVcyYXpsbFI0dGpEMWFVZFhCR2lxcDZEdzB3OGFCSWpTZGph?=
 =?utf-8?B?L3VVdXJaeG15WE9PZTZZMzVERC9YNE1sKzNYL09VTllobHNyVmRNdGIxR0F4?=
 =?utf-8?B?UWxrd0s2Z1ZrcUJ3aHZhUnEraG9kSVk4VHpTdWFha2dGYmNYQXNIeXhMeTJM?=
 =?utf-8?B?UmUrMWlrL2U2WTJQL0RBMjI2Vjc3NjROU04wRkIrUnJabVFCQmo4OE9FWDIw?=
 =?utf-8?B?ZnF6OWc1MkIrUUFva0srdXJRVlZFanovMldYTHRmRDl1RWY5ODRnTGhta29u?=
 =?utf-8?B?c09qa1JrYTdrSm50Ry8xTW42elBqb1FsODJCaExvWEozbzFYdWU5L1F0Rmli?=
 =?utf-8?B?dDhuMXVTK1ozUEZOdnl6RnNFbFNNalVkRFVUaTJibHBMdlphdVM3d1J3VHZy?=
 =?utf-8?B?R0ZjZURhU1RSakZVanhobng4V3V6eldZcXN0RmFQdXZtcFl1bmtNc01wdk91?=
 =?utf-8?B?cjBWMy9ndi9PYlhIaExrSDBtSXFvUmRGR3hjaFRXTEZBdDA5Tm52ZGpwOWJF?=
 =?utf-8?B?SkdISzkxT05WYjYyaTJjQ2o1M0FsYms0MVYrTTFRMW5FcitlaEpuc3VWVzR0?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8eb787-09fe-4f96-09e3-08dd620703ce
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 08:14:02.8840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mz9KWGBHKVwppAQx68Uwuuh4MWxA4Sl+dF05F625Db16OCNJX0qENdwq+j+LuX9wRIp20rorWDT1a9ekYVZdBZEMA4PT9ybMmfVGffU+PzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
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

Hi Soham,

[...]

> +/**
> + * Iterate over all igt_devices array and find all discrete/integrated cards.
> + * @card: double pointer to igt_device_card structure, containing
> + * an array of igt_device_card structures upon successful return.
You could rename this parameter to "cards" and write something
like "an array of cards to be filled". The fact that this is
a double pointer of igt_device struct is apparent upon first
glance at the function signature.

> + * @card_type: flag to indicate whether to find discrete, integrated, or
> + * both types of cards. Use 0 for integrated, 1 for discrete, and 2 for both.
Instead of explaining what certain values mean here, you could
use "dev_type" enum defined earlier in this file. That would
prevent the code from using magic numbers.

> + * @drv_name: name of the driver to match.
> + *
> + * Returns the number of cards found, or -1 on error.
> + */
> +int find_all_intel_card_by_driver_name(struct igt_device_card **card,
> +				       uint8_t card_type, const char *drv_name)
In this file there are already a few functions that begin with
"igt_device_find" - you could keep that convention here and
rename this function to something like
"igt_device_find_all_by_driver".

> +{
> +	int count = 0;
> +	struct igt_device *dev;
> +	int is_integrated;
> +	struct igt_device_card *tmp;
> +	struct igt_device_card *crd = NULL;
> +
> +	igt_assert(drv_name);
> +	*card = NULL;
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
> +			continue;
> +
> +		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
> +						PCI_SLOT_NAME_SIZE);
> +
> +		if ((card_type == 1 && !is_integrated) ||
> +		    (card_type == 0 && is_integrated) ||
> +		    card_type == 2) {
It would be more readable to see named values from earlier
mentioned enum: DEVTYPE_ALL, DEVTYPE_INTEGRATED,
DEVTYPE_DISCRETE.

> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
> +			if (!tmp) {
> +				free(crd);
> +				return -1;
> +			}
> +
> +			crd = tmp;
> +			__copy_dev_to_card(dev, &crd[count]);
> +			count++;
> +		}
> +	}
> +
> +	if (!count) {
> +		if (!crd)
> +			free(crd);
If the "count" is equal to 0 at this point then "crd" will be
NULL, so this call to free() here seems unnecessary (unless I
missed something).

Best Regards,
Krzysztof
