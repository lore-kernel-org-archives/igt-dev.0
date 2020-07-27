Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9B989C99
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2020 07:31:47 +0000 (UTC)
References: <20200721015717.46279-1-umesh.nerlige.ramappa@intel.com>
 <20200721015717.46279-2-umesh.nerlige.ramappa@intel.com>
 <1b566afd-4806-cad9-1a55-e54bf3fdb1d9@intel.com>
 <20200724233319.GA45897@orsosgc001.amr.corp.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <ca4faede-36f3-30b3-86c0-194459cc0708@intel.com>
Date: Mon, 27 Jul 2020 10:31:45 +0300
MIME-Version: 1.0
In-Reply-To: <20200724233319.GA45897@orsosgc001.amr.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH 2/2] i915/perf: Sanity check reports in mapped
 OA buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0265589332=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0265589332==
Content-Type: multipart/alternative;
 boundary="------------7D68D3660B1D210E9312ADDF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7D68D3660B1D210E9312ADDF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/07/2020 02:33, Umesh Nerlige Ramappa wrote:
>>
>> 16Mb * 256 = 4Gb
>>
>> That way you verify that we're not leaking GGTT space when closing 
>> the perf fd.
>>
>> You might want to tweak the noa_wait sysfs value before/after the loop.
>>
>> This might also only work on !32bits machines with enough memory...
>>
>
> Looks like calling close() in the above sequence will not result in a 
> call to i915_perf_release (because mmap holds a reference to the file).
> Based on the latest patch series in the mailing list, if you see 
> something we can add, please let me know. Note that we block mremap of 
> an mmap-ped address by setting VM_DONTEXPAND in i915 perf mmap 
> implementation.
>
> Thanks,
> Umesh 

Oh thanks for reminding me :)

Since mmap holds a ref that means nobody will be able to open the stream 
once more until munmap is called.

So there won't be any GGTT space leakage and it's all good.


Forget my request then.

Thanks!


-Lionel


--------------7D68D3660B1D210E9312ADDF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 25/07/2020 02:33, Umesh Nerlige
      Ramappa wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200724233319.GA45897@orsosgc001.amr.corp.intel.com">
      <blockquote type="cite" style="color: #000000;"><br>
        16Mb * 256 = 4Gb
        <br>
        <br>
        That way you verify that we're not leaking GGTT space when
        closing the perf fd.
        <br>
        <br>
        You might want to tweak the noa_wait sysfs value before/after
        the loop.
        <br>
        <br>
        This might also only work on !32bits machines with enough
        memory...
        <br>
        <br>
      </blockquote>
      <br>
      Looks like calling close() in the above sequence will not result
      in a call to i915_perf_release (because mmap holds a reference to
      the file).  <br>
      Based on the latest patch series in the mailing list, if you see
      something we can add, please let me know. Note that we block
      mremap of an mmap-ped address by setting VM_DONTEXPAND in i915
      perf mmap implementation.
      <br>
      <br>
      Thanks,
      <br>
      Umesh
    </blockquote>
    <p>Oh thanks for reminding me :)</p>
    <p>Since mmap holds a ref that means nobody will be able to open the
      stream once more until munmap is called.</p>
    <p>So there won't be any GGTT space leakage and it's all good.</p>
    <p><br>
    </p>
    <p>Forget my request then.</p>
    <p>Thanks!</p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
  </body>
</html>

--------------7D68D3660B1D210E9312ADDF--

--===============0265589332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0265589332==--
