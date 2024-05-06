Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3785C25B10
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 20:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916BD10FD98;
	Mon,  6 May 2024 20:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBArFKr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87F410FD98
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715026910; x=1746562910;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mT+h/WEFhGjx9f3+VCXXT9pzKAofjeOqK6033oVm5HI=;
 b=fBArFKr45Ocaxwx6/FmxLHw2semeDb5Lxlqj7qRi99JkeG5YcXxoV9xW
 FGeSUZPveA/7qX+Skvk7TRpU+gB85+3q5JbgsW9SG84dZjhIUP9v+/dze
 8mqfWshRvoRIfJwuOzl1TvvQ2zPKjhbzwL9lrGxkSs/4UQ9iM14ioyDcq
 BAqCAK65U8WAvqgZU7dQKpBsrRpTbl1iKnRDN7IM+EOSG52Jx/CuJY7Hm
 eb7rpMX2HbeOxTdMa+Vq+AN6/m1E0u8425cJsHeSTvN4Y8QBj254bmJvr
 C7B0dzGvAghU+/K7e/29xnAaIsZA/EIziroqtEBvXcU0vb8dOksQdJP1t Q==;
X-CSE-ConnectionGUID: mBrcnz86S72vmtdEVnw2Gw==
X-CSE-MsgGUID: JnXF5w9uSCCvj1PzVpJVlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11331143"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="11331143"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:21:49 -0700
X-CSE-ConnectionGUID: 6t50qEfhT7qRcf168ZAOWg==
X-CSE-MsgGUID: FzQ7lhrZRYSRpgJywY9rAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="28662531"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 13:21:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:21:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:21:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 13:21:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 13:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAU6Cw0O/udrgzrWsmRclgHOJGmQ/ma9663dP1Nv/FMpcvvidFGR+18UatdhEwh51eqP81wMCk0JSlXLXPpG6Y/QdqqNNSv6tEBYcfeiJnUAR2EmzZJuX8ilo82sRP68FXfA7x2CA7posVzxcjVk78tT0fxEMordssQPEgBua2+H0rgbChDLZ6Kqjg6bCtclV65gdj+TVcFIfjjd1XuoGp0T8zWFD09a/lKGlRsM9vSrH122rKMFgE2k1dI6MReAddcAHQT3dxEAHnumJ7ZZ46C3C+S4IAJnEvBPQWkqtyFVZZy7WQ65CzGfy7gtuddA3oGVRENL2Z0uID9R+lDpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLIeFAqtxo2A5lK9J01zB5BG62nt2YyIyNfTCh9sfYQ=;
 b=UT4deDqnxIfLZHrVvfvCh5rO214npS6VZ+mJeQyh17yHWAGg85ELbUxjtvEHf9oTZaqSuOOKLEoy1tvaiPSi3DAnSwPNsD7/9uTyw/+u4Zoi0PV1Bv6MptbDqBsxo2ZXKsdQsHrwh+/3ia9ZvS+TqJel3D9y50/haRTAaJdFAmektproALb0UNDEZyqMVJaojUTZddoSN/QAZ5R2hiYoyQmIo0nMqVcJYmM1dMOABCBGPZNX+XAyNZ5dIre2d5ARy+w8ITLjYtSAmsIep4rmyo1BbR7hmK0VxrhMCP4e4+LHKxmvK1EB1Pq6oI/AoGE9KTfcez/Ct1EArdsiYL5lBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 20:21:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 20:21:41 +0000
Date: Mon, 6 May 2024 13:21:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 01/13] lib/igt_drm_fdinfo: Extract ignore_space()
Message-ID: <Zjk70GFIMycnNfID@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:303:6a::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b07a0f-ee7f-41a8-6695-08dc6e0a2442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVNleUFJU1ZIN1ZlMFhSQkZWMjNoL1dPL3o3elNHdUhpKzNkVkhrQWdqUEpw?=
 =?utf-8?B?QXU3VGNkUEFOM0FlNmNRUndTUWNzZ1RBekkrNWdyZ3FtTWlicVVxQ0ozYzYw?=
 =?utf-8?B?cWU2clhkay8xWEpERmpIeFA0V0lPYTBRc1Y3SERYdWtKUzhlMCtFcEwyUDdQ?=
 =?utf-8?B?RlJibGZlQVVIUEhjNm8wN2JCNlRkZi9XYXJ3Y2ZWc0xPanRyenFSeXp2ckZY?=
 =?utf-8?B?OEgzS2dwdUlsWFZEaFpwZ3o5Q0d2Nm4yeWpqelVMbEZ4bnZoell6MHpUaFFY?=
 =?utf-8?B?bjFBa0pFeCtCWmV0ZFZwV3prTTJPRld6TTZPRm43dUxyRm16SDl0dU1nTjdJ?=
 =?utf-8?B?cmNRY3pHVm1LaEVrWDM0cVFoNmFCaURjWE9uM2paaEZ2Smg2bGs4YzNUU3Ji?=
 =?utf-8?B?T1MvOXBrUE1DSnhzZGllNU5RT1U2OE4vVi9ZN1k1ZG5rVXRzSGZHbjZjZVJR?=
 =?utf-8?B?eXRJaXpEOXI4VlFMWHFsaG9MUmVPNFhyRXVETmJrMlhNMW1CbG41L0hoY2li?=
 =?utf-8?B?SW1tTjFKbG1rUFlVNldLUVV5ZUpvcjlBNGIyYnVjUWgveXhrb0VySmdVdjJu?=
 =?utf-8?B?NnhocWtvT0xXTXlOalpqSStyM2ZyVVkzb0R1RXJnNmVsZXg4dEtSK1IwdWIv?=
 =?utf-8?B?SEIvUHlvREdibnZENWlaL0pWQUhybkwwckoyemFWQXRqSG55WUtncXZYSUUz?=
 =?utf-8?B?Unp6dVpOa2M3c3ZMZHp3Yit2ZUVxWUtKZFZ1Y1N2azJzU2VsWTV2ZEl6WktV?=
 =?utf-8?B?citjelF4bU51L0JkdFlQTXZadGJkWTJ3cC9EZ3BERkVqOHNpdlFNa2taMVl6?=
 =?utf-8?B?SS9CZHkvRnZKaEwyV3hsdnJER3Z1NXRVWlZUbml0UFVxRmJmbld6RU8xbllJ?=
 =?utf-8?B?d29qRHVrbDhtMUZDbi9tSEV5L0E3RVRjYit0VHVHb2hmYU9pUDgzSytqdTRE?=
 =?utf-8?B?bGM1Uit6bnkrY3QyczBWYThNd2p4Z1BRTHVoZVZPaGhreW1GdCs4eWQxSUZU?=
 =?utf-8?B?cnZ2RVdaeUt2Si8rWWVxTFRjSjFHTUtTVHBjSDUrUzJBUllVYkxEdjRXQ00z?=
 =?utf-8?B?eUpJeDZUeWEveFlSUWlDa2Nodms5bDJVSGdmYzZIaG5zVFFrQ0V4bStmYW05?=
 =?utf-8?B?Vi9CSjVjTTQxNzFhd2VnWlQxRUU2OTByVitsaVRLZ1VUL2l6MWtQbzV4dlZU?=
 =?utf-8?B?dC9qRzBnc0lWMHZXaDFPclZFVnMrQjRnLy9QcUFHUEZLeFl5K3oxSUo1d29i?=
 =?utf-8?B?VXdtWjJjVWQvS1VhVHIveDZaelNEWEhOQWtNMW5vUzZ6YzZjOGRsQjcyZW84?=
 =?utf-8?B?dmUzMlJBd3lLUE4zRFJiTy9yOXBseGJ2azUwLzdMRDJuK25RYnFaSzdQQlFE?=
 =?utf-8?B?Y09QU2luQU4wT1pFVVdYRVBWSHRjRkM5TGlFMjRjelVHZld0aXJ5WlEwWjIr?=
 =?utf-8?B?cDdIN2h6aWJVOG1NVGF6S1VsdGIreVhIN29ZMEF0ZlVnSXprMnMwNXpLR0hZ?=
 =?utf-8?B?R0FKaXNLV2hKZWk4bnBLOW80YnJ6Y3cvZkIzWlI5SlMwVDFrMEx5RUZ4blBr?=
 =?utf-8?B?dlkxOFNiQ1daWjJsdk1nWFhnWkJON2JNNnFJbjVpaFdRSDFjRkhmTUxLMVB3?=
 =?utf-8?B?YVZLOWhNdmlQa1dtZ0JEdEdoWWwreUpXVHYwcXMxN3I0SjRraG1sUG1PcjEx?=
 =?utf-8?B?RlBuWXAxNnhhTlcwc3pWbm13VHV3dkdSY3RFR2dUclZwOENGYzNRbjRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Znh2NzNkM0ZLbVo1STlkU25sZStnTEVnUUNaY3NCeHJwVzhjQnhrZ3BWV3ND?=
 =?utf-8?B?ZmtvdW53c0V1Qzk1TjU5Y01VdUVwTW5XSnFuM2Y3V0hLZ2lBL0dpdG5UUHM5?=
 =?utf-8?B?RUk5MGhnaHVkSHZ0Q3M5NWkwb3RONkdWUDAwb2R2d3g0NmRUS3NOKzFHbzM5?=
 =?utf-8?B?MWk1blpVY1lQcVVmR2xwbGtRNldycHZSUFU1cVd5M2JFekF6S1ZKZlE1aG85?=
 =?utf-8?B?Yk13K3dtMXNMUi8zYjFBeEhrMENmak85cjdmdjVWSGFUWWdSa2tPeEd5QXc3?=
 =?utf-8?B?REhabUZLdmxkTGtXR3BzeU81dDk3YnlGamdmZjcreDZ5NTlSU2F5bFp4c0d5?=
 =?utf-8?B?TjdPenFnaitjSGlDNU1SQVExajcrM0tsSHAzNzZkaitBSG9ZWVZ2b0NTZXlI?=
 =?utf-8?B?cWJJVzJrTkZEc0I0bm40NGlJN0ZHSzVsUjdDU3FCMWIrc2ZvQjZDQlJRTEhK?=
 =?utf-8?B?ajI0K09tdWFlR0JHeVQ4a2lxcW9MckQ1SmpaWmg1dGNRVUtOUHdRQ0MzZW1Z?=
 =?utf-8?B?MEtqSFJrK01DWTc0RGNma2tkUCtlMHAySytML2x3WWlkdHJnb010cVhkQXdy?=
 =?utf-8?B?ZXVtSXZpaHpZeWFUQ1BiWHBkNVlJOWJVTzJyLzBRQ1ovd2ZZNDBFUUhacGZ4?=
 =?utf-8?B?T2R4SVFkbjNmY3VDOGNLUk5jU0FNeDhmOHplVlVsbXBSNW5KQnFodi91a0hG?=
 =?utf-8?B?WW1KcjlwS2FKa0JwUGl5TFRMNGZHWVd0OUlNSFFad29kczRTQnY0SHRUejZr?=
 =?utf-8?B?dXZWNmVaZmJRUVMxQ1ZGRm91eHRtZXJxNXQ5SkhvRExVeGFncUVMSWdENXhU?=
 =?utf-8?B?TGFUbzhBVjdFaGJqemJtZDNIQkdZWmxTUlBmeENxbVlzY3ZrbXVQUmdTcWNF?=
 =?utf-8?B?aFVZVFZDak9YdFhpTHh5ekdwMzIzWGdvcW5NL3d4R0ZJYUgvQWxQVEFtSXhl?=
 =?utf-8?B?Y2oxdllGUWhZYnJnK0loTnpVTEV2MWowQzJ3NTNNaTlhU3AyR0VEM3BoWFpu?=
 =?utf-8?B?ZkpXcWJnNWxXYVNjM2FXZU9IWEx5anAvNk16VGNqRjBhOXlXVGNPaXRRNnE4?=
 =?utf-8?B?SStIR2lQbEp3ckN3OER6UTA4dmNKY1JEeFAyYkg5Y3VvRzZOK0tKSWRwc09U?=
 =?utf-8?B?YjlLY1daazdIbDQ1V3FSU0dzMW40Tkc4Z0p3MGFDdGFRMVFVTTZ1QlF0TWtp?=
 =?utf-8?B?NHhwZWQwOWlIQUlHaGZRRnM3dTRQWWE5TW9ySWx4VjgrcVhJN1JnbkQvVHBD?=
 =?utf-8?B?RWsvYzlKM2FERTJrVnd1MkVjWnk2Z1RONDZNWU1SQ1J0MytES0tOd200WnZo?=
 =?utf-8?B?eHFneVRmc1I1RHhGM2ZzRkVES0tndlc4RUxOUGwzdDJzV005M2t6K0dqT0Ux?=
 =?utf-8?B?WXdoYnpodGdpS0lDazcvMWZFdWNPYjhwbUh4TlVsOUpOdG5oYjU3OHNSNTdo?=
 =?utf-8?B?TEJxdkNmcXNnU21lV1dKbnQvNzBaK1F3U2hBUFlpVnhoOE8zcWRucU12OGMz?=
 =?utf-8?B?SnhFQmYwaWJMcjJGdFp1a0hMRUNFVHNBelB2Ulc3bUlIdVJzSVJLQzkzUWVx?=
 =?utf-8?B?ZXNaazRQcm05dlU0WjFoenNGTk5zWWgvSjNPdFJ0Q2NtWFo4bW5nZzFhT1pr?=
 =?utf-8?B?Ti9WZFp0VGx2eitBcHJraWtReEFkSnZqc0JDVXZuZjFwRmhqdUorSmEzdVJ1?=
 =?utf-8?B?dzRMVzRJNUlZbUpUSHZPZVpNL2RBQytDTll6N2NNSG5xa1BPRGVMUS9mWDJk?=
 =?utf-8?B?Yk1TbVBWQnRYUUg2cjVpalBhU2FhRGJyQkJLeVBwZzNZTnVhWXhnYy83VVY4?=
 =?utf-8?B?U0hRcHZKODZmd3RrbzcwZ08zRi9IYXpPT2xlQ0dINzR2VFE0L2VTNlkvek1y?=
 =?utf-8?B?ZzA0YVl2OHpuWmhqRmlxMGVUWnBza0E2c0pLaWY4amtkYWJ1cjgydGJwRXVB?=
 =?utf-8?B?cFVUa1dEeUFuYVFTaHR6cS9oRjNQVlM2Qi9ZQ3Y2dkwzckNzZFFpbTZocUFY?=
 =?utf-8?B?RjJjNDZvNVo0ODJFUVpzTzYzWjJkMzNDTWFhckliY1ZLK0tBMjlkaDRRdWVC?=
 =?utf-8?B?MGJRSGYwZ3M5WFg4U1pIUWN5UDF4RHBmT2hoZTcvSjB2ZWVPRDdENXc5UlRQ?=
 =?utf-8?B?UktJYnhPTDk2dVE0bEZjclk0b29SUzRxRWNqeklyMVQyQmdoRU5OcHYzdEw1?=
 =?utf-8?Q?8o71M6ERk/+W6VLEgyzRTsw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b07a0f-ee7f-41a8-6695-08dc6e0a2442
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 20:21:41.8659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3o/nOEyIfLrwLI3kilP87UJJUkgEnUAdL5h4BSWgSOqswtmOpWmZxidYfJzomlFFj4e++XjtsB92EqfwQN1EdS21887j61U8biRlYToaNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

On Fri, May 03, 2024 at 11:46:31PM -0700, Lucas De Marchi wrote:
>Extract ignore_space() to be used in other places.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/igt_drm_fdinfo.c | 12 ++++++++++--
> 1 file changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index cab677df2..b3f6fc35a 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -53,6 +53,14 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
> 	return count > 0 ? count : 0;
> }
>
>+static const char *ignore_space(const char *s)
>+{
>+	for (; *s && isspace(*s); s++)
>+		;
>+
>+	return s;
>+}
>+
> static int parse_engine(char *line, struct drm_client_fdinfo *info,
> 			size_t prefix_len,
> 			const char **name_map, unsigned int map_entries,
>@@ -115,8 +123,8 @@ static const char *find_kv(const char *buf, const char *key, size_t keylen)
> 	if (*p != ':')
> 		return NULL;
>
>-	for (p++; *p && isspace(*p); p++)
>-		;
>+	p++;
>+	p = ignore_space(p);
>
> 	return *p ? p : NULL;
> }
>-- 
>2.43.0
>
