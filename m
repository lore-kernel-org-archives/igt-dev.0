Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4320510E1E5
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 08:23:14 +0000 (UTC)
Date: Thu, 17 Nov 2022 10:23:25 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Craig Small <csmall@dropbear.xyz>
Message-ID: <Y3XvfbdbF5qyitOQ@platvala-desk.ger.corp.intel.com>
References: <CALy8Cw536QRzgQywc8B_PcVwA5GfvOy4nTHURLxFM-orDuWi8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALy8Cw536QRzgQywc8B_PcVwA5GfvOy4nTHURLxFM-orDuWi8g@mail.gmail.com>
Subject: Re: [igt-dev] PATCH i-g-t Use the new procps library libproc2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 05:03:57PM +1100, Craig Small wrote:
> Hi,
>   Attached is a patch for i-g-t so that it can use the old libprocps or new
> libproc2 library. I have had two people test it at [1] and said it was ok,
> besides myself compiling it.

Hi, thanks for the patch! I'll send that again later to the mailing
list in a form that patchwork recognizes.

What is the current distro availability status of libproc2? I can't
find it at all in Ubuntu, it seems to be in experimental repo only in
Debian, and I have no idea about the others.


-- 
Petri Latvala
