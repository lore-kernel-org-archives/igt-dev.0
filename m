Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611836EB04
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 13:40:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g4so3863044wrs.5
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 06:40:16 -0700 (PDT)
References: <20200924123625.31755-1-petri.latvala@intel.com>
 <81475469-c5de-7c55-cee5-f33a96ba00ef@gmail.com>
 <20200924133629.GP7444@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <49b38b16-4a32-bccd-8452-90e8731408ae@gmail.com>
Date: Thu, 24 Sep 2020 16:40:05 +0300
MIME-Version: 1.0
In-Reply-To: <20200924133629.GP7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t RFC] lib/igt_chamelium: Use curl timeout
 for xmlrpc calls
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 24.9.2020 16.36, Petri Latvala wrote:
> On Thu, Sep 24, 2020 at 04:25:17PM +0300, Juha-Pekka Heikkila wrote:
>> I guess CI isn't going to run this code anywhere for now? The change look ok
>> to me. Assuming the results will be all green,
> 
> It will run this code everywhere where chamelium is deployed. What do
> you mean?

I didn't know there is any chamelium on those CI machines which will 
provide test results for this patch.

/Juha-Pekka

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
