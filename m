Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
In-Reply-To: <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
 <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
 <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
Date: Mon, 15 Jan 2024 09:21:35 +0200
Message-ID: <87mst7rri8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 15 Jan 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> On 1/12/24 15:29, Lucas De Marchi wrote:
>>> On such case, you should document kunit_debugfs at Documentation/ABI.
>>
>> debugfs is not part of ABI.
>
> That's arguable. Check Documentation/ABI and you'll see several debugfs 
> nodes documented there.

I guess you could argue documenting your debugfs under Documentation/ABI
makes it ABI, but I'd avoid doing that. Usually we use debugfs precisely
to avoid the burden of ABI and all the baggage that brings.


BR,
Jani.


-- 
Jani Nikula, Intel

