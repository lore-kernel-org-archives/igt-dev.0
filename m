Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FD9EF5864
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 05:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DDD10E219;
	Mon, 23 Feb 2026 05:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T66au3je";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1C410E219
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 05:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771823508; x=1803359508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5aztY0oZVJhnBxzhx+tDQmhn4E+KzAfykJDxn9Gw0Tg=;
 b=T66au3jer3Mifvab3Ef7tnSbzoeyNnYVVPv4U7V4ACnOggYl7dgp3br7
 tzmPdTXiRMibtFpUlEp3d2pEoXIZ2loNxOlvxNKfxUQSNRDru8ZmoV6D3
 ReZHva3Z04Dma/Yub8KkEci6bLfH2nzF3nsx3mKYAj6Yu02INhMb37OCm
 G+5uSkSEpv+o3pSrJJPhjAGQbfMofjErtyWxq6uiGh+PwhoLTV6EG1EGW
 IUhC2hJNQZEDojT8jSLuR5lL4xwereQPXI+uR3c1+rA5R8BbzoiZGDAe9
 SPMC4U3D4lslutrWMwTWfGEzVbrOFbi++dJ57knYqKz13lLxL/D7PolMf g==;
X-CSE-ConnectionGUID: c0o1uGzTSSCY+cHgLEI8YQ==
X-CSE-MsgGUID: XcCaT3y2THSVv5x+++UbEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72519203"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72519203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:11:48 -0800
X-CSE-ConnectionGUID: vCqoojphQkKdsVcbSMH7Iw==
X-CSE-MsgGUID: mzeT2+sKSzS4mqrCL1fE5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219570662"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:11:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:11:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 21:11:46 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:11:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WE2Z4Z+bWYfeBwXRrqpsIgTuZ96pfeBXziOd/RnVsTE4ECPUg1SuqjeMslvBzLEzKtpx0CZaqKJN3IYi6O9ZB+6vQoK8SY7WQidB2vXc1efMTdNBf6TRGDnVt4nRnKRLkgWI2vVjQNxty2Ob9EQw64Hwx2EX8aH8N0ru4Ywvb1FT01PEppCh5590HN9hPfiGAPO99RlE0Zsnn/+HKH8NvQvu1DltKlBcKG2FG9lo5p2cbBYqgJ4To+NxNHQlP46ZBOuk2WXHEIWx1mYc63G+ReNk4xI6VHvx7OQiXB6gx8wlr0VNqagGfv9aGeC3DRey12gnQSfPBd1TTSSm29zM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aztY0oZVJhnBxzhx+tDQmhn4E+KzAfykJDxn9Gw0Tg=;
 b=KDeAZu5EkLljGqXxx8Kp8OVAsUm7xFtDPkDf0HmJo1iZRSba6BpmHj3vlF3F3dxiE/JimiQay8oxrHoHrAGTm7wDRhfEQPVHhqHC43H8l5Od+YeZBMS8tQPBfDjC8BWJ0AspRtfNuudknwoimH5q3wMQhQy3gmWy0z8a212vVb+mCDZa/hOMzw1xru2v3RmOSD1V2aZCRLYI7fiBKsvXEliSQDc2kAkTvCanLrTaa+4Qe+7nLyK980fawNPbdEwaPI7slE6YJZcmOVNC2q0d/frRoL9/1XPJX/fDCZYubg1aZFCYVS79IxvN13N7F7HGdWG5JPmZIuxYEsyMXyh33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 05:11:45 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:11:45 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 7/8] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
Thread-Topic: [PATCH i-g-t v3 7/8] tests/intel/xe_madvise: Add
 per-vma-tracking subtest
Thread-Index: AQHcn7Ynj4+Y/kl3K0qS6/DQjbauzrWPxlIA
Date: Mon, 23 Feb 2026 05:11:44 +0000
Message-ID: <BL1PR11MB55254273B6A331543901C8328477A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-8-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-8-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: fc35f4e7-b439-4a8e-4636-08de729a09e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MllETy9JdzBTMWJBY3hXM0J6Mzc3YTlwYUNMSUZoUEVsNzAyY1dXckhmTHd6?=
 =?utf-8?B?K1hxY3NDOTJJc1BnNHBZR2JTOGdhMWtueWZtRFg5b0swaXg1TG81OUdSUENF?=
 =?utf-8?B?aWxhTzJoNUdNcUhOU3Z0aWN1ZmRmOGh3OURrNklCdWpDR1F0SVJSNUZjL3Er?=
 =?utf-8?B?dDh3ZFBnNndsWmxXZU01RndXM2xaeHY5b1pTUi9YNGdONlJ1NHppMncvWmUw?=
 =?utf-8?B?OWUybWFiTzJ1VzVSZEVYTHYxb2ZLRlhzam9rb1pyZ3hKRU84UUVjNlFCcEdP?=
 =?utf-8?B?dlVCK283WktmM05tSDU3STdndkw4UWVaa0pkSjZjOXR2elQzMi9uL1YwVlZa?=
 =?utf-8?B?d2pzbE53Yzg0OVYrNFZ0NkNPd0Y4M05pVlErbjRIcVRqSENBSi95blBHYVZi?=
 =?utf-8?B?ZEgycm5BMURaUk9QaElyZlYxOUN6ODloNnJJQlFiWk16RnhMbzNJYmFyR2pn?=
 =?utf-8?B?azdESHQ0cVR0b25rekZqQUlZd0xZM1E2K1FaK2M0bWVWU3FUTVpSNlltOER4?=
 =?utf-8?B?aWd4Mm5hV21tRmxPN0dlWlNyZHB4cnlNL3I3Y2FURGVhazVxYmVDNWRaZS9Z?=
 =?utf-8?B?TWdlNjhBbnZtRjhONlhkSFRxTisydDlmYjlWMzZQdGx6T1FZdHA1QnkydUJ6?=
 =?utf-8?B?bjZ2VzZtZkxzMjJvTzdPWFE5YVJvZCtsNHZzQUFDeURDQzhtbHZ4ZlZVbFRP?=
 =?utf-8?B?TUVPNXRrSzBBUmZLa2Y1Vm5qTllidVkwT0x6WkdaYjBIUktsWCtaWklxTVJD?=
 =?utf-8?B?bVduWGJtVk5RbzRrczdkaG84Q3h3WWN1UzVLMGhOak1TTWJpL1MxL0xYU01i?=
 =?utf-8?B?cGJaVjhuMXI2SVptOWFQZXhpTEpLbDc1Vk80T3ROM29HUzN5K0pKRk5aam16?=
 =?utf-8?B?RHFLdE81Rk9OMHlHV2g5U2gvSFZIY25BNHFzY1FDLy9OdGFZMHl2anFpSVZK?=
 =?utf-8?B?aWsvWDZLYVVaSk4yNFM4ZXRQV1lqM0UybUcyOTYvZjMvODRCTUt2M2hrWW44?=
 =?utf-8?B?bFliNWxWYXpWYWZxbzEwOXVDOWQ1UHlFUzlXdUprK1RRdVBMbUdQYVV3ZEpP?=
 =?utf-8?B?MnR6MVdTZ0dCbzg0KzE2Y240MHMxYXE1ckhTcXNDdnpFd1BBaXRjUUdGcjh1?=
 =?utf-8?B?RTMwSUVZMjBxM21QZDhHQW9jUi82RWR6MHBNTjh5WURUTWJya0tQMjMyK2Vq?=
 =?utf-8?B?elQ4dUx3eFJZNjlQVncwOUo2VG0vY2xtNnRlcjVOTWprcEpMVEwxTTFzYWxZ?=
 =?utf-8?B?bHVidWY2Z2x0ck1qSVBWOXkwY3YwQmF6ZHR4Q3EwR2FMdTRPcHBRL1ppaG11?=
 =?utf-8?B?Ti82MnlSYUpGVWdNajB2elRzYUlnYlFlUlRFbzdNb2NBMTlhRjJGMk9QQVpp?=
 =?utf-8?B?TTUrTHE2dVQ1N1VVNnFMWWEreU1kbEVnOHQxdTBMYUR2bERYaEV1SWVlWWlj?=
 =?utf-8?B?YUs0LytnajRwZVBqM0hENTV6ZUJ2ZE1WUnByMWhuaUFWS1h6ZURQeHFhR0Y5?=
 =?utf-8?B?b0s4VHliWXdRc2UxTEY1dnFTZFBOaVYrbmVOWVBsUXJpTE1wVlRJaFpqOXV6?=
 =?utf-8?B?Z1RCSjJiYzk2bmRZQ0xJS25zMlR2WXlLZkNMbUZaaVVzVlhiWUpxdGxZNzZ4?=
 =?utf-8?B?N3FpYmtKMXM2UFRsT2xPT212cFF3aVo1bE95L2YwemMra0V6TzNHMG02V0h3?=
 =?utf-8?B?b3ZSMzkxaEdqU2M4OW1mRkx4NGViMHFYNGYzUnlnZDJpdDg1a3NmMXU3OXEx?=
 =?utf-8?B?Q2k5R0lwbkVHNkdWRTBHblI3Rll5U1hpV1NtZkpaWnZFMFVSSFl2RWN3enp4?=
 =?utf-8?B?YzRXcUZ1bUZsWFprUjMva1JMVHVVY2xnYVZZNWhiNXovQUdMaWRBQ1VYSEl3?=
 =?utf-8?B?TVh0R2FzTllMQ0tzaGkwM0Ruemwvd0lzVTRjT0JmU0xNVm5NVlo4RjZHYzhR?=
 =?utf-8?B?S3hoMEZKN1dtemJLOXAxWGswZUFzY1ZuUzBMd3RPd1cvd215UC9mSkpTVk9S?=
 =?utf-8?B?a0VZQi9JeGRRbzRvTTFxb1FJVEo3ZWU2RlZhWVIra3BqRXQzSTRMZzNXL0VY?=
 =?utf-8?B?MmFnTzRhUTkzVitpZmE2dUVDY05LMnZzREVzaUlDOEw3dFAvcmRoUUt2MlI4?=
 =?utf-8?B?Si9RRkRvREhVcHQ0V010NVc1TlBRdVNiR3Rub2FBay9KbkY1OW9QSWdCd2Yx?=
 =?utf-8?Q?G8w5A4POK5S2F/SxExV1ifM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTk0bHNxNmI5R2taZGdGODFYNncwUjdvblhPWW1DVVVVN2xRc09YVk9oL0tE?=
 =?utf-8?B?VU9zS2RCdW02dVZmcUpSeHVMdEZRTkdhd0lLZ3krUjNoRXZ0SGh1cnAxelVT?=
 =?utf-8?B?R204KzM5dlpsdTVQWDZBWkY5Yk9aTlZ1bm5ZdWdPYU1xWUtad2ZjQS81eHUx?=
 =?utf-8?B?MXdiZnpsVFR3Z0t6Skt6R3dMazVzSDFaUVVkeGU5eWtJVE15WkY5R000Tk02?=
 =?utf-8?B?bmEyWTBBVG15WnRxd2JhdUk1K2ZBUzV0d1MwVlRrS2F5T3o0N1c1RjlCZmsy?=
 =?utf-8?B?ZmI4UmduS0tBNWpxaFE5aDk2MTlxMUs1a0R2aGlXZjN2L0wwNlZZTmVCV1pa?=
 =?utf-8?B?YkZUSlRsbllYcEY4OU5RNlJDZTBqV3VYUklJd0w3Yi9Gd0N5TW5vcHYvNi9t?=
 =?utf-8?B?eXBlOC9GZ0ltcGtwNjg0cmJFQk12OFV1M2UyUWozSmNRY3lCNjU4cU45bmw0?=
 =?utf-8?B?WDZkN3hmbkV5WEZwS1ZpN1Q2U3c1ZXp0K2pQRTl6aVNlQXNkVnFyZTZtRzVJ?=
 =?utf-8?B?c3hnWGpJaUhiNmdvTThkVlFDWjJNa2ZheExqYVVHUGtJNnlqVktoOXpFNmVa?=
 =?utf-8?B?T3dYUEpobEhTbWdRbjBpeGQvcnhMdFZtTVV5ZDY3MXhJNmgrK1c3K3p1QVJI?=
 =?utf-8?B?TFJXbW5YUnQ5b2VVRWhhdDJRLytDUUVQYmducm1NYWovWkYyZmZBdyswR05S?=
 =?utf-8?B?bUphUlc3eGJ1MVg4YlA4UGZOTGMxVWprQUpteXdZWDIwc09VOVJJZUJqN0lj?=
 =?utf-8?B?eUtPbTMzOU1QNHZYcTdwUEp3WWhBM1h1WGtrK3pqd0l4RjY2UExPeEtLTTUr?=
 =?utf-8?B?Y3Y2SFcyTmg2U2cweDlnQmF6cGd2U2g1a2ZiczRSWGplU1lqVjJmem5ybFFa?=
 =?utf-8?B?dFd5L3Q5YUhBOU5NQ1RhNEtNd3IwU0g3UGx1YVZJYUVWMnYzSXFpb05OYXR3?=
 =?utf-8?B?RTdpeVZjT2NrYUpFRjd5ZE9FRFU1a1o5UWhBdm42d29jb1Q1SFVRNFlDeW13?=
 =?utf-8?B?SmpFWkJUMllHMVBDWUVJbmdVOFJkUExGM2tqS2RqaWxBSHh2SitXNGtWai81?=
 =?utf-8?B?L0h1dGhyazYzU0FGZU9JVnAxRnlxNk52Uyt2T2t3VnNRZXJKQXUyS2tNZHlj?=
 =?utf-8?B?MnVvLy9xbDVRS3ZJdTdXVWJnd25NQ1ZmQ08xdHM2dUhjMzJwMFNtakh5UUxT?=
 =?utf-8?B?cFFIVkFSZW9NNmZlQ3doUlYrV0RqbHNvY3hQaGdYNzlPMElDVVcyQ2JVWmpW?=
 =?utf-8?B?NWhnVWdwRXlwWjlrZUprVnNNSVg5MXBBbkRCdVh3aDN3eU84WEc2TFlEVWJx?=
 =?utf-8?B?MmNOUkFYRC9CQ3dNVFJYdWVqTHU5aW5SMWppazFyU1lvVW5qZ2tpczF4Skw4?=
 =?utf-8?B?UUFSVWdJRUdRbCtiYkl4TmpubVVpLzVPbDRIMXhDOHZHTXQ4SEFLbEFPb3ZY?=
 =?utf-8?B?L3MxL0hPcW56ZHR0RzdNenVoMXhlUlZYc0ZMaFZVYW9jRGxDMVBjLzV6TEdp?=
 =?utf-8?B?d1cvY2ZLRnFKeGtRMm90ZHB1OXBjU3pLb0xHdnJvNnNZNE1meHZQVTZYckJN?=
 =?utf-8?B?a2dMNnNxTEk4bEVYNnY0ayttRkluYVRpWTJvemQwQ1NsajlWeU5ZRXo0elp6?=
 =?utf-8?B?NkVtOXptS09pQkxOcS8ycWNLNk54K2NVRTN0bUY4Qi92MEs1Mi91aGlDakhV?=
 =?utf-8?B?ZW5hMlBQSnBiejJvZWNQRmZaSldzVS91ZWdBc1B3TkNBZkUyVDhZZEpnbDNu?=
 =?utf-8?B?SGFmU1dCMVNhNEp5M1pQejBMZlpTL0hBVUs5QkRheCtod0pGK0RUR1cxRmJr?=
 =?utf-8?B?ZzV5a0c2VjIxTlZvY2F2RGZicURwa01Ib3kzMVpjOHhHY1lna0J3Y2JxOTJK?=
 =?utf-8?B?ZVVPRVVrNjJQOVVnaEx1U2pOYzMxYjhLUXE0UmFjbDRKRlI5RzM4M010b2du?=
 =?utf-8?B?Y1RaYjJjdE01VldscjhlZ09vRUxUZFUxejRpSTdzc051emlsR1ZhbnFzcXhD?=
 =?utf-8?B?bk1Bc1lNWkNLYkdMU3g3Z0lCNzVOK3JWUWpscFRzaGU5aUlUcStmWXgwTjVM?=
 =?utf-8?B?SmFtN2Z6cVE1eG9Jc3VGejR4aTJWUVdQYXp6Y1B0T3ZDYVRYbVNWOU11T2FG?=
 =?utf-8?B?Ri9QOXhTY25oMTZwR251WFZtWlFvdDNsbFk3Y080NHRUSWtLRHBrSXdyQjFF?=
 =?utf-8?B?R1p1cG1JbmFHOU1Kc3ZrY3hUWVltdzRQUjFRVkhwRmxmcjhic0FoQm5lZU03?=
 =?utf-8?B?MjFON3MxS0lZWTZlQ0RCRzMzNlVKcnNYMzlVSjk3akpySG1KUmg0ZlY0Vll4?=
 =?utf-8?B?UU5MZGF3b0RkWHNvRDNiY29KS1c0VUZjZTBZS2Y0L0ZTT0hHZTkwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc35f4e7-b439-4a8e-4636-08de729a09e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 05:11:44.9281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIpvWavVOkAVHjTo+m1FU6/q9vVhk7JoMEz/GeUC78Kj0t595u2SssShJySGnuzDuTRo6vpSMyGw9OEmTiwKWnnOKVSk1CeD5ndL1l3BiP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDcvOF0gdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZTogQWRkIHBlci12bWEtdHJhY2tpbmcNCj4gc3VidGVzdA0KPiANCj4gVGhpcyB0ZXN0IHZhbGlk
YXRlcyB0aGF0IHB1cmdlYWJsZSBzdGF0ZSBpcyB0cmFja2VkIHBlci1WTUEgd2hlbiBhIHNpbmds
ZSBCTyBpcw0KPiBib3VuZCBpbiBtdWx0aXBsZSBWTXMuIFRoZSB0ZXN0IGNyZWF0ZXMgb25lIEJP
IHNoYXJlZCBhY3Jvc3MgdHdvIFZNcyBhdA0KPiBkaWZmZXJlbnQgdmlydHVhbCBhZGRyZXNzZXMu
IEl0IHZlcmlmaWVzIHRoYXQgbWFya2luZyBvbmx5IG9uZSBWTUEgYXMNCj4gRE9OVE5FRUQgZG9l
cyBub3QgbWFrZSB0aGUgQk8gcHVyZ2VhYmxlLCBidXQgbWFya2luZyBib3RoIFZNQXMgYXMNCj4g
RE9OVE5FRUQgYWxsb3dzIHRoZSBrZXJuZWwgdG8gcHVyZ2UgdGhlIHNoYXJlZCBCTy4gVGhpcyBl
bnN1cmVzIHByb3BlciBwZXItDQo+IFZNQSB0cmFja2luZyBmb3Igc2hhcmVkIG1lbW9yeS4NCj4g
DQo+IENjOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gQ2M6IFBy
YXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBDYzogTWF0dGhl
dyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2
bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBIaW1hbCBQcmFzYWQg
R2hpbWlyYXkgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEFydmluZCBZYWRhdiA8YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0
cy9pbnRlbC94ZV9tYWR2aXNlLmMgfCAxMDkNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTA5IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9tYWR2aXNlLmMgYi90ZXN0cy9pbnRlbC94ZV9t
YWR2aXNlLmMgaW5kZXgNCj4gNTFlZjRmYWQzLi40ZTdkZjU0YTcgMTAwNjQ0DQo+IC0tLSBhL3Rl
c3RzL2ludGVsL3hlX21hZHZpc2UuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9tYWR2aXNlLmMN
Cj4gQEAgLTIwLDYgKzIwLDcgQEANCj4gDQo+ICAvKiBQdXJnZWFibGUgdGVzdCBjb25zdGFudHMg
Ki8NCj4gICNkZWZpbmUgUFVSR0VBQkxFX0FERFIJCTB4MWEwMDAwDQo+ICsjZGVmaW5lIFBVUkdF
QUJMRV9BRERSMgkJMHgyYjAwMDANCj4gICNkZWZpbmUgUFVSR0VBQkxFX0JBVENIX0FERFIJMHgz
YzAwMDANCj4gICNkZWZpbmUgUFVSR0VBQkxFX0JPX1NJWkUJNDA5Ng0KPiAgI2RlZmluZSBQVVJH
RUFCTEVfRkVOQ0VfVkFMCTB4YmVlZg0KPiBAQCAtMjA1LDYgKzIwNiw1OCBAQCBzdGF0aWMgdm9p
ZCBwdXJnZWFibGVfc2V0dXBfYmF0Y2hfYW5kX2RhdGEoaW50IGZkLA0KPiB1aW50MzJfdCAqdm0s
DQo+ICAJeGVfd2FpdF91ZmVuY2UoZmQsICZ2bV9zeW5jLCBQVVJHRUFCTEVfRkVOQ0VfVkFMLCAw
LA0KPiBOU0VDX1BFUl9TRUMpOyAgfQ0KPiANCj4gKy8qKg0KPiArICogcHVyZ2VhYmxlX3NldHVw
X3R3b192bXNfc2hhcmVkX2JvIC0gU2V0dXAgdHdvIFZNcyB3aXRoIG9uZSBzaGFyZWQNCj4gQk8N
Cj4gKyAqIEBmZDogRFJNIGZpbGUgZGVzY3JpcHRvcg0KPiArICogQHZtMTogT3V0cHV0IGZpcnN0
IFZNIGhhbmRsZQ0KPiArICogQHZtMjogT3V0cHV0IHNlY29uZCBWTSBoYW5kbGUNCj4gKyAqIEBi
bzogT3V0cHV0IHNoYXJlZCBCTyBoYW5kbGUNCj4gKyAqIEBhZGRyMTogVmlydHVhbCBhZGRyZXNz
IGluIFZNMQ0KPiArICogQGFkZHIyOiBWaXJ0dWFsIGFkZHJlc3MgaW4gVk0yDQo+ICsgKiBAc2l6
ZTogU2l6ZSBvZiB0aGUgQk8NCj4gKyAqIEB1c2Vfc2NyYXRjaDogV2hldGhlciB0byB1c2Ugc2Ny
YXRjaCBwYWdlIGZsYWcgZm9yIFZNcw0KPiArICoNCj4gKyAqIEhlbHBlciB0byBjcmVhdGUgdHdv
IFZNcyBhbmQgYmluZCBvbmUgc2hhcmVkIEJPIGluIGJvdGggVk1zLg0KPiArICogUmV0dXJucyBt
YXBwZWQgcG9pbnRlciB0byB0aGUgQk8uDQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkICpwdXJnZWFi
bGVfc2V0dXBfdHdvX3Ztc19zaGFyZWRfYm8oaW50IGZkLCB1aW50MzJfdCAqdm0xLA0KPiB1aW50
MzJfdCAqdm0yLA0KPiArCQkJCQkgICAgICAgdWludDMyX3QgKmJvLCB1aW50NjRfdCBhZGRyMSwN
Cj4gKwkJCQkJICAgICAgIHVpbnQ2NF90IGFkZHIyLCBzaXplX3Qgc2l6ZSwNCj4gKwkJCQkJICAg
ICAgIGJvb2wgdXNlX3NjcmF0Y2gpDQo+ICt7DQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMg
PSB7DQo+ICsJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNFLA0KPiArCQkuZmxh
Z3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gKwkJLnRpbWVsaW5lX3ZhbHVlID0gMSwN
Cj4gKwl9Ow0KPiArCXVpbnQ2NF90IHN5bmNfdmFsID0gMDsNCj4gKwl2b2lkICptYXA7DQo+ICsN
Cj4gKwkvKiBDcmVhdGUgdHdvIFZNcyAqLw0KPiArCSp2bTEgPSB4ZV92bV9jcmVhdGUoZmQsIHVz
ZV9zY3JhdGNoID8NCj4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX1NDUkFUQ0hfUEFHRSA6IDAsIDAp
Ow0KPiArCSp2bTIgPSB4ZV92bV9jcmVhdGUoZmQsIHVzZV9zY3JhdGNoID8NCj4gK0RSTV9YRV9W
TV9DUkVBVEVfRkxBR19TQ1JBVENIX1BBR0UgOiAwLCAwKTsNCj4gKw0KPiArCS8qIENyZWF0ZSBz
aGFyZWQgQk8gKi8NCj4gKwkqYm8gPSB4ZV9ib19jcmVhdGUoZmQsIDAsIHNpemUsIHZyYW1faWZf
cG9zc2libGUoZmQsIDApLA0KPiArDQo+IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklT
SUJMRV9WUkFNKTsNCj4gKw0KPiArCW1hcCA9IHhlX2JvX21hcChmZCwgKmJvLCBzaXplKTsNCj4g
KwltZW1zZXQobWFwLCAweEFCLCBzaXplKTsNCj4gKw0KPiArCS8qIEJpbmQgQk8gaW4gVk0xICov
DQo+ICsJc3luYy5hZGRyID0gdG9fdXNlcl9wb2ludGVyKCZzeW5jX3ZhbCk7DQo+ICsJc3luY192
YWwgPSAwOw0KPiArCXhlX3ZtX2JpbmRfYXN5bmMoZmQsICp2bTEsIDAsICpibywgMCwgYWRkcjEs
IHNpemUsICZzeW5jLCAxKTsNCj4gKwl4ZV93YWl0X3VmZW5jZShmZCwgJnN5bmNfdmFsLCAxLCAw
LCBOU0VDX1BFUl9TRUMpOw0KPiArDQo+ICsJLyogQmluZCBCTyBpbiBWTTIgKi8NCj4gKwlzeW5j
X3ZhbCA9IDA7DQo+ICsJeGVfdm1fYmluZF9hc3luYyhmZCwgKnZtMiwgMCwgKmJvLCAwLCBhZGRy
Miwgc2l6ZSwgJnN5bmMsIDEpOw0KPiArCXhlX3dhaXRfdWZlbmNlKGZkLCAmc3luY192YWwsIDEs
IDAsIE5TRUNfUEVSX1NFQyk7DQo+ICsNCj4gKwlyZXR1cm4gbWFwOw0KPiArfQ0KPiArDQo+ICAv
KioNCj4gICAqIFNVQlRFU1Q6IGRvbnRuZWVkLWJlZm9yZS1tbWFwDQo+ICAgKiBEZXNjcmlwdGlv
bjogTWFyayBCTyBhcyBET05UTkVFRCBiZWZvcmUgbW1hcCwgdmVyaWZ5IG1tYXAgZmFpbHMgb3IN
Cj4gU0lHQlVTIG9uIGFjY2VzcyBAQCAtNDY1LDYgKzUxOCw1NiBAQCBzdGF0aWMgdm9pZA0KPiB0
ZXN0X2RvbnRuZWVkX2FmdGVyX2V4ZWMoaW50IGZkLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZQ0KPiAgCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gIH0NCj4gDQo+ICsvKioN
Cj4gKyAqIFNVQlRFU1Q6IHBlci12bWEtdHJhY2tpbmcNCj4gKyAqIERlc2NyaXB0aW9uOiBPbmUg
Qk8gaW4gdHdvIFZNcyBiZWNvbWVzIHB1cmdlYWJsZSBvbmx5IHdoZW4gYm90aA0KPiBWTUFzDQo+
ICthcmUgRE9OVE5FRUQNCj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0K
PiArICovDQo+ICtzdGF0aWMgdm9pZCB0ZXN0X3Blcl92bWFfdHJhY2tpbmcoaW50IGZkLCBzdHJ1
Y3QNCj4gK2RybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSkgew0KPiArCXVpbnQzMl90
IGJvLCB2bTEsIHZtMjsNCj4gKwl1aW50NjRfdCBhZGRyMSA9IFBVUkdFQUJMRV9BRERSOw0KPiAr
CXVpbnQ2NF90IGFkZHIyID0gUFVSR0VBQkxFX0FERFIyOw0KPiArCXNpemVfdCBib19zaXplID0g
UFVSR0VBQkxFX0JPX1NJWkU7DQo+ICsJdWludDMyX3QgcmV0YWluZWQ7DQo+ICsJdm9pZCAqbWFw
Ow0KPiArDQo+ICsJbWFwID0gcHVyZ2VhYmxlX3NldHVwX3R3b192bXNfc2hhcmVkX2JvKGZkLCAm
dm0xLCAmdm0yLCAmYm8sDQo+ICsJCQkJCQlhZGRyMSwgYWRkcjIsDQo+ICsJCQkJCQlib19zaXpl
LCBmYWxzZSk7DQo+ICsNCj4gKwkvKiBNYXJrIFZNQTEgYXMgRE9OVE5FRUQgKi8NCj4gKwlyZXRh
aW5lZCA9IHhlX3ZtX21hZHZpc2VfcHVyZ2VhYmxlKGZkLCB2bTEsIGFkZHIxLCBib19zaXplLA0K
PiArDQo+IERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRFX0RPTlRORUVEKTsNCj4gKwlpZ3RfYXNz
ZXJ0X2VxKHJldGFpbmVkLCAxKTsNCj4gKw0KPiArCS8qIFZlcmlmeSBCTyBOT1QgcHVyZ2VhYmxl
IChWTUEyIHN0aWxsIFdJTExORUVEKSAqLw0KPiArCXJldGFpbmVkID0geGVfdm1fbWFkdmlzZV9w
dXJnZWFibGUoZmQsIHZtMSwgYWRkcjEsIGJvX3NpemUsDQo+ICsNCj4gRFJNX1hFX1ZNQV9QVVJH
RUFCTEVfU1RBVEVfV0lMTE5FRUQpOw0KPiArCWlndF9hc3NlcnRfZXEocmV0YWluZWQsIDEpOw0K
PiArDQo+ICsJLyogTWFyayBib3RoIFZNQXMgYXMgRE9OVE5FRUQgKi8NCj4gKwlyZXRhaW5lZCA9
IHhlX3ZtX21hZHZpc2VfcHVyZ2VhYmxlKGZkLCB2bTEsIGFkZHIxLCBib19zaXplLA0KPiArDQo+
IERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRFX0RPTlRORUVEKTsNCj4gKwlpZ3RfYXNzZXJ0X2Vx
KHJldGFpbmVkLCAxKTsNCj4gKw0KPiArCXJldGFpbmVkID0geGVfdm1fbWFkdmlzZV9wdXJnZWFi
bGUoZmQsIHZtMiwgYWRkcjIsIGJvX3NpemUsDQo+ICsNCj4gRFJNX1hFX1ZNQV9QVVJHRUFCTEVf
U1RBVEVfRE9OVE5FRUQpOw0KPiArCWlndF9hc3NlcnRfZXEocmV0YWluZWQsIDEpOw0KPiArDQo+
ICsJLyogVHJpZ2dlciBwcmVzc3VyZSBhbmQgdmVyaWZ5IEJPIHdhcyBwdXJnZWQgKi8NCj4gKwl0
cmlnZ2VyX21lbW9yeV9wcmVzc3VyZShmZCwgdm0xKTsNCj4gKw0KPiArCXJldGFpbmVkID0geGVf
dm1fbWFkdmlzZV9wdXJnZWFibGUoZmQsIHZtMSwgYWRkcjEsIGJvX3NpemUsDQo+ICsNCj4gRFJN
X1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfV0lMTE5FRUQpOw0KPiArCWlndF9hc3NlcnRfZXEocmV0
YWluZWQsIDApOw0KPiArDQo+ICsJbXVubWFwKG1hcCwgYm9fc2l6ZSk7DQo+ICsJZ2VtX2Nsb3Nl
KGZkLCBibyk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0xKTsNCj4gKwl4ZV92bV9kZXN0cm95
KGZkLCB2bTIpOw0KPiArfQ0KPiArDQo+ICBpbnQgaWd0X21haW4oKQ0KPiAgew0KPiAgCXN0cnVj
dCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7IEBAIC00OTksNiArNjAyLDEyIEBA
DQo+IGludCBpZ3RfbWFpbigpDQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiANCj4gKwlpZ3Rfc3Vi
dGVzdCgicGVyLXZtYS10cmFja2luZyIpDQo+ICsJCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdl
KSB7DQo+ICsJCQl0ZXN0X3Blcl92bWFfdHJhY2tpbmcoZmQsIGh3ZSk7DQo+ICsJCQlicmVhazsN
Cj4gKwkJfQ0KPiArDQpSZXZpZXdlZC1ieTogUHJhdmFsaWthIEd1cnJhbSA8cHJhdmFsaWthLmd1
cnJhbUBpbnRlbC5jb20+DQo+ICAJaWd0X2ZpeHR1cmUoKSB7DQo+ICAJCXhlX2RldmljZV9wdXQo
ZmQpOw0KPiAgCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gLS0NCj4gMi40My4wDQoNCg==
