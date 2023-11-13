Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741FA10E166
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 08:50:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------oTF55lUN40AYb88j0S00g8CC"
Message-ID: <a19bee97-4122-44e9-84f9-5d0040a05a57@intel.com>
Date: Mon, 13 Nov 2023 14:20:15 +0530
MIME-Version: 1.0
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231113081930.1189688-6-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20231113081930.1189688-6-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t,5/5] tests/kms_setmode: Fix Bigjoiner checks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------oTF55lUN40AYb88j0S00g8CC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/2023 1:49 PM, Bhanuprakash Modem wrote:
> Bigjoiner will come in the picture when the resolution > 5K or
> clock > max dot-clock. Add a support to check the selected mode
> clock is greater than the max dot-clock.
>
> V2: - Limit the bigjoiner checks to intel hardware
> V3: - Rebase
>
> Signed-off-by: Bhanuprakash Modem<bhanuprakash.modem@intel.com>

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

--------------oTF55lUN40AYb88j0S00g8CC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/13/2023 1:49 PM, Bhanuprakash
      Modem wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Bigjoiner will come in the picture when the resolution &gt; 5K or
clock &gt; max dot-clock. Add a support to check the selected mode
clock is greater than the max dot-clock.

V2: - Limit the bigjoiner checks to intel hardware
V3: - Rebase

Signed-off-by: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>
</pre>
    </blockquote>
    <br>
    <p>Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a><span
      style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------oTF55lUN40AYb88j0S00g8CC--
