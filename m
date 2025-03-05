Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185BEC19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 16:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CD689580;
	Wed,  5 Mar 2025 16:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnYGpHQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7635F89580
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741191937; x=1772727937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ovKOUg/o1vKwZZ7U7pYrdutqAQJIlcN9ZozwcnYvyUE=;
 b=LnYGpHQirqY3280kCY+hbNraqB3mutnUkyoiN1uGAeCg95mvkXZNDL4G
 TxChMFGvh3oWtkQizYI8TQYRVVIR4w5Ebos7Noxg8v/xPzEaNcDzM7FO/
 +hzWWqRUKFuuvK+cPF6fJsLLHJlgMwj1kXSC1cgoH/ah6P8kwTmEvm3cm
 H4/S0tKgh2uBJHb19+czu5VFy/Ba9S68o3Zhi15c+OzLtr+jQSbR9+60a
 63RgzE7tcXvHoKsNl2T0rl74qJh4ekuQtmn9ifmDRFYsHYHpXJM4Alsjw
 VbGbe5eQeyyb9p2YaNYlCzw7iPfrom+QcKXGutsulSFOGweB7M9v4V0X2 w==;
X-CSE-ConnectionGUID: ma5BN+wQSnGzjZRFM4e4oQ==
X-CSE-MsgGUID: K6P5JyxqSt+I8zHVmo0Q+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64611286"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="64611286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:25:37 -0800
X-CSE-ConnectionGUID: zLjqnIv7Tz6zg+cvQ3jwNA==
X-CSE-MsgGUID: 6CYxjSC6TpybiBmPHkxFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123939787"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:25:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 08:25:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 08:25:36 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 08:25:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGZQ5bdW8+sbqr1Ys4YOBKxJbL4nZkyhlc7djkwYyLTcjHiE5MZ8oAVpRTZ13qNHkmdBn3p7A8fz9oZqoSdzHWkslO0IvYZheu+geTsbp9FTnDxJFE1sJHM9KJUQ26jKtmxUzbDVOoRswJMjk5OlqzAGz/bEBq+hJJkVpFJdA0JKX9O1tbxWY6g8X1nOHKG2XqjEmkrOhA1hFzzc2n7a2PU17zeFdZpF/Lu7JjXe7R42W3cGlr03xA5AhwLy1Mwnvk82XWoJsep2GRi5ejYL/Rz3HLv6EEcDLNwWz0P9E4BnEVXNOOMe/fgdTf3hPAVvhNiMA4dVEBwW49xgTyvSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgvdNDtFD2SjXq/3xR0d2fvU7hkc5g3FLvQEkVd/zuQ=;
 b=JPn1FvW/z6/kn5RbIDTab7kVKd2TlHsxDDeFUWEZdXwbSnvVedh7VGwOSva08tgTapFVe+J4Yjxa5SbB2TiZXhqqHITGMoY9buq+R/G24z07XmFxESX4WVCftO2hSPHZ1nXkf22wrTZWhc6/B3+mxZF6mVmxjODzILQERw//PZLahxfXJNO7dpjFth5doMOljmMBoCiZhv4eU/Spf2yJpajPgDIbKuQyhwiCck/0BOfW+KPd49oo/7rYlnDkhsMjB6tpo0if4VYbchWHnFbtEL5571MrcK4Q9AVuM5zWG51XebSxIcHBSWLOMn3GipOLtByIfzswPMl6JMijzT3pqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 16:25:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 16:25:33 +0000
Date: Wed, 5 Mar 2025 08:25:32 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_oa: Enable OA tests for
 simulation
Message-ID: <Z8h6/GcCVYlZpxUp@orsosgc001>
References: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
 <20250305005716.168646-3-umesh.nerlige.ramappa@intel.com>
 <877c54t6is.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <877c54t6is.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0327.namprd04.prod.outlook.com
 (2603:10b6:303:82::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb0b2dc-5650-473c-2f5c-08dd5c025a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3J6THZpS2twQmtVVnlsZG55M20zK1hKU1V0YnlaQjNpblpBMk80b09LQUxC?=
 =?utf-8?B?bEtNMkk3RDFTZlpmNHlJcmlHeHdONmJZdzNRdytyWFhpdFpoSk1Sa3VBVGdM?=
 =?utf-8?B?Zi9ZcWxkeFFSbTFGcVQ3MWZiY1BLc3A5UTB4TXlLMHcxQ01VZFI0M0YvQ1Q3?=
 =?utf-8?B?d2R4Q3V5QnJzRks5N21IZytWTmZnNU1oU1kzMXAvQTJNTzd4eGFLeW5GU3Fo?=
 =?utf-8?B?QkVpM2FrY2RKVnRncjh1c3Q1d25PeUNnMVdJaVB2cXZCQ21seDRjRDZRNnEz?=
 =?utf-8?B?U0FHYXhFUndLZEhTeVF3NHdiR0xUYXhzVTRQK3EzQy83dnZVdEJ5cXE5eTVx?=
 =?utf-8?B?M3JiUE5VSEd5UVcvRGJpT0dpTHl5YTVHRTNJRXhwanlSUkt3SDhKdlhmRFlh?=
 =?utf-8?B?V1pwWFFsaDR1ZW1BbEVsY2JBeWQybUlDRXRFVjVFTDVLMDBGYU1XdXBMMTB6?=
 =?utf-8?B?V0lPaHpzK2hwYitYOUR2dm1rOVpZdUJjbUFMTFUvc1o0b2VCcTYvbXo4QXJF?=
 =?utf-8?B?K2tVVmRHQ3BkZEMzVlhBOWFtVTd2ZnBnKzFrdXVJcW1XWnFVTUFIVGhxZGls?=
 =?utf-8?B?dDlWQXVReW0yeHBoWVhnTUFacTd6dThNalUreEswM0lSc1o2V1ZEek04UVBP?=
 =?utf-8?B?VndzdWFuUG5pa2ZobnExL2tTNGR2dnkwSjFCZTJ5dUxiNThlWTlEQkI0azdv?=
 =?utf-8?B?TUlkYlp0OW9OaHNvSzU5WFZyeG0xeFoybFEzUy9jVzlzdFBLWGdzbHFnalBK?=
 =?utf-8?B?NkVrak4xSi9RKzc4K3I3TmJpZzg1RFM3YnpMWnJuQkpVUG85QXpSSS91UE9G?=
 =?utf-8?B?V014empKZXlQNWxVL1Rvek14Qlh5anUxK3NVTUh0WWlubGR4Vmh6aXB4U2lR?=
 =?utf-8?B?bDVOalA3LzU4K2ZPYkhyNTBGTVN1WFRUTG9UQjhLc3lwb0p0bElYdUg2OVdo?=
 =?utf-8?B?c0czdzNocDU0bTdybGVSdnZJRmk0SWwrb3RaaUFxVjlKam9PbFZMaHZzeWF6?=
 =?utf-8?B?WFNPL09HQnJXQlZkOUhpZEVVNGxrV0dqZ1M5OEtwTWMvRk91YkVCMmNqNGh1?=
 =?utf-8?B?M3huNEZXT1doUEFvUy9BSm5uSkExT3RUNGVTWmZRaWFMWVpzdnlsYVVsdEJ3?=
 =?utf-8?B?MTFMQUc2WXdFZzVNVk1seGdJdkl3YVdRUTVqY1AwU0dXWU9jQUZoYUpsS09U?=
 =?utf-8?B?VGwydklEdlNQVmxIdFkrUndoL0M3N0VCSkpLVCtlbmovN3gzTVA1Wm83aUFV?=
 =?utf-8?B?V0pmWEZiY1ZrelZUZ2h1MUlHNXdRN2w3U3B2ZUxEcW9Dd0k0RElHNTV2VDNt?=
 =?utf-8?B?RE4wMkErVnIvUkpsSTZweVRaOEVhdzdXK2JWRXBVbXlxR1JiRjBWWVY5T2Jt?=
 =?utf-8?B?ZWN4R25CS3hnam5YN0xYYUh4V2MvaWlvNE9QRG5ZeElmV3JPSzdCTXRVeHFE?=
 =?utf-8?B?WkxVZmNzVThKbU1ENEtJUVBFZm00UlM4ZzZyc0VzcEVxbUtheTV2SFI2aXEv?=
 =?utf-8?B?NGVnUHUrMEQ5eXl0UHdQUDFia1diQkRrOUgxK2hGQmY1UlZIaVNBRzQ0MStL?=
 =?utf-8?B?VWpFWFpNWlJXM1pKOVRhUnRONWREUmFHaURUZWNRTTlwVTdBRjFIQ2VoS1Nz?=
 =?utf-8?B?MkNnc2Z0VDRnYmJubFN6b3h3a1ljQnlkYWdDdDNJTFFsNXdCQk9DWlZmdkhG?=
 =?utf-8?B?bEI4M0lHQjdiUHppcXNOenZkdG1GZ21vcE00WWZHUG1EWFFHYmVOUEZMbHdp?=
 =?utf-8?B?eWlScVk0ZXA2QXNiK2dLTWd2TXpFRytmQkNOSWRVL01JQnFWaVA5T2taZ3Z0?=
 =?utf-8?B?cldzMlFTVFR0RWNvQldBVXg3Q0cxQk0xT1htMG5PYk4zM2t2Q3NVMnFSV3k3?=
 =?utf-8?Q?zy9o6n2jMRAUy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFJZZnlIcVR0NXYvTDBjUmZ2b25Xa2JIY2ZiNkQrcjhHbFpHU1kvYTJ1dTZB?=
 =?utf-8?B?NUkrWmpXRnYrbTlaTjVlbGpFT0IvYUFsWDlMZXk4Y05SMkhmNWhSVFFOeDAv?=
 =?utf-8?B?ZnlkRXZTeitpaHhaM3NsY1VsRG80YmtjSmFZSEhabHhhUXdjb0lGNzdFQ2ZM?=
 =?utf-8?B?S2xsS3paWE43UExFZVArdUxsVVVCUWthTS81czk3RmlmY2F2Rm54U0w5OCtN?=
 =?utf-8?B?NDV4OXd4Ym5UT2g5RnhaVys1VzVhdk1vbkt2WXJ4dXJGVGU4aEFpK1JtbldX?=
 =?utf-8?B?eTB2Mnk3ZHVtN3BJSEFROEM2TmRoeHRGbU9xeXFvNFc5M1hnWGFqczA1L1pj?=
 =?utf-8?B?T3IwaHVqUFhaU3pkY0xSN0pEQW5sVWVJVWVzRzZuMUdyV2lHNDFWa0k0MW5V?=
 =?utf-8?B?SXl4UXJlUEpoV2srU1J4MUF1UFRIcVp0OVc0QTQrQk0vUTNSd1hTOGVDNWdi?=
 =?utf-8?B?d1hjc0VaZDk1dHk3bUdFaWJSUkh5amMvaXZObHZab1ZSK3ZGTmhuaXArV01h?=
 =?utf-8?B?Tk1tMi93WHVzUExudUlHOEVoWE9xRjFHdlYwRjNUeTJNYWtDZHM2YkdLZVhY?=
 =?utf-8?B?bmc3ZDMzYUl0UWJLUndRRXJDd1ZJUEt4aVlWcGxhbDRENGZEOGR2L0JFUTVU?=
 =?utf-8?B?ZXZkNGZHQkV6SklxRjRmbyt2dWRldjBZb0Q3MXVFNHMzN0tNZHU1MWJ5anBR?=
 =?utf-8?B?cnY4Njg4OERlcVJWVXM0YkFGYWpxbVNxL1kvSVNLNEVuME5BSkx2eFZSbHkw?=
 =?utf-8?B?bU1iczF1QWZyWnJLSTFiNTlIcExhcHJ1alVpWWxMa21vaGtteGJOYUR1b0NJ?=
 =?utf-8?B?aXdlbDZSM1BLOXFIazFlWm9mam1WUFNFTDZQVGQ5eTA3SEYwRE5oMzIyS21C?=
 =?utf-8?B?djIyVUNIbStOZEx4WitKODFiVjFHRDJ6OU5ETU94TDNiM1pUVnNNblRuRVJG?=
 =?utf-8?B?d0FuRks4ZCtjc2dlTzZSUlBJNVU0YU12alA2TWVDczNSUVllUHhYMHpJMjNZ?=
 =?utf-8?B?THBDWHNCM2lNcmJDazRhV3A4NVJPSlVmQmJiS1JWdVV5S1VCR0FpMGwwa3V4?=
 =?utf-8?B?QTRDdm9uNk03eWkzWWxJNGpOSkZKSUxLcHFpb0hWb0U3TXJvMDJPVGpSdlZ0?=
 =?utf-8?B?Um5wWVppakEyN24rR2I2VlFtWVFIY1BpTW5QTnQ2cjAySWZXUXNFMG0rVUQv?=
 =?utf-8?B?ZWhkYmhtUnVxWVVITTBLbk5YZzltQkNtK3NuSkhZbDJUc0FBRU9pZllwWkxi?=
 =?utf-8?B?WVBVU2FyYllUbVJSNjJZMEkybEhNd0NtZjVRRllrTkJLMlQ0RlFtSkNrNCts?=
 =?utf-8?B?b3dtWUVsVEN2OXBjNDFXTy9CbWRtb2w4cE94VEMySU9VeEJyU2lRQm11Ym1B?=
 =?utf-8?B?ZFI0QVFua2RXZWxlUGc3aDlLdmlQTnMwOCtDZnpvOVdHSlpWc1pEZHk5Z3Nz?=
 =?utf-8?B?RWtOeDc1NTB2MFRlMFlCY01taGNLSDlheTRJejNIeUdOMnJSQzdsMkdiOHBV?=
 =?utf-8?B?UmZPVGNkUUMzankvcWZ1TnNkTzNCdC9rRFJSSUcxVXZia1FrUERSd25ycTV3?=
 =?utf-8?B?cFR4cjNBaTkwVlc3bTZVWnpGcEQxZTJBck0rOC9pbEVmb0RVd3lwUDhSa05q?=
 =?utf-8?B?Nm4xNjZrb2NIcVJUYzFDV3d0ZG5nTWtnbmN6cWREdHZSRi9zV3krUGJCN0lY?=
 =?utf-8?B?bzZPRHBhUWVUejBEd3lwaGxxWG1vdHQ0V0JsdVFGa1J4ZFRXSUNuZnV0L29h?=
 =?utf-8?B?WW5nL29uT3Q3U3BzdlFKNnJIUjBQMkpTUGh5bU9PREs4UEZBbUdGS1VYZ1lS?=
 =?utf-8?B?UlEwSTBld3N5Nks0QjhCdE96Q0N5Ymh0ZE10VGhNZU8ybE5lZFd6cTRpd1Qr?=
 =?utf-8?B?VThtZnlaWG1GMDRCY0M4LzA3aFVRSkh5d1JOTDdWRHpDUEs4MjEyV2lvWHFE?=
 =?utf-8?B?K2IwTkgzdkduRDQyQ3JRNjdrRzZoUjQrUTBXNk5XQUVOYVNsd2tWMDQ0anNS?=
 =?utf-8?B?RTFtdDhaby9PaVJQcVNodklIRWszZS9hOVFuSlZ6YmVEUHFoQ21rQ0xLMUk4?=
 =?utf-8?B?RzAyL1FGQ0tSWTRUWVIzSUl2QkNwdWJYa0dpbUlndWJzMTcwM1BlLzBES2Za?=
 =?utf-8?B?eGl5bmpEUFNJVVRJZnNYWXJZZVRFUm1Qem4zdVFGbVFzOHV3c3VGbDZvQ2pa?=
 =?utf-8?Q?astN1idh7QAdj5zY90glgKU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb0b2dc-5650-473c-2f5c-08dd5c025a90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 16:25:33.6930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiM+1Ke6jPTEl/2XQwBQEE0nE4BKd0eBE67VGfl4ge9Nb+FcKhVQNRaEC8bd1oFAhP8QNABss6lKKhz6W3cKsL43wA+yIzMC4JpSg+6Axgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
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

On Tue, Mar 04, 2025 at 09:01:47PM -0800, Dixit, Ashutosh wrote:
>On Tue, 04 Mar 2025 16:57:16 -0800, Umesh Nerlige Ramappa wrote:
>>
>> Simulation runs are slow, so account for that by modifying the scope of
>> the tests.
>>
>> - Set parameters specific to simulation during init.
>> - Skip tests that are heavily reliant on timing and that only test SW
>>   functionality.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 32 ++++++++++++++++++++++++--------
>>  1 file changed, 24 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index e5744d830d39..06d324159211 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -1111,13 +1111,25 @@ init_sys_info(void)
>>
>>	intel_xe_perf_load_perf_configs(intel_xe_perf, drm_fd);
>>
>> -	min_oa_exponent = 5;
>> -	max_oa_exponent = 20;
>> -	rc_width = 1920;
>> -	rc_height = 1080;
>> -	buffer_fill_size = SZ_16M;
>> -	num_buf_sizes = ARRAY_SIZE(buf_sizes);
>> -	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
>> +	if (igt_run_in_simulation()) {
>> +		igt_debug("SIMULATION run\n");
>> +		min_oa_exponent = 5;
>> +		max_oa_exponent = 10;
>> +		rc_width = 64;
>> +		rc_height = 36;
>> +		buffer_fill_size = SZ_128K;
>> +		num_buf_sizes = 3;
>> +		oa_exponent_default = max_oa_exponent_for_period_lte(1000);
>> +	} else {
>> +		igt_debug("HW run\n");
>> +		min_oa_exponent = 5;
>> +		max_oa_exponent = 20;
>> +		rc_width = 1920;
>> +		rc_height = 1080;
>> +		buffer_fill_size = SZ_16M;
>> +		num_buf_sizes = ARRAY_SIZE(buf_sizes);
>> +		oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
>> +	}
>
>Just a question here: what execution time (allowed by CI) are we assuming
>for these simulation specific params?

Hmm, nothing specific. Most tests run within 10 seconds, with only a few 
touching close to 10. The oa-exponents and oa-formats take close to 30 
seconds though because they iterate over a few values. If that's long, 
we could do random formats and random exponents as an improvement.

>
>>
>>	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
>>	igt_debug("default_oa_buffer_size: %zu\n", default_oa_buffer_size);
>> @@ -4758,6 +4770,7 @@ igt_main
>>			test_enable_disable(hwe);
>>
>>	igt_subtest_with_dynamic("blocking") {
>> +		igt_require(!igt_run_in_simulation());
>>		__for_one_hwe_in_oag(hwe)
>>			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
>>				      false /* set_kernel_hrtimer */,
>> @@ -4766,6 +4779,7 @@ igt_main
>>	}
>>
>>	igt_subtest_with_dynamic("polling") {
>> +		igt_require(!igt_run_in_simulation());
>>		__for_one_hwe_in_oag(hwe)
>>			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
>>				     false /* set_kernel_hrtimer */,
>> @@ -4805,8 +4819,10 @@ igt_main
>>		igt_subtest("oa-unit-exclusive-stream-exec-q")
>>			test_oa_unit_exclusive_stream(false);
>>
>> -		igt_subtest("oa-unit-concurrent-oa-buffer-read")
>> +		igt_subtest("oa-unit-concurrent-oa-buffer-read") {
>> +			igt_require(!igt_run_in_simulation());
>>			test_oa_unit_concurrent_oa_buffer_read();
>> +		}
>
>I am assuming all remaining tests either (a) pass in simulation, or, (b)
>have legitimate failures there which need fixing. This is great news:

Correct, most pass and some need additional debug/fixes.

>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh
>
>>	}
>>
>>	igt_subtest("rc6-disable") {
>> --
>> 2.45.2
>>
