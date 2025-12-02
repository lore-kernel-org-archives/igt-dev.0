Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B20FCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 08:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEAF10E5C8;
	Tue,  2 Dec 2025 08:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWRSrLSm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADF810E5C9
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764665298; x=1796201298;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=bgK2dCRXqNzILJgMJxmcF1C7jg4dILgU/ode8v52lis=;
 b=hWRSrLSmBMPcbwy3rA87y/TXCQmlmqzUkHhMI5407yUP9spsuVgza/wj
 H0G9nBkqJ3DGv4JCtPGfWZMCxugTMeowEtCySxPWhhnqvVo497lHtZ9K+
 uGycM+NnvDX+AVtbNbXo7QdfZ65N4133nmWtdyoIaSa5CaCKpiMqrLOPZ
 P08bNX0/B2tbwKGhA9j+7lJgXt2vzRoP5iOEZFoGoSP4uSOWa8u0ey0cI
 PqBWCsq+GaF3KvEDPKgVSKcDXn09d+HDH3A3Jo9BH9rlQPnGaJVeN4c/v
 yO2FbcDh+JEDZxo4vZ7qNMN8aKLey6/45aISuQCIXpBnBqgXmllxFTdRP w==;
X-CSE-ConnectionGUID: Mttoaf75SgWWgqVzy9TPHA==
X-CSE-MsgGUID: wbQJVBTuR5Kv9F96QtdqIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66791395"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66791395"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:48:17 -0800
X-CSE-ConnectionGUID: YKZrnzs9QOe/tIk6HrKFOQ==
X-CSE-MsgGUID: jKiFbNFdS0607Ig/TDtE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193429490"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:48:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:48:17 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 00:48:17 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:48:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANn0EapdzC7DqN7tJFsmXaZb077h9yng/4qp2P9PaHKuwTGx5vIELhQRc8fVo7OE7JLQrDIGbCqg91FJJkWvPV7dflw8jAooH0wkFTWvtnCqbGusLi03StlwdZSE3zNDAO8FmHXOKfSb2SnR7uU4ineThJYsBBtP0R1dx2lLPjVksXN+ppYTH31GNOxHADa+8fPhwdJKpLmW73ZhPtepG9NsDz21Hb0OKfWiMqMLrvXgBwbyxC3NnuyTdfrXWBZC3pRqtBnMMrcXPO9UdIJzxhoSOvYCeIQSjJay/WLuUEdu508PsjXLZ+EGbp8oFAog7Tm7OQ8whB3exc1PTRjkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgK2dCRXqNzILJgMJxmcF1C7jg4dILgU/ode8v52lis=;
 b=pH92LFOXvuoa3Uy7lymcCezrl4R0n7PcAHFV0ca40fJYEeBOo+ty2cJoedLpxz1RPnrv49vPkAo2DkneTM9q8AzzB/FL26T5xvOnFUWbk4NI4LRzsCZYB/egl7WQS2b4EzWBd+xiLoMsrWDHdlK3Depo38rWzajZL09CBnkcp6teYMQoSCNUcbK/Rh0cA6D9N95pk3QhO8jVc/eZYFEZFt4z/bmvufXipIBMZNyLSogfy6LyqrweYzSBSerhxr4kZ2RKBYp48a5OFdRjTg3JZmU9XNa63a8i4q/kCbP1LRvdX2n5Pbbul9hLVuxbDBVs8vGdqLXVX4HHdzXYvcpSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Tue, 2 Dec
 2025 08:48:10 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 08:48:10 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v9 10/10] tests/intel/xe_multi-gpusvm: Add SVM
 multi-GPU migration test
Thread-Topic: [PATCH i-g-t v9 10/10] tests/intel/xe_multi-gpusvm: Add SVM
 multi-GPU migration test
Thread-Index: AQHcYqEwFFWDg3W13kObrfrEgeQyuLUOC3+A
Date: Tue, 2 Dec 2025 08:48:09 +0000
Message-ID: <a3743d6d1f3290776a8c9015f58132f9fff2abb4.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-11-nishit.sharma@intel.com>
In-Reply-To: <20251201090201.326595-11-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|BY1PR11MB7981:EE_
x-ms-office365-filtering-correlation-id: 01da41bb-9606-4fb9-5116-08de317f8545
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?M3Q5Z3RnNE1TYzZ3YVU2VjFpUW05VCs3NGw4TlNhUlloT2ljWlM4TEpEYTBn?=
 =?utf-8?B?VmFnYnUwQ1FFY0IweFN1WHllRDBSTWZpK3p0SS9aR2pvQ3hpbjkwNGJEM1ps?=
 =?utf-8?B?ODVFa0U5eG8xT0ZUSWhqK3BTalNNZ0toMGxnMzNIMU9hT1BJSU1NZXVvc0hJ?=
 =?utf-8?B?elljTkZGU0V1VXNrREdqNFdqOUJpSXBqd1JIVTdFdy85R0VScVhDT0QxaWI1?=
 =?utf-8?B?WE5RT3hzdjFrTzlqNEZNSnFiWXM5dDNIZUlSaExEcUoxbVZ4ZUhRWXlBekVM?=
 =?utf-8?B?R09VMUhDSG1hMXZXcitPV3NISVBKNisyRWdsQldSY01EeEpDM2pJZ3p6VzFW?=
 =?utf-8?B?aFlFd3BkdkNqVm9tY0dhb3pzZ0toWU4zV0E4NkE3bTU1SzczMVhTWGZYTGlJ?=
 =?utf-8?B?bHZPam1XMXRkeDlBMUg2eG9zaTNmRlhNbXhCK1c3cTd1RzBodXFtVWt0YkN2?=
 =?utf-8?B?T3pWU2lPRm9nOGN2Q0FmNTR0Q1dqWGw1aHlBYys3TXdLMzhGQ0R5Ti8zNGY3?=
 =?utf-8?B?TGdZU1VIQnowQTRLUzB0WXV3UXE4eENza3lYZ3dZQll4dlQ5Nm9vd3hSSXla?=
 =?utf-8?B?TldpSjR3SkdLbFJLUVJNNjVBQ1JraUVlcytUa25IRUpWK2gvU25HQ2Vha2xI?=
 =?utf-8?B?Rkt4VnJsNVJoeU5KNG55MTAyKzdEYVRPZ2hnZWlFTVZSa3JSNGltYlhoQ2Yv?=
 =?utf-8?B?ZEhMb01nZWtmUVRwRTFDMEhjTWNubGJ2eTgyZHQrSWIza3lNekQzU1hIc1A5?=
 =?utf-8?B?bXZWNERZdzBJbDBua1JHSytRT0k4c2xSWG1tOWZySzBkZHZxQnpneXpPdWkw?=
 =?utf-8?B?cy9SU0I4Y1pHcDNBKzNZWGQ2Y1p5WVh6KzAyanRseWNqSk9yVDRDNTYycU9p?=
 =?utf-8?B?NkIrdmowSzl5YmJDajVKZHFyTkt3bTVIczZ5TUxObVpiWmNDSERDY09RS0pV?=
 =?utf-8?B?d3hUM0FoRnlkanVDK3RoR01adFBwWWtkdlhzcFpDZGh6T1FHRWRGUVdzT0Rx?=
 =?utf-8?B?ZE8wWCtMbzQyQklSNkRTeHlDUm9zL1pYSWIzaEZBTlJFRG9FTVhKaDNvNFow?=
 =?utf-8?B?MTMyNGxEM2R0WG5ZZUFmMVZiTGdNQlc4NU9sZWdPRm0wLzVLN29mRFQrdjQw?=
 =?utf-8?B?WlJFZ2pIQnlYMmFJem4zU3BCTjRjaHpTMXJ3Lzl1b1RSZmJ1NWxFb25DQlRD?=
 =?utf-8?B?ZkZwUG5aMXRvbVppWEZ5Vno3Y2NieW1XQU12d3RGT1BKekNheTVpRzZWZ1FE?=
 =?utf-8?B?Vm9lZC9xQUlYV09aSTk1ZzBtRnpLbUgrZW9WUGFmS2RCeUIrSTRnb0hobEdK?=
 =?utf-8?B?dXV4ei9aS0ltRHlJTXNKaG5rVzZjVkNQNEZBNXNCSVZNay9iSy9udlBOYjcr?=
 =?utf-8?B?QVhubWU5YURRYVR1NFFadEJCNURSVzNpSFdua2E4ek1ERCt6cktOK3Y4b3N0?=
 =?utf-8?B?NjFyMFpndFVaaFZYRDJmQVhNUWVMTGZJY0tjZjE3SE1LTisxekJVVmVJWnl1?=
 =?utf-8?B?RFNrbWF6K3JHTGkwMDkvMXZxdFRzUXRsL2JmU1AveHpuTzg5WFlkbHRvQ2V1?=
 =?utf-8?B?ajNMdm13QzJxVlVsSXpxL2RwNHlRWUpHVkh6eFhKNWt4aU1kcHA1Y3dKYnh6?=
 =?utf-8?B?azdTaVZZTXA1RDdnZ1gzODdvOE9BTXFlQXorNTVDZjN0K2dwRXpIMTlpdnR1?=
 =?utf-8?B?QnVMVG1WMHBESjJKdXIvbU9JYys3L0cxSmlFRTBYNzBLeElxclNtQjhVbkZP?=
 =?utf-8?B?dE9JQ0R3czRQRUlkTmNiOUdVOERqU0NUVkVIWXlISEs3eTNwOTR2MXRtWll0?=
 =?utf-8?B?aDVTY0cvZGx4dDg4cG13VkhmZElQOUk4dzNUa21HZUJOZjBtSDVsMC82LzJT?=
 =?utf-8?B?U3VURU81OWY2NkRHZm9OZ01OWVh0bFRrbW1Ob0IzOGRlclR5VXdEaGVnaENi?=
 =?utf-8?B?Y0xSYWFXZDg3ZVNKZmcrUXc0Q1VNUGJuSDQxanlWMG5kK1NtaCtIdTA3b1VY?=
 =?utf-8?B?MDFqVWJRZnJudnFvSHJ4NmtVZUJKMEx6NmFPQTAwVnRkWDBOaFhhQlk2cm9S?=
 =?utf-8?Q?Og0XoS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFl3SWRqQTFPQ2VnNTRmTVNuVm9FTWp6UTdPeW5mVkRqYWdPZDBLa2NDSEJp?=
 =?utf-8?B?NVBKaVRhYktBVkJkR2ZKczVtVlo3KzVqYzBXaWdNMXZzQzFpL1NXeVQwQkRX?=
 =?utf-8?B?ekNVM0I4Lzk2Tk5QWHhWY29QR2hGV2xoM05YNnFlbFBrTXRzSEdGWWJKQTBK?=
 =?utf-8?B?dC9zdVhQM01qSTZrV3VSRzVZK0JJRnY1QXRyVWpRNGVuOUFnRHhWaUFUaUNx?=
 =?utf-8?B?ZUdxemVDRlBYRldjZ01XdmdvRzR6Ry9lUFlpWWZ6TUFsUkpvMnhLVnhpRTdG?=
 =?utf-8?B?WE15eUJjcDlLNlhML2F0RG1RQlZtK0pBRTA5Wnd3MTlMRnQzemJTVEc3dklV?=
 =?utf-8?B?SG1ySUpzaUxGdlBrOGoyM283NE1ZRm9RQmlFWmJyd0wzL2FHN3pjTFVpSytw?=
 =?utf-8?B?b0lGWDFvOVJVQXJwZlRqaEhJVDdXcU1HZFVhT2ltOFl2dm5tc2lUZG5NdVlF?=
 =?utf-8?B?WjlMYm9TSDdwNmJoY0QxWDYyMnE0QUdQZlp3Z29ZalJVT1JCMjlDY2xxYmJp?=
 =?utf-8?B?dG92VlFCaEVjcUE3cDVUNFdSejljUE1EdFBzcituK2tBOG9LM2JRZ3NMOUgw?=
 =?utf-8?B?SmVnYjNWUGk2bWo1QWk1S25GOG5UeWp3ZHpyUDNOTjE5bGJUdUZ2ZktjY3RJ?=
 =?utf-8?B?b3dZZFNOcXFQUnVaclBJdTAza1d2TWQ3ZXp2TVR3eWt2d3lUOVkrTi9BQ0hL?=
 =?utf-8?B?RzhUYUN3TkpVT0IzNWp1Vk5iTUw1RXUvV1cxN2J3bmxJNXBERDRwSUVEeXU5?=
 =?utf-8?B?aVBTMHg1bGtkSWh3UGd0ZGo0eGhBSmJORkZ5YnVHckpOQXBkRVYxSjI2VHoz?=
 =?utf-8?B?c1lkUWoxME1MUUxDUEVYaC9PMVhZVGJ5K1djcjVETkJUQVdGMkI5dW1HRnVC?=
 =?utf-8?B?UXV1d2Nvczg2ODF5VXFHM2ZZTlV1ajNsakNtbzdnSU84QUFXM0JsMm5kNmg5?=
 =?utf-8?B?T0RHN0ZPU2tUTTBKYi9EOUcrT1hwSkVOaTJzaHpYcyt0TlMzditGbEp6dG43?=
 =?utf-8?B?VThsMXU2MDN3cXU3MmtGRElHYWtjeHFNMmp4SWl1NjJteVZSTVNjdDdTb3lt?=
 =?utf-8?B?SktMbVQraWhzMFZFZVpianNqaWxlejh4RGZlQ0Z5akEzUldmU1pHTVVld3FI?=
 =?utf-8?B?Yk1DZ0dQb3BiS0JCejBxV2JUdU5WbGt5WmltZzVrWW5jVXlBUFI5ODhLUGZa?=
 =?utf-8?B?ZEZlOHl0aWg0ejhUQUFCTEswYzNXTUxIYXhiQWovUWZCWUh1emtINSsrbGFk?=
 =?utf-8?B?RklSSTZkUWozSGtKWTJ0eEVNS2lnUWc1M2RwTXB4OUYxdnY5b1J6TVp5TDgr?=
 =?utf-8?B?ZTNIcHJ3cDc2dUZNMGt5Wm91d2ZLTU5RS1ZpMTU3YWM4ZzMzbDF0WVJ1RGVY?=
 =?utf-8?B?MWIzVjZDZWY4aEFld0dDWTBKQU0rUnNaNkZEeE0zcE1raFJWK0U1Qi9EVHl0?=
 =?utf-8?B?MTR1L2poZVFuNW1lOGE0L3hXNDhkTjVDdW5PUkVVY0JxdnZmdk81OXNhTlB3?=
 =?utf-8?B?Uis2WC85Yk1IV082dE5pb21EQUpMa1orMzgwYlF6QjB2b2VROTF4RTIyc3Bx?=
 =?utf-8?B?dEtKY1U5UUhXMXFRUW1FUFJ0Y2VtNDIybTZkMzlsYVM5UDJ0MjlQTlFKc1Vh?=
 =?utf-8?B?R3BDZ2kxeHIrS2dpN05aenMzaHpucE5ibUdNczJyR3RuYm05ekJrMXl6Wm51?=
 =?utf-8?B?NGdvK3IxQ1RiOTY3L1pFUDlIODJhVFZidEtuNEEraDZOVCtoM1ZjR212bENh?=
 =?utf-8?B?V0RIdFYvUVV2eXZSZEdLWU1sOTBwTWpSMnp1ZzB6RHZ2ZWR5VmxqT1hFbWp4?=
 =?utf-8?B?K0JRNmRHRDJ1bURGWm5qOXFCYXhVTU16Z25Oa1Awd2JWakY5TG5iSmR2YTc4?=
 =?utf-8?B?My8zRXUzeG9tYUtiWHBla2hNNDU4cytYUS9DWDBsVkdKQ25IUTlSb3czZ01T?=
 =?utf-8?B?d1VkVXErVEFvN0Y5bXRtdS91SFViTUcvMWhUWHpmaGFJc0xTYlBlSVlJQUVF?=
 =?utf-8?B?TFpoNUw3YkZ3RnJLQmV6NXZoZ2ltdzlUM3JLbTZvTmdMZXpXODZoTHc3dGh4?=
 =?utf-8?B?VmRrSi9tYXYvM2tHcUM3eGl2d1dwaTVWb2lOVlRvOWxpMGxaZ0RTeC9qcFNR?=
 =?utf-8?B?Q0xJSiszYjkyTXIzMWdxRXRHWW5VYWMrdzhIdWlva2xYQW5vWXNyU1NrQ296?=
 =?utf-8?Q?nVi0d9UsBzQEs9JrYfuYoXzQJKMI4pn4IkB7u74v6rY1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAC7216F5115EF49AF051E69F3CF6729@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01da41bb-9606-4fb9-5116-08de317f8545
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 08:48:09.9488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3IeXOz+5Wpa4iYMrjgCN6GTq0yvhb/YrV0cq4GMLF/YVR5AzI65qWbWq9CYnDiJ1ZlNd5/d9oclB4xYqnCONG2BGQ7tV49ckOCe63zTL0Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA5OjAyICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgYWxsb2NhdGVzIGEgYnVmZmVyIGluIFNWTSwgYWNjZXNzZXMgaXQg
ZnJvbSBHUFUgMSwgdGhlbiBHUFUNCj4gMg0KPiBhbmQgdGhlbiB0aGUgQ1BVLiBJdCB2ZXJpZmll
cyB0aGF0IHRoZSBidWZmZXIgbWlncmF0ZXMgY29ycmVjdGx5DQo+IGJldHdlZW4NCj4gZGV2aWNl
cyBhbmQgcmVtYWlucyBhY2Nlc3NpYmxlIGFjcm9zcyBhbGwgYWdlbnRzIGluIGENCj4gbXVsdGkt
R1BVIGVudmlyb25tZW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlzaGl0IFNoYXJtYSA8bmlz
aGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoHRlc3RzL2ludGVsL3hlX211bHRpX2dw
dXN2bS5jIHwgMTIyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMTIyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0KPiBiL3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2
bS5jDQo+IGluZGV4IDY4OGVlMDc1Ny4uZDdkNmFiMTE2IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9p
bnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVz
dm0uYw0KPiBAQCAtMTI3LDYgKzEyNywxOCBAQA0KPiDCoCAqIERlc2NyaXB0aW9uOg0KPiDCoCAq
CU11bHRpLUdQVSBwYWdlIGZhdWx0IHRlc3Qgd2l0aCBjb25mbGljdGluZyBtYWR2aXNlIHJlZ2lv
bnMNCj4gwqAgKg0KPiArICogU1VCVEVTVDogbWdwdS1taWdyYXRpb24tYmFzaWMNCj4gKyAqIERl
c2NyaXB0aW9uOg0KPiArICoJVGVzdCBidWZmZXIgbWlncmF0aW9uIGFjcm9zcyBtdWx0aXBsZSBH
UFVzIGFuZCBtZW1vcnkNCj4gZG9tYWlucw0KPiArICoJVmFsaWRhdGVzIHRoYXQgYSBzaGFyZWQg
YnVmZmVyIGNhbiBtaWdyYXRlIGJldHdlZW4gc3lzdGVtDQo+IG1lbW9yeSwNCj4gKyAqCUdQVTEg
VlJBTSwgYW5kIEdQVTIgVlJBTSB3aGlsZSBtYWludGFpbmluZyBkYXRhIGNvaGVyZW5jeS4NCj4g
KyAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1LW1pZ3JhdGlvbi1wcmVmZXRjaA0KPiArICogRGVzY3Jp
cHRpb246DQo+ICsgKglUZXN0IGJ1ZmZlciBtaWdyYXRpb24gYWNyb3NzIG11bHRpcGxlIEdQVXMg
d2l0aCBleHBsaWNpdA0KPiBwcmVmZXRjaCBvcGVyYXRpb25zDQo+ICsgKglTaW1pbGFyIHRvIG1n
cHUtbWlncmF0aW9uLWJhc2ljIGJ1dCB1c2VzDQo+IFhFX1ZNX1BSRUZFVENIX0FTWU5DIHRvIGV4
cGxpY2l0bHkNCj4gKyAqCXRyaWdnZXIgcGFnZSBtaWdyYXRpb24gYmVmb3JlIEdQVSBhY2Nlc3MN
Cj4gKyAqDQo+IMKgICovDQo+IMKgDQo+IMKgI2RlZmluZSBNQVhfWEVfUkVHSU9OUwk4DQo+IEBA
IC0xNTMsNiArMTY1LDcgQEANCj4gwqAjZGVmaW5lIE1VTFRJR1BVX1BGQVVMVF9PUAkJQklUKDgp
DQo+IMKgI2RlZmluZSBNVUxUSUdQVV9DT05DX0FDQ0VTUwkJQklUKDkpDQo+IMKgI2RlZmluZSBN
VUxUSUdQVV9DT05GTElDVAkJQklUKDEwKQ0KPiArI2RlZmluZSBNVUxUSUdQVV9NSUdSQVRFCQlC
SVQoMTEpDQo+IMKgDQo+IMKgI2RlZmluZSBJTklUCTINCj4gwqAjZGVmaW5lIFNUT1JFCTMNCj4g
QEAgLTIyMCw2ICsyMzMsMTAgQEAgc3RhdGljIHZvaWQgZ3B1X3NpbXVsdF90ZXN0X3dyYXBwZXIo
c3RydWN0DQo+IHhlX3N2bV9ncHVfaW5mbyAqc3JjLA0KPiDCoAkJCQnCoMKgwqAgc3RydWN0DQo+
IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gwqAJCQkJwqDCoMKgIHVuc2ln
bmVkIGludCBmbGFncyk7DQo+IMKgDQo+ICtzdGF0aWMgdm9pZCBncHVfbWlncmF0aW9uX3Rlc3Rf
d3JhcHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpzcmMsDQo+ICsJCQkJwqDCoMKgwqDCoMKg
IHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmRzdCwNCj4gKwkJCQnCoMKgwqDCoMKgwqAgc3RydWN0
DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJCQnCoMKgwqDCoMKg
wqAgdW5zaWduZWQgaW50IGZsYWdzKTsNCj4gwqBzdGF0aWMgdm9pZA0KPiDCoGNvbmZsaWN0aW5n
X21hZHZpc2Uoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gwqAJCcKgwqDCoCBzdHJ1
Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUyLA0KPiBAQCAtMTM3NCw2ICsxMzkxLDk1IEBAIGNvbmZs
aWN0aW5nX21hZHZpc2Uoc3RydWN0IHhlX3N2bV9ncHVfaW5mbw0KPiAqZ3B1MSwNCj4gwqAJY2xl
YW51cF92bV9hbmRfcXVldWUoZ3B1Miwgdm1bMV0sIGV4ZWNfcXVldWVbMV0pOw0KPiDCoH0NCj4g
wqANCj4gK3N0YXRpYyB2b2lkDQo+ICttdWx0aWdwdV9taWdyYXRlX3Rlc3Qoc3RydWN0IHhlX3N2
bV9ncHVfaW5mbyAqZ3B1MSwNCj4gKwkJwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZv
ICpncHUyLA0KPiArCQnCoMKgwqDCoMKgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3Rh
bmNlICplY2ksDQo+ICsJCcKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiArew0KPiAr
CXVpbnQ2NF90IGFkZHI7DQo+ICsJdWludDMyX3Qgdm1bMl0sIGV4ZWNfcXVldWVbMl0sIGJhdGNo
MV9ib1syXTsNCj4gKwl1aW50NjRfdCBiYXRjaDFfYWRkclsyXTsNCj4gKwl1aW50NjRfdCAqZGF0
YTsNCj4gKwl1aW50MzJfdCB0ZXN0X3BhdHRlcm5fc3lzLCB0ZXN0X3BhdHRlcm5fZ3B1MSwNCj4g
dGVzdF9wYXR0ZXJuX2dwdTI7DQo+ICsJdm9pZCAqY29weV9kc3Q7DQo+ICsJdWludDMyX3QgZmlu
YWxfdmFsdWU7DQo+ICsNCj4gKwl0ZXN0X3BhdHRlcm5fc3lzID0gMHgxMjM0NTY3ODsNCj4gKwl0
ZXN0X3BhdHRlcm5fZ3B1MSA9IDB4REVBREJFRUY7DQo+ICsJdGVzdF9wYXR0ZXJuX2dwdTIgPSAw
eENBRkVCQUJFOw0KPiArDQo+ICsJLyogU2tpcCBpZiBlaXRoZXIgR1BVIGRvZXNuJ3Qgc3VwcG9y
dCBmYXVsdHMgKi8NCj4gKwlpZiAoIWdwdTEtPnN1cHBvcnRzX2ZhdWx0cyB8fCAhZ3B1Mi0+c3Vw
cG9ydHNfZmF1bHRzKSB7DQo+ICsJCWlndF9kZWJ1ZygiQm90aCBHUFVzIG11c3Qgc3VwcG9ydCBw
YWdlIGZhdWx0cyBmb3INCj4gdGhpcyB0ZXN0XG4iKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4g
Kw0KPiArCWNyZWF0ZV92bV9hbmRfcXVldWUoZ3B1MSwgZWNpLCAmdm1bMF0sICZleGVjX3F1ZXVl
WzBdKTsNCj4gKwljcmVhdGVfdm1fYW5kX3F1ZXVlKGdwdTIsIGVjaSwgJnZtWzFdLCAmZXhlY19x
dWV1ZVsxXSk7DQo+ICsNCj4gKwlkYXRhID0gYWxpZ25lZF9hbGxvYyhTWl8yTSwgU1pfNEspOw0K
PiArCWlndF9hc3NlcnQoZGF0YSk7DQo+ICsJbWVtc2V0KGRhdGEsIDAsIFNaXzRLKTsNCj4gKwlh
ZGRyID0gdG9fdXNlcl9wb2ludGVyKGRhdGEpOw0KPiArDQo+ICsJY29weV9kc3QgPSBhbGlnbmVk
X2FsbG9jKFNaXzJNLCBTWl80Syk7DQo+ICsJaWd0X2Fzc2VydChjb3B5X2RzdCk7DQo+ICsNCj4g
KwlpZ3RfaW5mbygiPT09IFBoYXNlIDE6IFN5c3RlbSBNZW1vcnkg4oaSIEdQVTEgVlJBTSA9PT1c
biIpOw0KPiArDQo+ICsJLyogQ1BVIHdyaXRlcyBpbml0aWFsIHBhdHRlcm4gaW4gc3lzdGVtIG1l
bW9yeSAqLw0KPiArCVdSSVRFX09OQ0UoKih1aW50MzJfdCAqKWRhdGEsIHRlc3RfcGF0dGVybl9z
eXMpOw0KPiArCWlndF9pbmZvKCJDUFUgd3JvdGUgMHgleCB0byBzeXN0ZW0gbWVtb3J5XG4iLA0K
PiB0ZXN0X3BhdHRlcm5fc3lzKTsNCj4gKw0KPiArCS8qIEdQVTEgd3JpdGVzIG5ldyBwYXR0ZXJu
IC0gc2hvdWxkIGhhcHBlbiBpbiBHUFUxIFZSQU0gKi8NCj4gKwlzdG9yZV9kd29yZF9iYXRjaF9p
bml0KGdwdTEtPmZkLCB2bVswXSwgYWRkciwgJmJhdGNoMV9ib1swXSwNCj4gJmJhdGNoMV9hZGRy
WzBdLA0KPiArCQkJwqDCoMKgwqDCoMKgIHRlc3RfcGF0dGVybl9ncHUxKTsNCj4gKw0KPiArCS8q
R1BVMTogTWFkdmlzZSBhbmQgUHJlZmV0Y2ggT3BzIHdpdGggcHJlZmVycmVkIGxvY2F0aW9uDQo+
IEdQVTEgVlJBTSAqLw0KPiArCWdwdV9tYWR2aXNlX3N5bmMoZ3B1MSwgdm1bMF0sIGV4ZWNfcXVl
dWVbMF0sIGFkZHIsDQo+ICZiYXRjaDFfYWRkclswXSwgZmxhZ3MpOw0KPiArDQo+ICsJaWd0X2lu
Zm8oIj09PSBQaGFzZSAyOiBHUFUxIFZSQU0g4oaSIEdQVTIgVlJBTSA9PT1cbiIpOw0KPiArDQo+
ICsJLyogR1BVMjogY29weSBHUFUxJ3MgdmFsdWUgKi8NCj4gKwlncHVfYmF0Y2hfY3JlYXRlKGdw
dTIsIHZtWzFdLCBleGVjX3F1ZXVlWzFdLCBhZGRyLA0KPiB0b191c2VyX3BvaW50ZXIoY29weV9k
c3QpLA0KPiArCQkJICZiYXRjaDFfYm9bMV0sICZiYXRjaDFfYWRkclsxXSwgZmxhZ3MsDQo+IElO
SVQpOw0KPiArDQo+ICsJLypHUFUyOiBNYWR2aXNlIGFuZCBQcmVmZXRjaCBPcHMgd2l0aCBwcmVm
ZXJyZWQgbG9jYXRpb24NCj4gR1BVMiBWUkFNICovDQo+ICsJZ3B1X21hZHZpc2Vfc3luYyhncHUy
LCB2bVsxXSwgZXhlY19xdWV1ZVsxXSwNCj4gdG9fdXNlcl9wb2ludGVyKGNvcHlfZHN0KSwNCj4g
KwkJCSAmYmF0Y2gxX2FkZHJbMV0sIGZsYWdzKTsNCj4gKw0KPiArCS8qIFZlcmlmeSBHUFUxIHdy
b3RlIGNvcnJlY3RseSAqLw0KPiArCWZpbmFsX3ZhbHVlID0gKih1aW50MzJfdCAqKWNvcHlfZHN0
Ow0KPiArCS8vaWd0X2Fzc2VydF9lcV91MzIoUkVBRF9PTkNFKCoodWludDMyX3QgKiljb3B5X2Rz
dCksDQo+IHRlc3RfcGF0dGVybl9ncHUxKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxX3UzMihmaW5hbF92
YWx1ZSwgdGVzdF9wYXR0ZXJuX2dwdTEpOw0KPiArDQo+ICsJaWd0X2luZm8oIj09PSBQaGFzZSAz
OiBHUFUyIFZSQU0g4oaSIFN5c3RlbSBNZW1vcnkgPT09XG4iKTsNCj4gKw0KPiArCS8qIEdQVTEg
d3JpdGVzIG5ldyBwYXR0ZXJuIC0gc2hvdWxkIGhhcHBlbiBpbiBHUFUxIFZSQU0gKi8NCg0KU2hv
dWxkbid0IHRoaXMgc2F5IEdQVTEgVlJBTT8NCg0KV2l0aCB0aGF0IGZpeGVkDQpSZXZpZXdlZC1i
eTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0K
DQoNCg0KDQo+ICsJc3RvcmVfZHdvcmRfYmF0Y2hfaW5pdChncHUyLT5mZCwgdm1bMV0sDQo+IHRv
X3VzZXJfcG9pbnRlcihjb3B5X2RzdCksDQo+ICsJCQnCoMKgwqDCoMKgwqAgJmJhdGNoMV9ib1sx
XSwgJmJhdGNoMV9hZGRyWzFdLA0KPiB0ZXN0X3BhdHRlcm5fZ3B1Mik7DQo+ICsNCj4gKwkvKkdQ
VTI6IE1hZHZpc2UgYW5kIFByZWZldGNoIE9wcyB3aXRoIHByZWZlcnJlZCBsb2NhdGlvbg0KPiBH
UFUyIFZSQU0gKi8NCj4gKwlncHVfbWFkdmlzZV9zeW5jKGdwdTIsIHZtWzFdLCBleGVjX3F1ZXVl
WzFdLA0KPiB0b191c2VyX3BvaW50ZXIoY29weV9kc3QpLA0KPiArCQkJICZiYXRjaDFfYWRkclsx
XSwgZmxhZ3MpOw0KPiArDQo+ICsJLyogQ1BVIGFjY2VzcyBzaG91bGQgbWlncmF0ZSBiYWNrIHRv
IHN5c3RlbSBtZW1vcnkgKi8NCj4gKwlpZ3RfYXNzZXJ0X2VxX3UzMihSRUFEX09OQ0UoKih1aW50
MzJfdCAqKWNvcHlfZHN0KSwNCj4gdGVzdF9wYXR0ZXJuX2dwdTIpOw0KPiArDQo+ICsJaWd0X2lu
Zm8oIk1pZ3JhdGlvbiB0ZXN0IGNvbXBsZXRlZCBzdWNjZXNzZnVsbHlcbiIpOw0KPiArDQo+ICsJ
bXVubWFwKCh2b2lkICopYmF0Y2gxX2FkZHJbMF0sIEJBVENIX1NJWkUoZ3B1MS0+ZmQpKTsNCj4g
KwltdW5tYXAoKHZvaWQgKiliYXRjaDFfYWRkclsxXSwgQkFUQ0hfU0laRShncHUyLT5mZCkpOw0K
PiArCWJhdGNoX2ZpbmkoZ3B1MS0+ZmQsIHZtWzBdLCBiYXRjaDFfYm9bMF0sIGJhdGNoMV9hZGRy
WzBdKTsNCj4gKwliYXRjaF9maW5pKGdwdTItPmZkLCB2bVsxXSwgYmF0Y2gxX2JvWzFdLCBiYXRj
aDFfYWRkclsxXSk7DQo+ICsJZnJlZShkYXRhKTsNCj4gKwlmcmVlKGNvcHlfZHN0KTsNCj4gKw0K
PiArCWNsZWFudXBfdm1fYW5kX3F1ZXVlKGdwdTEsIHZtWzBdLCBleGVjX3F1ZXVlWzBdKTsNCj4g
KwljbGVhbnVwX3ZtX2FuZF9xdWV1ZShncHUyLCB2bVsxXSwgZXhlY19xdWV1ZVsxXSk7DQo+ICt9
DQo+ICsNCj4gwqBzdGF0aWMgdm9pZA0KPiDCoGdwdV9tZW1fYWNjZXNzX3dyYXBwZXIoc3RydWN0
IHhlX3N2bV9ncHVfaW5mbyAqc3JjLA0KPiDCoAkJwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV9zdm1f
Z3B1X2luZm8gKmRzdCwNCj4gQEAgLTE0NDYsNiArMTU1MiwxOCBAQCBncHVfc2ltdWx0X3Rlc3Rf
d3JhcHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvDQo+ICpzcmMsDQo+IMKgCW11bHRpZ3B1X2Fj
Y2Vzc190ZXN0KHNyYywgZHN0LCBlY2ksIGZsYWdzKTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMg
dm9pZA0KPiArZ3B1X21pZ3JhdGlvbl90ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVfaW5m
byAqc3JjLA0KPiArCQkJwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpkc3QsDQo+ICsJCQnC
oMKgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ICsJCQnCoMKg
IHVuc2lnbmVkIGludCBmbGFncykNCj4gK3sNCj4gKwlpZ3RfYXNzZXJ0KHNyYyk7DQo+ICsJaWd0
X2Fzc2VydChkc3QpOw0KPiArDQo+ICsJbXVsdGlncHVfbWlncmF0ZV90ZXN0KHNyYywgZHN0LCBl
Y2ksIGZsYWdzKTsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyB2b2lkDQo+IMKgdGVzdF9tZ3B1X2V4
ZWMoaW50IGdwdV9jbnQsIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdXMsDQo+IMKgCcKgwqDC
oMKgwqDCoCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiBAQCAt
MTQ2Myw2ICsxNTgxLDggQEAgdGVzdF9tZ3B1X2V4ZWMoaW50IGdwdV9jbnQsIHN0cnVjdA0KPiB4
ZV9zdm1fZ3B1X2luZm8gKmdwdXMsDQo+IMKgCQlmb3JfZWFjaF9ncHVfcGFpcihncHVfY250LCBn
cHVzLCBlY2ksDQo+IGdwdV9mYXVsdF90ZXN0X3dyYXBwZXIsIGZsYWdzKTsNCj4gwqAJaWYgKGZs
YWdzICYgTVVMVElHUFVfQ09OQ19BQ0NFU1MpDQo+IMKgCQlmb3JfZWFjaF9ncHVfcGFpcihncHVf
Y250LCBncHVzLCBlY2ksDQo+IGdwdV9zaW11bHRfdGVzdF93cmFwcGVyLCBmbGFncyk7DQo+ICsJ
aWYgKGZsYWdzICYgTVVMVElHUFVfTUlHUkFURSkNCj4gKwkJZm9yX2VhY2hfZ3B1X3BhaXIoZ3B1
X2NudCwgZ3B1cywgZWNpLA0KPiBncHVfbWlncmF0aW9uX3Rlc3Rfd3JhcHBlciwgZmxhZ3MpOw0K
PiDCoH0NCj4gwqANCj4gwqBzdHJ1Y3Qgc2VjdGlvbiB7DQo+IEBAIC0xNTA0LDYgKzE2MjQsOCBA
QCBpZ3RfbWFpbg0KPiDCoAkJeyAiY29uY3VycmVudC1hY2Nlc3MtYmFzaWMiLCBNVUxUSUdQVV9D
T05DX0FDQ0VTUyB9LA0KPiDCoAkJeyAiY29uY3VycmVudC1hY2Nlc3MtcHJlZmV0Y2giLCBNVUxU
SUdQVV9QUkVGRVRDSCB8DQo+IE1VTFRJR1BVX0NPTkNfQUNDRVNTIH0sDQo+IMKgCQl7ICJjb25j
dXJyZW50LWFjY2Vzcy1jb25mbGljdCIsIE1VTFRJR1BVX0NPTkZMSUNUIHwNCj4gTVVMVElHUFVf
Q09OQ19BQ0NFU1MgfSwNCj4gKwkJeyAibWlncmF0aW9uLWJhc2ljIiwgTVVMVElHUFVfTUlHUkFU
RSB9LA0KPiArCQl7ICJtaWdyYXRpb24tcHJlZmV0Y2giLCBNVUxUSUdQVV9QUkVGRVRDSCB8DQo+
IE1VTFRJR1BVX01JR1JBVEUgfSwNCj4gwqAJCXsgTlVMTCB9LA0KPiDCoAl9Ow0KPiDCoA0KDQo=
