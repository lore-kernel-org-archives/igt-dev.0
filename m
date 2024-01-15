Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="------------gaIuI3Vx5iBBPb12CDUDuDOK"
Message-ID: <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
Date: Mon, 15 Jan 2024 08:08:55 +0100
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
 <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------gaIuI3Vx5iBBPb12CDUDuDOK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/24 15:29, Lucas De Marchi wrote:
>> On such case, you should document kunit_debugfs at Documentation/ABI.
>
> debugfs is not part of ABI.

That's arguable. Check Documentation/ABI and you'll see several debugfs 
nodes documented there.

$ ./scripts/get_abi.pl rest|grep debugfs|wc -l
162

Regards,
Mauro


--------------gaIuI3Vx5iBBPb12CDUDuDOK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/12/24 15:29, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h">
      <blockquote type="cite" style="color: #007cff;">On such case, you
        should document kunit_debugfs at Documentation/ABI.
        <br>
      </blockquote>
      <br>
      debugfs is not part of ABI. <br>
    </blockquote>
    <p>That's arguable. Check Documentation/ABI and you'll see several
      debugfs nodes documented there.</p>
    <p>$ ./scripts/get_abi.pl rest|grep debugfs|wc -l<br>
      162<br>
      <br>
    </p>
    <p>Regards,<br>
      Mauro<br>
    </p>
    <br>
  </body>
</html>

--------------gaIuI3Vx5iBBPb12CDUDuDOK--
