Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F27689170
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2020 12:11:51 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 30 Mar 2020 12:11:48 +0000
Message-ID: <40bcde68191c447699061d60f4760302@intel.com>
References: <20200330081707.3084-1-mika.kahola@intel.com>
 <20200330090752.GC9497@platvala-desk.ger.corp.intel.com>
 <b4b323c452084747aa4a0b52e985662c@intel.com>
 <20200330114038.GE9497@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200330114038.GE9497@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_concurrent: Move bandwidth
 calculation to igt_fixture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com> 
Sent: Monday, March 30, 2020 2:41 PM
To: Kahola, Mika <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org; juhapekka.heikkila@gmail.com; Lisovskiy, Stanislav <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_concurrent: Move bandwidth calculation to igt_fixture

On Mon, Mar 30, 2020 at 01:06:40PM +0300, Kahola, Mika wrote:
> I noticed that pipe B was failing with other platforms as well, not 
> just with HSW. Bandwidth calculation within fixture fixed the other 
> platforms that was failing as well as my local HSW machine. I think it 
> is unnecessary to calculate bandwidth for older platforms. We have 
> seen these issues only with gen11+.

I mean what was the crashing operation and the reason that was reached? Dividing by zero? Buffer overflow when reading because some array index was too big?

I was thinking that we iterate usually only once and the whole idea of the test is to draw planes and concurrently switch resolutions from higher to lower and back. Maybe we just need to keep child process running while switching resolution? I tested this with a patch that increased to number of child process iterations to 5 instead of 1. Let's see, what CI thinks about this idea. 

Anyway, I need to run these tests in CI  as I cannot produce these errors locally on HSW that shows problematic behavior.

--
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
