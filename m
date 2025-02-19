Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9296BC021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 14:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5DD89580;
	Wed, 19 Feb 2025 14:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BVjBW0pI";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA7689137
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 14:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOD9rZRVI2zis0zkRhvMUWt3V1dpi5uaDvcJBY6bVChBkDdd/7FeP+qgLegEfhEikfiHIWbp17nJIXv0gWbC1fLL4v9Y7MOHPDwzWbHwAckVjFh7uCksfH5GFo2BV3qhnc13f5fIGw7r1oD/lIeCPENT+IRbgRXpiNUwVG6fnNbrbzLCdhp77r87qQ4J93ltjcrPC/dKJkzgKsJODCGbknuvUyrW2neLvkx4ZsAMnMG296bF9wfOBWRo34adCEAl2CX5PUFoQaosHyTK/1SUycz8+loICuOa/T0F2fiN+KFzHZa/yjkSAssOS+ol7VEVumexnPE5GCXdn8UZiYRXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBmFHRFK3SENyhnWPYE0A4LE3zY6Squz9ZyibohAFy0=;
 b=Gsx85u/LGjPBXhCrBNx+UacyvpIE6y5I0II9RoE2WQPpjFFb8R1ufnRmAR0kd9JWfyai0Lh4yJzq/2/I2Fmh7lLnwyP+ZHFjDQkum3WbLuI6GOSwYTpSt+u6a7vjKQM0jWuAn9b3LEX7vJQs5AaUFyek7U43C+GfJAvbyeKog75LZMEaRyu/8En/Hkn4YzWg5vkhIlMW+4nNyXNBopI/nq4IOp1ci32fKk9N1SElRgneiktsb7AWfJGmBBkdQCMTssV3N0E77Tq507HwFudJBRgHIpE03cyvdtCQX8giRwxg5KvWHIiNEyS3/qjR5hX6WxcOg6xqbsE6brQDIFjqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBmFHRFK3SENyhnWPYE0A4LE3zY6Squz9ZyibohAFy0=;
 b=BVjBW0pI81eBeJ80HqBymR2hFyl2gF2/m/10QxOx+n1PJaVFW83kTweyNf9fkQLKl/M917VKDlfuCxsO1A2/zXwu1++v1ZVKwBePnqMUexdjA9UA4LlNmZrpn+FemXfdbEoYLyho6N9Fjxqf+fMUMYsv8Q6qD7ODErRcyqYWMhc=
Received: from DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) by
 SJ2PR12MB8689.namprd12.prod.outlook.com (2603:10b6:a03:53d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 14:39:18 +0000
Received: from DS0PR12MB6534.namprd12.prod.outlook.com
 ([fe80::ea87:74ba:36ec:8cf6]) by DS0PR12MB6534.namprd12.prod.outlook.com
 ([fe80::ea87:74ba:36ec:8cf6%2]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 14:39:18 +0000
From: "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
To: Jani Nikula <jani.nikula@intel.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, Pranay Samala <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "kunal1.joshi@intel.com"
 <kunal1.joshi@intel.com>, "sameer.lattannavar@intel.com"
 <sameer.lattannavar@intel.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
Thread-Topic: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
Thread-Index: AQHbe84aB0joPkeF2ECIYMYu60zSLrNAsZAAgA4OYYA=
Date: Wed, 19 Feb 2025 14:39:18 +0000
Message-ID: <DS0PR12MB6534D129E88682D6235797089CC52@DS0PR12MB6534.namprd12.prod.outlook.com>
References: <20250128052825.424586-1-pranay.samala@intel.com>
 <abf8b026-20b6-4566-9823-bb558deb97a7@amd.com> <877c5x4wrv.fsf@intel.com>
In-Reply-To: <877c5x4wrv.fsf@intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=61518c5a-4f53-4440-9d09-002242c8db3c;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-02-19T14:38:47Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6534:EE_|SJ2PR12MB8689:EE_
x-ms-office365-filtering-correlation-id: fd67823b-bcaf-471c-91a7-08dd50f33109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?lmhvxv2lAF0ROvQh7vMdfIrvLXags4dUeppcc1tR8fzpe9+bnAti7Ev0X4?=
 =?iso-8859-1?Q?gmLugVZlYJStd/BJxV1WUKbpDALEwnSRzzXSujc+ZEIh5RGP9w3AiK9o3E?=
 =?iso-8859-1?Q?NS0FnueUWLDKrAruJ2G0EQwgxnwGXYrdsaR3hbiQSMHgYjXFa0jJ06/bfu?=
 =?iso-8859-1?Q?21HuJEjgh8ByibV+Vzf9vCN9l9sDIBVeR4UNPFiiPjmJEr9fwXELl1a1xn?=
 =?iso-8859-1?Q?4u4c0a6kZq98sr2iLqcKcdcOh0xJiUuV8HwD2G/Bko/SCcF/JrlurDNAss?=
 =?iso-8859-1?Q?fLSqnL83UB7eIzduTl+mkzjCyfC+QXK04szwU/IvZIxMNiV90JshGpRcb9?=
 =?iso-8859-1?Q?ajiYnsxJb7hYmsucsEt9GwQ89AqohU36YFJYaJqTGpMTgbV6/8J5wDUeFp?=
 =?iso-8859-1?Q?tNxKSLYiXQt/VYKUaUjuJMyIkZRCU4BL3+4ufONpf1l86EF7HgKsLxSBng?=
 =?iso-8859-1?Q?6V7sx3MWoaOLgEC2CR/yrZHf18/aCg+S3j4xG3F+xTY8MAfDFebsq6AdHu?=
 =?iso-8859-1?Q?Ott/5UaVJ2mpyUERuaIKH4P2FVRhWHSDIhPF2FWnJych+BokCjf/cfTcss?=
 =?iso-8859-1?Q?QU6rorQ2KQqmU2lvzLgk4Qwq5fakhTiNXMosuU6T8Ha+tcu6bmip8BAJww?=
 =?iso-8859-1?Q?MlJ/SRYIdI6yuuyiDpK80TkhoaJ4q+QroNPihO39OWqBBquGiEZCYPrEHH?=
 =?iso-8859-1?Q?U4RoWWVMST9/1QNO/6ByguWro49EJ2QVUkbzvGXx2hTvkHfGwXwmed50/J?=
 =?iso-8859-1?Q?7QyMPUKlAWMDH50enRY7mPbjuLKepG5yrnBtxLyiB0rJfU6A5uKgEkJY7R?=
 =?iso-8859-1?Q?R1MjszlUkp8r3nZ67LHgmBW/ud/4DBX81YVUU6OCLOjIJfJTGLoev37Xl9?=
 =?iso-8859-1?Q?CWV7u8OXs+10MXeGYh1Lk5VI4tpam+QdsmbtmsfXN2YpaEwxyslJkHwoES?=
 =?iso-8859-1?Q?i6YwG+WdKXQ54RWdZQQdhyAeS+TvvJP6QCm5GyP57wKsilsGZ273LTze7x?=
 =?iso-8859-1?Q?+VZINsBJWL+M6VEMzAJWpmgbno+lB+4X1jOfdXZUuaf6x11TIXko0TcMx1?=
 =?iso-8859-1?Q?qY549cdfLxwlqKe8WqC3sv1HQTUpCbRyTiO3JsepZunxuFt9+FpGh1f+VO?=
 =?iso-8859-1?Q?PkuvaHIhfMUcqqjyi9QKokJfp4o89MDGB2tgivWPHpaANie3RM5XFQbVJn?=
 =?iso-8859-1?Q?IDkC4PGi75c4j3d8EhAQ5Cq10wd/RgKFn8fyILpNUGWJ3ocYLU6t4XI/Zg?=
 =?iso-8859-1?Q?N3MLCBEQsEUnFiWyUWS9lojpLD7HW8+jIgDwPENRGR8SPTZ8+OgDKeiLb8?=
 =?iso-8859-1?Q?Fg2CmMBlxYT6BtGarVFYLgKSwaqnMOyoWZxO85YvGAcWTfB5eFESqgbFMv?=
 =?iso-8859-1?Q?Bku883eP+6pT2GRY+K415ugSAs7uT2igJwCYI66y0hDSiPYHr+OiRnwATe?=
 =?iso-8859-1?Q?SILilKhvDwfDMage?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6534.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?odZdX8LGsxh6yMyYFrtZH6sPOjuVsjNYXk5PekFOv2vKnYJOMCOwI4hJN6?=
 =?iso-8859-1?Q?mk/t2TRXzSho/tefqrVOZIadWVh4Cq4Yw48fTaZln3vBCZxAobASPuA6Gx?=
 =?iso-8859-1?Q?rYKr7xnPVMgxP/AFBTm0/clEXJVQ0ZM/dHItiCS04JTIs8Tp4oV2nz9XuO?=
 =?iso-8859-1?Q?zP+s4/neTPH/wjxccDLwD8pSj5jxQGmyujEDxfZfBPgAf2gMrF8ORS2yUh?=
 =?iso-8859-1?Q?hZEQphQHZahM/WNJI9dmO4DBsuFIYVQ7dLMrxMwte9woGdyMA9GFh9lzJ3?=
 =?iso-8859-1?Q?mhmoXgfOaz+ffzM7xjiEmAneOlHmldK6hxFw524XepXQOQYiv6IRyPQb3F?=
 =?iso-8859-1?Q?eNHyNUDPgr0SP3uslpolvZznG1kWAKVrlU6WUg7EmDAP2LwwBCfhE/ewSl?=
 =?iso-8859-1?Q?whLjwDXKreyXlZvW3AWfhKMxf2eIyc2poGAQOIDgmW4LNqUfxIlQYvlgEO?=
 =?iso-8859-1?Q?zqUkUznHOL/bS8zzlH2yufH4tZfOWtBEdoZ5amUR8YP4p1+A/uK+gQPm7g?=
 =?iso-8859-1?Q?zhrItmhUIMPCPAPeA2eNTHEzkFUO86l9lzuSOtnpUd6RNBQCrd12N6h+vS?=
 =?iso-8859-1?Q?pMDCTyikAC5Sx1O6UhGLzttPyd+sRNnIysrnGwoGRxs+E1OImzfH67RQLZ?=
 =?iso-8859-1?Q?vsnikM9FXCSwaPoqjb6zDvnTAHF2vWJRbcXZDVu6vZv5cY1VLeZiJvZ+OU?=
 =?iso-8859-1?Q?UaPai5cblOl2t5eybDXDtqJJp7aTZtDycaqudGKbyvTRQ7tyqbJ1e9AfGG?=
 =?iso-8859-1?Q?Ki6pqvAOKnud/8m4qvgD90+WrGp/TO4xfEQjH8hM0V2pXRtaVa3ljVd5b9?=
 =?iso-8859-1?Q?qdkku33NmJZdMt1l0x8lYNFr8gEwniP60LjAhab7S5ZEBTe4mrP6MQn1S4?=
 =?iso-8859-1?Q?+bHBqSR63o4moS8n2hiZmhdCdZEhim3G6a6YA5dpwr43Eq1JeMNnwQTtg+?=
 =?iso-8859-1?Q?cOd5fJMrAdILUnvc4BO8u2tM3cPo+JsjoGxXLGqjk1WWkaHUx9jej98zwX?=
 =?iso-8859-1?Q?Hk41A0wwUCoQUFN5mXH0KNQ7LZPpCdNEanJEN8Vrymzn/w+52WJJTkofcO?=
 =?iso-8859-1?Q?LsQzL8qLW4zBzb1b6X+9KSRbFR6WplBUfwnVCRdvK4CYjXX/7gIiYZic+i?=
 =?iso-8859-1?Q?NZe3P65ZQ1PjY83CLNNYJSTsDSfRSGucuNMbh9WIJk2uGgEDKvqhflzeHu?=
 =?iso-8859-1?Q?uMsFdXSV4uXVae+pZxz7qfeqKMjJOr4+Vyvu2PFWJ3ICnq+Sj/4KOQKJ/T?=
 =?iso-8859-1?Q?M9QqU4lAWNbi1yl8v1rJ3XJ+8SS+icAfxa043TfhUpNioOmjc4gI+aMaly?=
 =?iso-8859-1?Q?NPT6EXAkHXM+PGUPdDCepOZMftYOEr7n0ZPLT5/bJuujJou0x7oJg/ebjN?=
 =?iso-8859-1?Q?x6hMrxP3h20Tvi57veDAPQP9i7KVYpJNOuQX4fKNn+T2oGoAQ0hEriFLzi?=
 =?iso-8859-1?Q?lWVrTkCytfjenvgo83WO1iLBfIyVNboGJvxdFihiIfHN+o4cW6Y+6JERkr?=
 =?iso-8859-1?Q?peufifAeYePWMami4TDK+p3R5fnjQCwTzHJ8FAfMAxRLRLuR5NPHamxRqS?=
 =?iso-8859-1?Q?WZpyAvZk2L7FEbQ2cdfeKg2C2DJvpVkpreJorq0myRfdkhn5QRct0ucBVD?=
 =?iso-8859-1?Q?3AMdRj5AsJ0Do=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6534.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd67823b-bcaf-471c-91a7-08dd50f33109
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 14:39:18.6099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/pPautTJR0Z1YsKnjQpcMEhI2N/iBTMJ1NE6nNt+jYtkPV1CiwhNMc36JwHf03VsWphkcxhC4MTUm6sGU6X9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8689
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

[Public]

Hey just checking  in to see if there has been any movement on this one. I'=
m still having to revert it from my local IGT repo or my runs take three ti=
mes as long to complete/logs end up 10,000 times larger than they should be=
.

Thank you,

Dan Wheeler
Sr. Technologist  |  AMD
SW Display
---------------------------------------------------------------------------=
---------------------------------------
1 Commerce Valley Dr E, Thornhill, ON L3T 7X6
Facebook |  Twitter |  amd.com


-----Original Message-----
From: Jani Nikula <jani.nikula@intel.com>
Sent: Monday, February 10, 2025 10:58 AM
To: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Pranay Samala <pranay.samala@i=
ntel.com>; igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com; kunal1.joshi@intel.com; sameer.lattannavar@intel=
.com; Wheeler, Daniel <Daniel.Wheeler@amd.com>; Bhanuprakash Modem <bhanupr=
akash.modem@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.com>; =
Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>; Ashutosh Dixit <ashutos=
h.dixit@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel d=
ynamically

On Mon, 10 Feb 2025, Leo Li <sunpeng.li@amd.com> wrote:
> Hi Pranay,
>
> This change can also increase log verbosity; we observe this with amdgpu.
> Details inline.
>
> On 2025-01-28 00:28, Pranay Samala wrote:
>> This test is getting killed due to exceeding disk usage limit on CI
>> environment because its logging to many logs.
>>
>> So dynamically reducing the debug log level to 10.
>>
>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>> ---
>>   tests/kms_cursor_legacy.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index 1f082df2d..533972cd4 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -40,6 +40,7 @@
>>   #include "igt_psr.h"
>>   #include "igt_rand.h"
>>   #include "igt_stats.h"
>> +#include "igt_sysfs.h"
>>
>>   /**
>>    * SUBTEST: %s-%s
>> @@ -1840,6 +1841,7 @@ igt_main
>>      };
>>
>>      igt_fixture {
>> +            int dir, current_log_level;
>>              display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>>              kmstest_set_vt_graphics_mode();
>>
>> @@ -1850,6 +1852,15 @@ igt_main
>>               * fetch is enabled, so switching PSR1 for this whole test.
>>               */
>>              intel_psr2_restore =3D i915_psr2_sel_fetch_to_psr1(display.=
drm_fd,
>> NULL);
>> +
>> +            dir =3D igt_sysfs_drm_module_params_open();
>> +            if (dir >=3D 0) {
>> +                    current_log_level =3D igt_drm_debug_level_get(dir);
>> +                    close(dir);
>> +
>> +                    if (current_log_level > 10)
>> +                            igt_drm_debug_level_update(10);
>
> Isn't the DRM debug mask a bitmask?
> https://elixir.bootlin.com/linux/v6.13.1/source/include/drm/drm_print.
> h#L97
>
> So setting 10 isn't guaranteed to reduce verbosity, depending on how
> the DRM driver uses the various drm_* debug prints.

Ugh. Yes.

> What is guaranteed to reduce verbosity is to unset unwanted bits.
> Maybe that is the better approach?
>
> For example, instead of
> `if (current_log_level > 10)`,
>
> Do
>
> `igt_drm_debug_level_update(current_log_level & !(DRM_UT_CORE | ...);`

Ditto for commit a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug=
 loglevel dynamically"). It got to v6 and nobody noticed?

Ditto for commit 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment=
 of debug log level") adding the whole thing. It should not be referred to =
as "level" because it has nothing to do with "level". It also makes no sens=
e to print it out in decimal; hex makes more sense.


BR,
Jani.


>
> Thanks,
> Leo
>
>> +            }
>>      }
>>
>>      igt_describe("Test checks how many cursor updates we can fit betwee=
n vblanks "
>

--
Jani Nikula, Intel
