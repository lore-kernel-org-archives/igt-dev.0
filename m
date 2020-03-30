Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AA989D57
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2020 11:40:42 +0000 (UTC)
Date: Mon, 30 Mar 2020 14:40:38 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200330114038.GE9497@platvala-desk.ger.corp.intel.com>
References: <20200330081707.3084-1-mika.kahola@intel.com>
 <20200330090752.GC9497@platvala-desk.ger.corp.intel.com>
 <b4b323c452084747aa4a0b52e985662c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4b323c452084747aa4a0b52e985662c@intel.com>
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 01:06:40PM +0300, Kahola, Mika wrote:
> I noticed that pipe B was failing with other platforms as well, not
> just with HSW. Bandwidth calculation within fixture fixed the other
> platforms that was failing as well as my local HSW machine. I think
> it is unnecessary to calculate bandwidth for older platforms. We
> have seen these issues only with gen11+.

I mean what was the crashing operation and the reason that was
reached? Dividing by zero? Buffer overflow when reading because some
array index was too big?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
