Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8514DC36010
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 08:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396FD10E3DD;
	Mon,  7 Apr 2025 08:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkEuwcD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3239D10E3DD
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744015811; x=1775551811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dqOMJqRKjgNYPSk2VoiacK3GU6JbZqihyqiJeIiZle8=;
 b=SkEuwcD3xs3dmCjZ0uxOAmeJvTIH6ujeGQbjbbTJIgzDG5aN1PIEPP6B
 ycXihIi+hiEeP6J+jFNVJ/noWfkty2EwJm8jsHFsoU/Uz+er/bOSXwCKX
 a1f6KH4OyZyE/EHF5kVxToZA+XApWdqHc7tvLQcVxHVxjuLUnSYiQ1WL6
 hXh0zFqNTZtKvDoEdboOS+nbaC2cdMrIg6kemrfrgtrm56bUIMwyhOUWJ
 a3M5peG3RjbcwzvuIehZrvq+zOLfjWDbEEkoXIQPK4YnXXFel8c/aThcb
 LMsQpvbhdku5gnpiUeQmTr2Nc8ZKR9okI4uHTCZGbdY4HytojBYuoKjoL g==;
X-CSE-ConnectionGUID: BcKpqUifQCOHsL8XPZpcpQ==
X-CSE-MsgGUID: iPksxNM9QaqLRir7wd5O1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="55575921"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="55575921"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 01:50:02 -0700
X-CSE-ConnectionGUID: h/DvfL63TLGxBtkbpKZ9dQ==
X-CSE-MsgGUID: PV2oa1+tT0+ggKsGQA/LFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127775374"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 01:50:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 01:50:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 01:50:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 01:50:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWf/Ok9FwpHe4BfMbgjy74yDTBoF1mHjw57nvUSd+vGkm2kt8I1Xuyl3ynDl2UuGd05Z48vM5DBVNJ0cV96oP2nTtKT73oGa+76779oEy0k75xLvcQq3O3cXGoy1zS5K5uLtzDn4QyciWWMiJyKBlLCXM3+eEI25E3ib1R5XGsMI5OqN8gyxS0uPGeavE84PHMlTN4hiNgvFEr3mtVHRYhYC8uVTPhgdDrOBtSYlyZC4SjfFN7VWhLQew60JkG9w2NeXQzOjKSBWqt6JO/7TWzEA24NZF+p8954ayS2PWTh7ER4q+v+PQwgVj4A58T/ouD6EZ95eKmGTbvNPAlo2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqOMJqRKjgNYPSk2VoiacK3GU6JbZqihyqiJeIiZle8=;
 b=VrsR0P5qkLoJUMocbs0STWnwlgSaJ03IoEM7RrzgYdHR35Nk5JihyQn1ScGGc7DtcHytQgQWRDJjpZ1QUUpoAchotTjZCboz818UM9avs/kH7ARE+7BmM3W5iF4VDLHpwTKv7KU4jNZ9APX+P0E4nVod0gzflb1z/AyzYAOElfyky5UPz4lmA5Yq1M1dsJfW9xu5zKW/ZLqTSCiisWDtM6Ehfy0mT4tgpV+mEE6fGoFRzT/EUHWjCNwhiA0DzU/mdUbH5TCLm3rGIQoroL3w/j+NHDr1Br6c8vBzn221aWi3lk0yM7Xly3xdXDYgOcEfy/FtzFbEgwtsultCsyjQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 08:49:45 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8606.028; Mon, 7 Apr 2025
 08:49:39 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t v2 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Thread-Topic: [PATCH i-g-t v2 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Thread-Index: AQHbpV2XXQad4q7d8kOObxasjZdFpbOX6PDQ
Date: Mon, 7 Apr 2025 08:49:38 +0000
Message-ID: <CH3PR11MB843489EE72E7408D26B634D38DAA2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
 <20250404123140.260143-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250404123140.260143-5-zbigniew.kempczynski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM6PR11MB4691:EE_
x-ms-office365-filtering-correlation-id: 62d7a34a-65eb-4b02-0b9a-08dd75b1219a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a1ZuN3MyTkMwSnR3ZnAwUFQydFpQL2dyVVByQ2NjYTNvK2JUZGJySFVSQ1pz?=
 =?utf-8?B?dExGQkdCVFNJY2lZNjBtM2pvNVZuMlFaVHFzV1B0aGQzQzZaSElzRzFZck5W?=
 =?utf-8?B?V0lxZWFxZC8wV013N0ZCM1FvSFU1cGZpeDMyemd3S0hVa2lGVmJoUDVkREFz?=
 =?utf-8?B?QlZwL3NhZXNzeGNpcE5wKyttRjI2QUFLUHJKNzlvNjdtd1NJSWdWcjZiOHd4?=
 =?utf-8?B?UjV4Y3ZXd25yZmNzY0xYbGQ0NVJxMEJ2Qzc1RytxdFRwQ3Brenh4YWNmbnNE?=
 =?utf-8?B?QkZjc0JPMlc1RndwYTZoakdpaUNaSkZzc3BPYW0yK0dJNUU0ckhkV3Iyb21N?=
 =?utf-8?B?SnNHN3pMbGxuemROeXBpRTEzSW13cjA0TDlZQkNza1NxZEdNQmlUZDBXWjhp?=
 =?utf-8?B?aTRZS28vNTY1eENUcGk3MEI3azNLUUNlTHllMWhNMVVLaTRmODAwVTFPUmxm?=
 =?utf-8?B?ck1ORUlQQTRtc0VscW5BTzF3dXRWM1NrYmZ2U2d3TEZRcncxQmpiRThlVnB2?=
 =?utf-8?B?V2RSUjNNY0Q0R01MbWhQajVBbHYxVFI3aEJqRTdjbmNZakVjNEpkM1llSTg4?=
 =?utf-8?B?U1NacXhPTjBXY0VaMGk1ZVY5TzRRdlU1Y0o1dHNtZEVzMTlkbHFkWnNyR1lz?=
 =?utf-8?B?VDdncnV5QmI2VFRYdGt6RmFJY01XdTV0am9scENFL0p1NHJ1WTAvdHlVR1FM?=
 =?utf-8?B?TUFEaU5GYmkyQTFDRDNaeUpDKzlXY1lYR2NQR0NvN2xFdTlVL3ZiQk9VNnV5?=
 =?utf-8?B?R1VxOUFORkhGVlhabG5KVDdjeFNNL0I4ZEt6eGloU281TTgvYS9oOTE0aGFI?=
 =?utf-8?B?a0swOVdXeHZramcySlo5bkFZcnJyUXprV3NUODNBMzV5QUdoTFZiZ1BCU0FK?=
 =?utf-8?B?R2FNdzMxbmVwNk5lcUFtbjF4T2hpU3BEVHY3T014SnBPTWhsQjR6NFZzbzhZ?=
 =?utf-8?B?KzVVQlZyRXZ2Skk1NDlRQzlrVWR4YXhlRG9FRzFzVUJQK0RNelFUVExIUmdz?=
 =?utf-8?B?R3MxYWdDWlYzbXI4anhFZjlOcHdDNVc4dFBVNzVPNm5ER3RBQWEwdWpTQWNB?=
 =?utf-8?B?VDZnOXNpdmF4OU9IWUlFbDZZRnc4eTdXSERLSXBoKzVCeVh6UkRPSUw5Uk1h?=
 =?utf-8?B?c0FkaUFDZ0cvMFF5dERoY3Mzb01xR1A2ek9lbWN0THlxUE44bEVZMkdxSkFE?=
 =?utf-8?B?UTM3aERja3V0dk92cmJ6azFkTHhIcndxMEVoQ0YzVmo0TVM0TDFDc2RBOHAr?=
 =?utf-8?B?NXlvbWw5d3hyQzFVSGZidHBFK1hEZG9vMExNZHR1WW9uWHFSaU04R095bGVK?=
 =?utf-8?B?SmxsNVd1TS9YeGp4UUt5eUpUVWt6b2plaXZuOExtZmNEREVnODQ3TER6aGpM?=
 =?utf-8?B?bXVNeWNvWWd2UWFqTzNTR3pBZ3JYRkxjVnRmZ3JHQVhLWnFwaVAzZk9xc2tZ?=
 =?utf-8?B?SmRENDVsaENTTjRGNWdQNVNUUEZzNlFxSzRvbkJxVk1TSVhTL3J0UElXWVJL?=
 =?utf-8?B?bXlIL1dQVmlJVlR0V0JLT3FCSjJHUnlScnVQSGViTnJYOWxySTlDaGVHUWQv?=
 =?utf-8?B?eG4wSkNlT1pKNVNkMU84OGdMbDk0bWV3bnpXSk9PRmloQ1I2VDhyS0JsQnRU?=
 =?utf-8?B?VExqZnlBL1dWUmZYamFaaXNqME9MNm1VcStZQ3JEc0lqOFdVMTdBc3E4eVc2?=
 =?utf-8?B?VTVNNWloQ0VwaGV5ODNWdnBBSk84bUd3b0VibEFjZnlzbUdFUmVtRldoYkJB?=
 =?utf-8?B?Q3FzMVA5bGpsT0FKR0FDU20xbUN5R0FXSlF3OUExR2VoWnhYUkxyeEl2ZFdC?=
 =?utf-8?B?eW1PNm14aUxYMjFUWHpkUzJkQ3A3OGVldTZTaUJ4OURZelovTzJkQ0hCdVJL?=
 =?utf-8?B?ajQvc0x4RTN6QjNaSHZYY0g5T1lhNkU4R21qUVRVSXBvYjg5blYrUVE0ZitH?=
 =?utf-8?B?M243ME5LMlNIUFpYU1lMUlUrSjZubm5haTc3Z2JlTml1eEQ0U3Q1NUdVT0Fk?=
 =?utf-8?B?RVVMbTVidUhBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHUwZlRTQ1JDbnJDemE4UlZqQkt1VERwSlNvczJWbzhuNG5qM3RqRXI1a0pz?=
 =?utf-8?B?QmhxdW4rQlVQYWVkNGo2MVBQaHhlVEozOWEzREdkTUEyZnlncjlQd3Fmd3Uw?=
 =?utf-8?B?dlZRbXFLSE1PU3ZyTHNNOEFpdDJCVHFSSDZVeEp5UlRITVZCRktiOGtKTmdE?=
 =?utf-8?B?MzkxdTZHRjFueWFESFlMUGpIdmlvWTQxK1RxTkY1ZktzWU9FVFRJWkUrd3hR?=
 =?utf-8?B?cHk5bmZZSlFUWHFJSzJRR2cwMGNRd2lyaG9IeDFBTVhzUEh4ZzRxcVhmK1o1?=
 =?utf-8?B?bDdDY2VDMCtSeVRPRGN2eWpUWjBMU2p6UTBOZUhCVCszSjE1ZGZLZ29UbEwz?=
 =?utf-8?B?ako3VHVxclduUGVmUDNnRXVxakhMNnVzL3g2YjFpL0dwM0w0OU1JWEJCUGlq?=
 =?utf-8?B?WGtXT1RmQ0RhQnNrVEx4RjU4ZVhvTnZGV1V6NXg2dzI1MXdGUTVoc0hoZ3Vw?=
 =?utf-8?B?aUkrYms3cFBVRE5LWEtreGVrRlMwTHI5b2poUVVONTI2QlNXYnNUbWFlL042?=
 =?utf-8?B?NEhubURlZVRDRzVQbERoZGVrT3BzNHNPY3hkZnc4UHZQWDZHS3pSQ3FIR0c0?=
 =?utf-8?B?MHpHZDBPU2hrUURwVmVEbzE0OVJvb1AvR29la3pNR2ZSRzEvM01LaitYV1U0?=
 =?utf-8?B?MG1rMFE3RDJ6WDd3N0Zrdkg5eXh0MDdYekFDeWp2YTk2WUQxVlgvMmY0Tkhz?=
 =?utf-8?B?Q3hBOG95MGFWcEZ6ajRYSzhtd1FLcjkyNVJobEQveEFLT0gweEwrN1NDT1Vk?=
 =?utf-8?B?eHV5a3pwS05HTG1EZ0tqTFNPSG04bzl6VzJ4NlJNVHVJdDdyejlJbGV0MzlE?=
 =?utf-8?B?MTl4bWNzQm9NeU5PWEZUak41aXE0dlZKMW5xWCtSTjhwb0ZQdlIrQmFaRGw1?=
 =?utf-8?B?OFNYVEwvT0VZUDJ1cjhEbmRvZzgwWFJjSXRJaHlaNEl6cmdUSTFnT2ZSaVZk?=
 =?utf-8?B?cDFPRHJmaVlvZFlySjByYkwwRmlHVm1ZRHB5c1RvZkF4ZjRzMlhGbTQvbDFz?=
 =?utf-8?B?R0RjTUp5aXNLRy9TTGRLRUtncnlhVmhJYjEvWER3WmR0Yk4zL3FORTlkbEVO?=
 =?utf-8?B?RFFoTUhCeURMMG1BbHNiNUF0dUpRbTcxL1htMU1mQStSMm55ZHd5b2pKaWZP?=
 =?utf-8?B?cmtKSEx2SmUwRy9ENVdlaVRGdFhUWnY0RWZMVHVsK20wa3J4N3dmSlJLYVV3?=
 =?utf-8?B?MnUydFdRa3IxZG5wb3lzSW9uVWhoaTJBVnNyelRhcWIvTUtHeWdRbjY2Y3p1?=
 =?utf-8?B?bUFVdFVZeCtKdE5rOWphR0FBc3dqK0FOMUVqemRmcDRaNmdZMDVWUWtESmky?=
 =?utf-8?B?VUE4YzVuUWk0eGpWSEpvNlZCZHZPdFFtWGZtTi9KNWxIK2wzOVpndVQvVjha?=
 =?utf-8?B?LzJEODYzaVoxRzF0ZTA5NWo1R0kxQlA2YWsvV1R1ZHhPcVRUWnJDZ3E5WnRH?=
 =?utf-8?B?d1dVTzBIZGNqMnlzN0pycE9PWkUra1ZUdnNJWk02MDRYSWtucU82N1FmTjJK?=
 =?utf-8?B?VGR4TFhwaW9obnNzSFkvS3JKeTlMcDFXMU1qVkZqeXlmWFNBNHhLeHBxODJs?=
 =?utf-8?B?OWQ2UVp3VWNpdjVYazNleER2a3FSQWtnOGlPeXlkODRnZ2dKYU1ZYWNXd1VZ?=
 =?utf-8?B?Z1VqKzNrUGppRHRFN3hMZjdCWnl2cUFsbGNkODZsMFc3cGdDc3hRNkdNV1VT?=
 =?utf-8?B?aXEwV0ZXdE4vSFpSQU1neGs3UWwxaTM0UlB4VXJsYyt1bXVjK01YZmp4d2la?=
 =?utf-8?B?b1J5MTEzSkI5V056Rm8vcTJ5dnBseGh6ajJEOE5DSnh5NnYvdzdwZWxlTVdm?=
 =?utf-8?B?Q1c2cm13eG5MeDlBd2o4dXd3NUpkMUZXc1I3K2VJb1ZZTVR3UjBiWFY0cGY3?=
 =?utf-8?B?SFdYaFBtK1NaSkd5eHF1cElydXpNRWZQb3hIc2FDKzE3bmZqZ3VVVFVVNmJD?=
 =?utf-8?B?MzlVcFFsZjdkaW1ZeDh3ZmN4bVRNSXhobFZtZGFJVXlDWEkwaGgwWU1UdGp5?=
 =?utf-8?B?Wmo2ekZNYUlyMGk5VzlRZ3JGYWV3VHBxL0duRE5ZdXh6UHUvOGJ4TldMeDcr?=
 =?utf-8?B?aUZBS041NE5YdFZPSEhMMzlpU0RVWHZiZlVWejBrcmdYa3hOcUE0Y3JzdjVk?=
 =?utf-8?B?ODZnd2ovcnV0Uk1DdnIycEM2WFBwdUptZHRrTFFVNlM2ZGNxajNmcDNvY2Fs?=
 =?utf-8?B?dnJNRFdVcTdMS2gxWVRUd3hMaE9YYmdsSXZoYmJDVFo1RG5mY2JkdG1ZcGxj?=
 =?utf-8?B?ZDZXblFHcS96SkptNUptT3FCSjh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d7a34a-65eb-4b02-0b9a-08dd75b1219a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 08:49:38.9617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r5ycXtiSD9zyR72zsB9/0bnQDsis7mrF7tu8IUMMT5Zj8tZdZyQsUoAGePLErHvt7E2Jo0mrhwU49p8hGrxItAnKHL4qRF+7sMC6DQWFpjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2VtcGN6eW5za2ksIFpi
aWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IDA0IEFwcmls
IDIwMjUgMDY6MDIgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47
IER1Z2FzdCwNCj4gRnJhbmNvaXMgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+OyBEYW5kYW11
ZGksIFByaXlhbmthDQo+IDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggaS1nLXQgdjIgNC81XSB0ZXN0cy94ZV9jb21wdXRlX3ByZWVtcHQ6IGFkanVzdCBu
dW1iZXIgb2YNCj4gY2hpbGRyZW4gYWNjb3JkaW5nIHRvIHJhbSBzaXplDQo+IA0KPiBTZXR0aW5n
IGFyYml0cmFyeSBudW1iZXIgb3IgY2hpbGRyZW4gaXMgcHJvbmUgdG8gb29tIHNjZW5hcmlvIGFu
ZCBnZXR0aW5nIHRlc3QNCj4gdG8gYmUga2lsbGVkLg0KPiANCj4gU2luZ2xlIGpvYiB3aXRoIHNp
cCB0dXJuZWQgb24gdGFrZXMgfjEwME1CIGZvciBYZTIgdGFza3Mgc28gYWRqdXN0IG51bWJlciBv
Zg0KPiBjaGlsZHJlbiB0byBjb25zdW1lIH41MCUgcmFtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
WmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+
IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+IENjOiBQ
cml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+IC0tLQ0K
PiAgdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0LmMgfCAyMCArKysrKysrKysrKysrKy0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0LmMNCj4g
Yi90ZXN0cy9pbnRlbC94ZV9jb21wdXRlX3ByZWVtcHQuYw0KPiBpbmRleCA4NzZlNTM4MjM3Li5m
MDdlODdkNGM0IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9jb21wdXRlX3ByZWVtcHQu
Yw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9jb21wdXRlX3ByZWVtcHQuYw0KPiBAQCAtNDAsMTMg
KzQwLDE4IEBAIHRlc3RfY29tcHV0ZV9wcmVlbXB0KGludCBmZCwgc3RydWN0DQo+IGRybV94ZV9l
bmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSwgYm9vbCB0aHJlDQo+ICAJaWd0X3JlcXVpcmVfZihy
dW5faW50ZWxfY29tcHV0ZV9rZXJuZWxfcHJlZW1wdChmZCwgaHdlLA0KPiB0aHJlYWRncm91cF9w
cmVlbXB0aW9uKSwgIkdQVSBub3Qgc3VwcG9ydGVkXG4iKTsgIH0NCj4gDQo+ICsjZGVmaW5lIENP
TlRFWFRfTUIgMTAwDQo+ICsNCj4gIGlndF9tYWluDQo+ICB7DQo+ICAJaW50IHhlOw0KPiAgCXN0
cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7DQo+ICsJdWludDY0X3QgcmFt
X21iOw0KPiANCj4gLQlpZ3RfZml4dHVyZQ0KPiArCWlndF9maXh0dXJlIHsNCj4gIAkJeGUgPSBk
cm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKwkJcmFtX21iID0gaWd0X2dldF9hdmFpbF9y
YW1fbWIoKTsNCj4gKwl9DQo+IA0KPiAgCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygiY29tcHV0
ZS1wcmVlbXB0Iikgew0KPiAgCQl4ZV9mb3JfZWFjaF9lbmdpbmUoeGUsIGh3ZSkgew0KPiBAQCAt
NjQsMTMgKzY5LDE2IEBAIGlndF9tYWluDQo+ICAJCQkJY29udGludWU7DQo+IA0KPiAgCQkJaWd0
X2R5bmFtaWNfZigiZW5naW5lLSVzIiwNCj4geGVfZW5naW5lX2NsYXNzX3N0cmluZyhod2UtPmVu
Z2luZV9jbGFzcykpIHsNCj4gLQkJCQl1aW50MTZfdCBkZXZfaWQgPSBpbnRlbF9nZXRfZHJtX2Rl
dmlkKHhlKTsNCj4gIAkJCQlpbnQgY2hpbGRfY291bnQ7DQo+IA0KPiAtCQkJCWlmIChJU19QQU5U
SEVSTEFLRShkZXZfaWQpKQ0KPiAtCQkJCQljaGlsZF9jb3VudCA9IDUwOw0KPiAtCQkJCWVsc2UN
Cj4gLQkJCQkJY2hpbGRfY291bnQgPSAxMDA7DQo+ICsJCQkJLyoNCj4gKwkJCQkgKiBHZXQgaGFs
ZiBvZiByYW0gLyAyLCB0aGVuIGRpdmlkZSBieQ0KPiArCQkJCSAqIENPTlRFWFRfTUIgKiAyIChs
b25nIGFuZCBzaG9ydCkgam9iDQo+ICsJCQkJICovDQo+ICsJCQkJY2hpbGRfY291bnQgPSByYW1f
bWIgLyAyIC8gQ09OVEVYVF9NQiAvIDI7DQpIZXJlIGl0IHNob3VsZCBiZSBDT05URVhUX01CKiAy
IG9yIENPTlRFWFRfTUIvMiA/Pw0KLS0gUHJpeWFua2ENCj4gKw0KPiArCQkJCWlndF9kZWJ1Zygi
UkFNOiAlemQsIGNoaWxkIGNvdW50OiAlZFxuIiwNCj4gKwkJCQkJICByYW1fbWIsIGNoaWxkX2Nv
dW50KTsNCj4gDQo+ICAJCQkJdGVzdF9jb21wdXRlX3ByZWVtcHQoeGUsIGh3ZSwgZmFsc2UpOw0K
PiAgCQkJCWlndF9mb3JrKGNoaWxkLCBjaGlsZF9jb3VudCkNCj4gLS0NCj4gMi4zNC4xDQoNCg==
